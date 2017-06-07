1. Выдать все полученные оценки группы ИВТ-11 по математике.
SELECT student.name_student, mark.final_mark FROM mark LEFT JOIN student ON student.id_student = mark.id_student
LEFT JOIN groups ON groups.id_group = student.id_group
LEFT JOIN class ON class.id_group = groups.id_group
LEFT JOIN school_subject ON school_subject.id_subject = class.id_subject
WHERE groups.name_group = "IVT-11" AND school_subject.name_subject = "mathematics";

2.Дать информацию о должниках группы ПС-41 с указанием фамилии студента и названия предмета. 
Должниками считаются студенты, не имеющие оценки по предмету, который ведется в группе.
SELECT student.name_student, school_subject.name_subject FROM student 
LEFT JOIN groups ON student.id_group = groups.id_group 
LEFT JOIN class ON class.id_group = groups.id_group
LEFT JOIN school_subject ON school_subject.id_subject = class.id_subject
LEFT JOIN mark ON mark.id_class = class.id_class
WHERE groups.name_group = "PS-41" AND mark.final_mark = NULL;

3.Дать среднюю оценку студентов по каждому предмету для тех предметов, по которым занимается не менее 10 студентов.
SELECT AVG(mark.final_mark), school_subject.name_subject FROM mark
LEFT JOIN class ON class.id_class = mark.id_class
LEFT JOIN school_subject ON school_subject.id_subject = class.id_subject
LEFT JOIN groups ON groups.id_group = class.id_group
WHERE groups.number_students >= '10'
GROUP BY school_subject.name_subject;

4.Дать оценки студентов специальности ВМ по всем проводимым предметам с указанием группы, фамилии, предмета, даты. 
При отсутствии оценки заполнить значениями NULL поля оценки и даты
SELECT mark.final_mark, groups.name_group, student.name_student, school_subject.name_subject, mark.date FROM student
LEFT JOIN groups ON student.id_group = groups.id_group
LEFT JOIN class ON class.id_group = groups.id_group
LEFT JOIN school_subject ON school_subject.id_subject = class.id_subject
LEFT JOIN mark ON mark.id_class = class.id_class
WHERE groups.small_name_group = 'VM';

5.Всем студентам специальности ИВТ, получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл.
UPDATE mark
JOIN student ON student.id_student = mark.id_student
JOIN groups ON groups.id_group = student.id_group
JOIN class ON class.id_group = groups.id_group
JOIN school_subject ON school_subject.id_subject = class.id_subject
SET mark.final_mark = mark.final_mark + 1
WHERE groups.small_name_group = 'IVT' AND mark.final_mark < '5' AND school_subject.name_subject = 'BD' AND mark.date < '2017-05-12'

