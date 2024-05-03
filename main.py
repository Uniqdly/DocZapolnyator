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

mycursor.execute("SELECT fio  FROM orderok")
results = mycursor.fetchall()  # Получить все строки результата
for result in results:
# Получение данных из таблицы practice_student
    mycursor.execute("SELECT student_fio, hards, quality, size_work, comments, rate, groupe FROM practice_student WHERE student_fio = %s",(result[0],))
    results = mycursor.fetchall()  # Получить все строки результата
    for result in results:
        context = {
        'student_fio': result[0],
        'practice_student_hards': result[1],
        'practice_student_quality': result[2],
        'practice_student_size_work': result[3],
        'comments_text': result[4],
        'practice_student_rate': result[5],
        'groupe_number': result[6]
                    }

    # Замена значений в документе doc
    replace_fields(doc, context)

    # Получение данных из таблицы groupe
    mycursor.execute("SELECT class FROM groupe WHERE number = %s", (result[6],))
    groupe_result = mycursor.fetchone()
    if groupe_result:
        groupe_class = groupe_result[0]
        context = {'groupe_class': groupe_class}

        # Замена значений в документе doc
        replace_fields(doc, context)

    # Получение данных из таблицы direction
    mycursor.execute("SELECT name FROM direction WHERE groupe = %s", (result[6],))
    direction_result = mycursor.fetchone()
    if direction_result:
        direction_class = direction_result[0]
        context = {'direction_name': direction_class}

        # Замена значений в документе doc
        replace_fields(doc, context)

mycursor.execute("SELECT name  FROM direction")
results = mycursor.fetchall()  # Получить все строки результата
for result in results:

# Получение данных из таблицы direction
    mycursor.execute("SELECT name FROM institute WHERE direction = %s", (result[0],))
    institute_result = mycursor.fetchone()
    if institute_result:
        institute_class = institute_result[0]
        context = {'institute_name': institute_class}

        # Замена значений в документе doc
        replace_fields(doc, context)

# Получение данных из таблицы practice
mycursor.execute("SELECT name_practice FROM practice")
practice_results = mycursor.fetchall()  # Получить все строки результата
for practice_result in practice_results:
    mycursor.execute("SELECT address, name_place FROM place_practice WHERE name_practice = %s", (practice_result[0],))
    place_result = mycursor.fetchone()
    if place_result:
        address = place_result[0]
        name_place = place_result[1]
        context = {
            'place_practice_address': address,
            'place_practice_name_place': name_place
        }

        # Замена значений в документе doc
        replace_fields(doc, context)

        # Выполнение запроса к базе данных
        mycursor.execute("SELECT view_practice, groupe,years,srok,name_practice FROM practice")
        result = mycursor.fetchone()
        context = {'view_practice_viewe': result[0],
                'groupe_number': result[1],
                'practice_years': result[2],
                'practice_srok': result[3],
                'practice_name_practice': result[4],}
        
        replace_fields(doc, context)


doc.save("шаблон-final.docx")
