from docx import Document
from docx.shared import Pt

# Load the Word document template
doc = Document("шаблон.docx")

# Define the context data
context = {'director': "И.И.Иванов"}

# Replace placeholders in the document with context data
for paragraph in doc.paragraphs:
    for run in paragraph.runs:
        if '{director}' in run.text:
            run.text = run.text.replace('{director}', context['director'])
            run.font.size = Pt(12)  # Set font size if needed

# Save the modified document
doc.save("шаблон-final.docx")
