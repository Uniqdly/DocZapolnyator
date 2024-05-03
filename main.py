import mysql.connector
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

# Подключение к базе данных MySQL
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="word"
)

mycursor = mydb.cursor()
doc = Document("шаблон.docx")

# Выполнение запроса к базе данных
mycursor.execute("SELECT student_fio,hards, quality, size_work, comments, rate, groupe, years, srok, view_practice, direction, address, name_place, name, class, name_practice FROM end")
result = mycursor.fetchone()
context = {
            'student_fio': result[0],
            'practice_student_hards}}. ': result[1],
            'practice_student_quality': result[2],
            'practice_student_size_work': result[3],
            'comments_text': result[4],
            'practice_student_rate': result[5],
            'groupe_number': result[6],
            'practice_years': result[7],
            'practice_srok': result[8],
            'view_practice_viewe': result[9],
            'direction_name': result[10],
            'place_practice_address': result[11],
            'place_practice_name_place': result[12],
            'institute_name': result[13],
            'groupe_class': result[14],
            'name_practice': result[15]
        }
        
replace_fields(doc, context)
doc.save("шаблон-final.docx")
