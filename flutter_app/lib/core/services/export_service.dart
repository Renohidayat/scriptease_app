import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class ExportService {
  final Dio _dio;

  ExportService(this._dio);

  Future<void> exportDocument({
    required String deltaJson,
    required String format, // 'docx' or 'pdf'
    List<Map<String, dynamic>> citations = const [],
  }) async {
    // 1. Pick where to save the file
    final String? savePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Document as $format',
      fileName: 'document.$format',
      type: FileType.custom,
      allowedExtensions: [format],
    );

    if (savePath == null) {
      // User canceled the picker
      return;
    }

    try {
      // 2. Call backend export endpoint
      final response = await _dio.post(
        'http://127.0.0.1:8765/api/v1/documents/export',
        data: {
          'delta_json': deltaJson,
          'format': format,
          'citations': citations,
        },
        options: Options(
          responseType: ResponseType.bytes, // Important for downloading files
        ),
      );

      // 3. Save the received bytes to the selected path
      final file = File(savePath);
      await file.writeAsBytes(response.data);
      
    } catch (e) {
      throw Exception('Failed to export document: $e');
    }
  }
}
