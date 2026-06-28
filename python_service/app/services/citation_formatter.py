"""
Citation Formatter Service

Uses Jinja2 templates to convert raw metadata extracted from Zotero
into formatted academic citation strings (APA, IEEE, etc.).
"""

from jinja2 import Template

# Template for APA 7th Edition
# Format: Author(s). (Year). Title. Journal, Volume(Issue), Pages. DOI/URL
APA_TEMPLATE = Template(
    "{% if authors %}{{ authors }}. {% endif %}"
    "({% if year %}{{ year }}{% else %}n.d.{% endif %}). "
    "{{ title }}. "
    "{% if journal %}*{{ journal }}*, {% endif %}"
    "{% if volume %}*{{ volume }}*{% endif %}"
    "{% if issue %}({{ issue }}){% endif %}"
    "{% if pages %}, {{ pages }}{% endif %}. "
    "{% if doi %}https://doi.org/{{ doi }}{% elif url %}{{ url }}{% endif %}"
)

# Template for IEEE
# Format: [1] Initial. Lastname, "Title," Journal, vol., no., pp., Year.
IEEE_TEMPLATE = Template(
    "{% if authors %}{{ authors }}, {% endif %}"
    '"{{ title }}," '
    "{% if journal %}*{{ journal }}*, {% endif %}"
    "{% if volume %}vol. {{ volume }}, {% endif %}"
    "{% if issue %}no. {{ issue }}, {% endif %}"
    "{% if pages %}pp. {{ pages }}, {% endif %}"
    "{% if year %}{{ year }}.{% endif %}"
)

# Template for Chicago 17th Edition
# Format: Lastname, Firstname. "Title." Journal Volume, no. Issue (Year): Pages. DOI/URL.
CHICAGO_TEMPLATE = Template(
    "{% if authors %}{{ authors }}. {% endif %}"
    '"{{ title }}." '
    "{% if journal %}*{{ journal }}* {% endif %}"
    "{% if volume %}{{ volume }}{% endif %}"
    "{% if issue %}, no. {{ issue }} {% endif %}"
    "{% if year %}({{ year }}): {% endif %}"
    "{% if pages %}{{ pages }}. {% endif %}"
    "{% if doi %}https://doi.org/{{ doi }}{% elif url %}{{ url }}.{% endif %}"
)

# Template for Indonesian Standard (Depdiknas / SKRIPSI format fallback)
# Format: Lastname, Firstname. Year. Title. Journal Volume(Issue), Pages.
INDONESIA_TEMPLATE = Template(
    "{% if authors %}{{ authors }}. {% endif %}"
    "{% if year %}{{ year }}. {% endif %}"
    "{{ title }}. "
    "{% if journal %}*{{ journal }}* {% endif %}"
    "{% if volume %}{{ volume }}{% endif %}"
    "{% if issue %}({{ issue }}){% endif %}"
    "{% if pages %}, {{ pages }}.{% endif %}"
)


def format_apa_authors(author_list: list[str]) -> str:
    """Format authors list for APA style.
    Expects list of strings in format 'Lastname, Firstname'
    Converts to 'Lastname, F. I., & Lastname, F. I.'
    """
    if not author_list:
        return ""
    
    formatted = []
    for author in author_list:
        parts = author.split(',')
        if len(parts) == 2:
            last = parts[0].strip()
            first = parts[1].strip()
            # Extract initials
            initials = " ".join([f"{name[0].upper()}." for name in first.split() if name])
            formatted.append(f"{last}, {initials}")
        else:
            formatted.append(author.strip())
            
    if len(formatted) == 1:
        return formatted[0]
    elif len(formatted) == 2:
        return f"{formatted[0]} & {formatted[1]}"
    elif len(formatted) > 20:
        # APA 7th style for 21+ authors
        return f"{', '.join(formatted[:19])}, ... {formatted[-1]}"
    else:
        return f"{', '.join(formatted[:-1])}, & {formatted[-1]}"

def format_ieee_authors(author_list: list[str]) -> str:
    """Format authors list for IEEE style.
    Expects 'Lastname, Firstname'
    Converts to 'F. I. Lastname and F. I. Lastname'
    """
    if not author_list:
        return ""
        
    formatted = []
    for author in author_list:
        parts = author.split(',')
        if len(parts) == 2:
            last = parts[0].strip()
            first = parts[1].strip()
            initials = " ".join([f"{name[0].upper()}." for name in first.split() if name])
            formatted.append(f"{initials} {last}")
        else:
            formatted.append(author.strip())
            
    if len(formatted) == 1:
        return formatted[0]
    elif len(formatted) == 2:
        return f"{formatted[0]} and {formatted[1]}"
    elif len(formatted) >= 3:
        # IEEE usually uses et al. for 3+ or 6+ depending on exact rule, 
        # but let's just use "and" for the last one if we print all
        return f"{', '.join(formatted[:-1])}, and {formatted[-1]}"
    return ""


class CitationFormatter:
    """Service to format citation metadata into various styles."""
    
    @staticmethod
    def format_citation(metadata: dict, style: str = "APA") -> str:
        """
        Formats raw metadata dictionary into a citation string.
        Supported styles: APA, IEEE, Chicago, Indonesia
        """
        style = style.upper()
        
        # Extract base fields
        title = metadata.get("title", "Untitled")
        year = metadata.get("year", "")
        journal = metadata.get("journal", "")
        volume = metadata.get("volume", "")
        issue = metadata.get("issue", "")
        pages = metadata.get("pages", "")
        doi = metadata.get("doi", "")
        url = metadata.get("url", "")
        raw_authors = metadata.get("authors", [])
        
        # Prepare template context
        context = {
            "title": title,
            "year": year,
            "journal": journal,
            "volume": volume,
            "issue": issue,
            "pages": pages,
            "doi": doi,
            "url": url,
            "authors": ""
        }
        
        # Render based on style
        if style == "APA":
            context["authors"] = format_apa_authors(raw_authors)
            result = APA_TEMPLATE.render(**context)
        elif style == "IEEE":
            context["authors"] = format_ieee_authors(raw_authors)
            result = IEEE_TEMPLATE.render(**context)
        elif style == "CHICAGO":
            # For simplicity, using APA author format for Chicago fallback
            context["authors"] = format_apa_authors(raw_authors)
            result = CHICAGO_TEMPLATE.render(**context)
        elif style == "INDONESIA":
            context["authors"] = format_apa_authors(raw_authors)
            result = INDONESIA_TEMPLATE.render(**context)
        else:
            # Fallback to APA
            context["authors"] = format_apa_authors(raw_authors)
            result = APA_TEMPLATE.render(**context)
            
        # Clean up double spaces or floating punctuation
        result = result.replace("..", ".").replace(" .", ".").strip()
        return result
