USE `online_bookstore`;

-- Query 1: Show all members
SELECT *
FROM `會員`;

-- Query 2: Find members who live in Taichung
SELECT
    m.`姓名`,
    m.`電子郵件`
FROM `會員` AS m
WHERE m.`住址` LIKE '%台中%';

-- Query 3: Sort books from the highest price to the lowest price
SELECT *
FROM `書籍`
ORDER BY `單價` DESC;
