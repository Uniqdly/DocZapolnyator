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

# Выполнение запроса к базе данных
mycursor.execute("SELECT view_practice, groupe,years,srok,name_practice FROM practice")
result = mycursor.fetchone()
context = {'view_practice_viewe': result[0],
           'groupe_number': result[1],
           'practice_years': result[2],
           'practice_srok': result[3],
           'practice_name_practice': result[4],}
doc = Document("шаблон.docx")
replace_fields(doc, context)

mycursor.execute("SELECT student_fio, hards, quality, size_work, comments, rate FROM practice_student")
result = mycursor.fetchone()
context = {'student_fio': result[0],
           'practice_student_hards': result[1],
           'practice_student_quality': result[2],
           'practice_student_size_work': result[3],
           'comments_text': result[4],
           'practice_student_rate': result[5]}

replace_fields(doc, context)

mycursor.execute("SELECT class FROM groupe")
result = mycursor.fetchone()
context = {'groupe_class': result[0]}

replace_fields(doc, context)

mycursor.execute("SELECT name, direction FROM institute")
result = mycursor.fetchone()
context = {'institute_name': result[0],
           'direction_name': result[1]}

replace_fields(doc, context)

doc.save("шаблон-final.docx")
