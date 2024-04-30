from docx import Document
from docx.shared import Pt
import os

# Получаем путь к текущей директории
current_dir = os.path.dirname(os.path.abspath(__file__))

# Load the Word document template
doc = Document(os.path.join(current_dir, "шаблон.docx"))

# Define the context data
context = {'director': "И.И.Иванов"}

# Replace placeholders in the document with context data
for paragraph in doc.paragraphs:
    for run in paragraph.runs:
        if '{director}' in run.text:
            run.text = run.text.replace('{director}', context['director'])
            run.font.size = Pt(12)  # Set font size if needed

# Save the modified document in the same directory
output_file = os.path.join(current_dir, "шаблончик.docx")
try:
    doc.save(output_file)
    print(f"Файл успешно сохранен по пути: {output_file}")
except Exception as e:
    print("Ошибка при сохранении файла:", e)
