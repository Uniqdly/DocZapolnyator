import re
from docx import Document

def replace_fields(doc, context):
    for paragraph in doc.paragraphs:
        for field in re.findall(r"{{(.*?)}}", paragraph.text):
            if field in context:
                paragraph.text = paragraph.text.replace("{{" + field + "}}", str(context[field]))

    for table in doc.tables:
        for row in table.rows:
            for cell in row.cells:
                for paragraph in cell.paragraphs:
                    for field in re.findall(r"{{(.*?)}}", paragraph.text):
                        if field in context:
                            paragraph.text = paragraph.text.replace("{{" + field + "}}", str(context[field]))

doc = Document("шаблон.docx")
context = {'director': "И.И.Иванов",
           'view_practice_viewe':"учебная",
           'place_practice_ name_place ': "Югорский Государственный Университет"}

replace_fields(doc, context)
doc.save("шаблон-final.docx")
