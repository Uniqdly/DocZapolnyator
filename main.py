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
mycursor.execute("SELECT view_practice, groupe,years,srok,name_practice,namber_date_order,type_practice FROM practice")
result = mycursor.fetchone()
context = {'view_practice_viewe': result[0],
           'groupe_number': result[1]}

doc = Document("шаблон.docx")
replace_fields(doc, context)
doc.save("шаблон-final.docx")
