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
doc = Document("1121.docx")

mycursor.execute("SELECT * FROM student")  # Замените на ваш запрос получения студентов
students = mycursor.fetchall()

for student in students:
    context = {
        'fio': student[0],  # Предполагается, что имя студента находится в первом столбце
        'id': student[1]    # Предполагается, что ID студента находится во втором столбце
    }
    replace_fields(doc, context)
    doc.save(f"{student[1]}_final.docx")  # Сохраняем каждый документ с уникальным именем

# mydb.close()


# Выполнение запроса к базе данных
mycursor.execute("SELECT view_practice, groupe, years, srok, type_practice,number_order,order_date,code_direction, direction FROM practice")
results = mycursor.fetchall()
for result in results: 
    context = {
    'view_practice_viewe': result[0],
    'groupe_number': result[1],
    'practice_years': result[2],
    'practice_srok': result[3],
    'type_practice': result[4],
    'number_order': result[5],
    'order_date': result[6],
    'code_direction': result[7],
    'direction_name': result[8]
}

replace_fields(doc, context)

mycursor.execute("SELECT name FROM institute WHERE direction = %s", (result[8],))
institute_result = mycursor.fetchall()
if institute_result:
        institute_class = institute_result[0][0]
        context = {
            'institute_name': institute_class
        }

        # Замена значений в документе doc
        replace_fields(doc, context)

mycursor.execute("SELECT class FROM groupe WHERE number = %s", (result[1],))
groupe_result = mycursor.fetchall()
if groupe_result:
        groupe_class = groupe_result[0][0]
        context = {
            'groupe_class': groupe_class
            }

        # Замена значений в документе doc
        replace_fields(doc, context)

# Закрываем курсор
mycursor.close()

# Получаем новый курсор
mycursor = mydb.cursor()

mycursor.execute("SELECT sum_student, plase_practice, city, boss_org, opop, not_st  FROM vse")
results = mycursor.fetchall()
for result in results: 
    context = {
    'sum_student': result[0],
    'plase_practice': result[1],
    'city': result[2],
    'boss_org': result[3],
    'opop': result[4],
    'not_st': result[5]
}

replace_fields(doc, context)

mydb.close()
# Закрываем курсор
mycursor.close()

doc.save("final-шаблон2.docx")
