1.1 Получить список из 3 детей, начиная со второго:
SELECT * FROM children LIMIT 2, 3;
2.1 Получить список болезней, у которых отсутствует степень опасности:
SELECT * FROM disease WHERE degree_danger IS NULL;
2.2 Получить список болезней, у которых есть степень опасности:
SELECT * FROM disease WHERE degree_danger IS NOT NULL;
2.3 Получить список детей, кто не младше 9 и не старше 15 лет:
SELECT * FROM children WHERE date_of_child BETWEEN '9' AND '15';
2.4 Получить список детей, которым 4 и 15 лет:
SELECT * FROM children WHERE date_of_child IN ('4', '15');
2.5 Получить список детей, которым 4 года:
SELECT * FROM children WHERE date_of_child = '4';
2.6. Получить список детей которым нет 4 лет:
SELECT * FROM children WHERE date_of_child != '4';
3.1. Получить список сделанных прививок, отсортированных от меньшего к большему по номеру прививки:
SELECT * FROM made_vaccinations ORDER BY id_vaccination ASC;
3.2. Получить список сделанных прививок, отсортированных от большего к меньшему по номеру прививки:
SELECT * FROM made_vaccinations ORDER BY id_vaccination DESC;
3.3. Получить список сделанных прививок, отсортированных по номерам прививок и номерам детей:
SELECT * FROM made_vaccinations ORDER BY id_vaccination, id_child;
3.4. Получить список сделанных прививок, отсортированных по номерам детей(главное условие сортировки) и  по номерам больниц:
SELECT id_child, id_vaccination, id_hospital FROM made_vaccinations ORDER BY id_child DESC, id_hospital;
4.1. Получить минимальный возраст детей, сделавшим прививки:
SELECT MIN(date_of_child) FROM children;
4.2. Получить максимальный возраст детей, сделавшим прививки:
SELECT MAX(date_of_child) FROM children;
4.3. Получить средний возраст детей, сделавшим прививки:
SELECT AVG(date_of_child) FROM children;
4.4. Получить сумму возрастов детей, сделавшим прививки:
SELECT SUM(date_of_child) FROM children;
5.1. Получить список городов, в которых есть больницы:
SELECT DISTINCT city FROM hospitals;
5.2. Получить количество городов, в которых есть больницы:
SELECT COUNT(DISTINCT city) FROM hospitals;
6.1. Получить сумму, которую получает каждая из больниц за прививки:
SELECT id_hospital, SUM(price) FROM made_vaccinations GROUP BY id_hospital;
6.2. Получить сумму, которую получает каждая больница за 4 прививку:
SELECT id_hospital, SUM(price) FROM made_vaccinations WHERE id_vaccination = '4' GROUP BY id_hospital;
6.3. Получить номера больниц, у которых общая сумма за прививки привысила 1000:
SELECT id_hospital, SUM(price) FROM made_vaccinations GROUP BY id_hospital HAVING SUM(price) > 1000;