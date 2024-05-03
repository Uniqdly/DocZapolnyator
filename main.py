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
mycursor.execute("SELECT student_fio, viewe_contract,pay,hards,name_tasks, FROM end")
result = mycursor.fetchone()
context = {'view_practice_viewe': result[0],
                'groupe_number': result[1],
                'practice_years': result[2],
                'practice_srok': result[3],
                'practice_name_practice': result[4],}
        
replace_fields(doc, context)
doc.save("шаблон-final.docx")
