4.1. Получить список групп, принадлежащие факультету FIaVT:
SELECT name_group FROM groups LEFT JOIN faculty ON groups.id_faculty = faculty.id_faculty 
WHERE faculty.name_faculty = 'FIaVT';
1	SIMPLE	faculty	ref	PRIMARY,name_faculty	name_faculty	767	const							2144	Using where; Using index
1	SIMPLE	groups	ref	id_faculty				id_faculty		4	lab6var17.faculty.id_faculty	1		NULL

4.2. Получить список групп, принадлежащие факультету FIaVT:
SELECT name_group FROM faculty RIGHT JOIN groups ON groups.id_faculty = faculty.id_faculty 
WHERE faculty.name_faculty = 'FIaVT';
1	SIMPLE	faculty	ref	PRIMARY,name_faculty	name_faculty	767	const							2144	Using where; Using index	
1	SIMPLE	groups	ref	id_faculty				id_faculty		4	lab6var17.faculty.id_faculty	1		NULL	

4.3. Получить список групп, в которых студенты имеют фамилию "Archeri" и возраст более 20 лет:
SELECT name_group FROM groups LEFT JOIN students ON groups.id_group = students.id_group 
WHERE students.age > '20' AND students.surname_student = 'Archeri';
1	SIMPLE	students	range	surname_student,age,id_group,v	v		771	NULL						681	Using index condition; Using where
1	SIMPLE	groups		eq_ref	PRIMARY							PRIMARY	4	lab6var17.students.id_group	1	NULL

4.4. Получить список студентов, у которых возраст менее 20 лет и результат менее 200:
SELECT name_student, surname_student FROM students LEFT JOIN results ON students.id_student = results.id_student 
WHERE students.age < '20' AND results.count_of_result < '200';
1	SIMPLE	students	ALL	PRIMARY,age					NULL		NULL	NULL							15043	Using where
1	SIMPLE	results		ref	count_of_result,id_student	id_student	4		lab6var17.students.id_student	1		Using where

4.3. Получить список студентов, у которых возраст более 20 лет и результаты по бегу превышает границу:
SELECT name_student, surname_student FROM students 
LEFT JOIN results ON students.id_student = results.id_student 
LEFT JOIN standards_for_physical_education ON results.id_standard = standards_for_physical_education.id_standard 
WHERE standards_for_physical_education.type_of_standard = 'run' AND results.count_of_result > standards_for_physical_education.border 
AND students.age > '20' 
1	SIMPLE	standards_for_physical_education	ref		PRIMARY,type_of_standard,border			type_of_standard	767	const													3003	Using index condition
1	SIMPLE	results								ref		count_of_result,id_standard,id_student	id_standard			4	lab6var17.standards_for_physical_education.id_stan...	1		Using where
1	SIMPLE	students							eq_ref	PRIMARY,age								PRIMARY				4	lab6var17.results.id_student							1		Using where

4.4. Получить список групп, в которых есть студенты, чей возраст от 18 до 22 лет:
SELECT name_group FROM groups LEFT JOIN students ON students.id_group = groups.id_group 
WHERE students.age IN ('18', '22');
1	SIMPLE	students	ALL		age,id_group	NULL	NULL	NULL						15043	Using where
1	SIMPLE	groups		eq_ref	PRIMARY			PRIMARY	4		lab6var17.students.id_group	1		NULL

4.5. Получить список групп, в которых есть студенты, чей возраст от 20 лет включительно:
SELECT name_group FROM groups LEFT JOIN students ON groups.id_group = students.id_group 
WHERE students.age >= '20'
1	SIMPLE	students	ALL		age,id_group	NULL	NULL	NULL						15043	Using where
1	SIMPLE	groups		eq_ref	PRIMARY			PRIMARY	4		lab6var17.students.id_group	1		NULL

4.6. Получить отсоритрованный по фамилиям список студентов, чей результат выше 200:
SELECT name_student, surname_student FROM students LEFT JOIN results ON students.id_student = results.id_student 
WHERE results.count_of_result >= '200' ORDER BY students.surname_student;
1	SIMPLE	results		ALL		count_of_result,id_student	NULL	NULL	NULL							15013	Using where; Using temporary; Using filesort
1	SIMPLE	students	eq_ref	PRIMARY						PRIMARY	4		lab6var17.results.id_student	1		NULL

4.7. Получить отсоритрованный по фамилиям и именам список студентов, чей результат ниже 200:
SELECT name_student, surname_student FROM students LEFT JOIN results ON students.id_student = results.id_student 
WHERE results.count_of_result <= '200' ORDER BY students.surname_student, students.name_student;
1	SIMPLE	results		ALL		count_of_result,id_student	NULL	NULL	NULL							15013	Using where; Using temporary; Using filesort
1	SIMPLE	students	eq_ref	PRIMARY						PRIMARY	4		lab6var17.results.id_student	1		NULL
