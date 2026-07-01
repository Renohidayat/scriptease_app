from fastapi import APIRouter, HTTPException, BackgroundTasks
from fastapi.responses import FileResponse
from pydantic import BaseModel
import os
import uuid
import tempfile
from typing import List

from app.services.document.export_service import ExportService

router = APIRouter()

class CitationItem(BaseModel):
    cite_key: str
    apa_full: str

class ExportRequest(BaseModel):
    delta_json: str
    format: str = "docx" # or "pdf"
    citations: List[CitationItem] = []

@router.post("/export")
async def export_document(request: ExportRequest, background_tasks: BackgroundTasks):
    """
    Exports a Quill Delta JSON to DOCX or PDF.
    Returns the file directly.
    """
    if request.format not in ["docx", "pdf"]:
        raise HTTPException(status_code=400, detail="Invalid format. Use 'docx' or 'pdf'.")
        
    # Create temporary files
    tmp_dir = tempfile.gettempdir()
    file_id = str(uuid.uuid4())
    docx_path = os.path.join(tmp_dir, f"{file_id}.docx")
    pdf_path = os.path.join(tmp_dir, f"{file_id}.pdf")
    
    # Generate DOCX
    try:
        ExportService.generate_docx(request.delta_json, [c.dict() for c in request.citations], docx_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to generate DOCX: {str(e)}")
        
    final_path = docx_path
    media_type = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    filename = "document.docx"
    
    # Generate PDF if requested
    if request.format == "pdf":
        success = ExportService.generate_pdf_from_docx(docx_path, pdf_path)
        if not success:
            # Fallback to docx if pdf conversion fails (e.g. Word not installed)
            final_path = docx_path
            filename = "document_fallback.docx"
        else:
            final_path = pdf_path
            media_type = "application/pdf"
            filename = "document.pdf"
            
    # Cleanup files after sending
    def cleanup():
        if os.path.exists(docx_path):
            os.remove(docx_path)
        if os.path.exists(pdf_path):
            os.remove(pdf_path)
            
    background_tasks.add_task(cleanup)
    
    return FileResponse(
        path=final_path,
        filename=filename,
        media_type=media_type
    )
