USE `online_bookstore`;

-- View 1: Order details
-- This view combines orders, members, order details, books, and publishers
-- It makes it easier to see which books are included in each order
CREATE OR REPLACE VIEW `訂單明細_檢視`
AS SELECT
    o.`訂單編號`,
    m.`會員編號`,
    m.`姓名` AS `會員姓名`,
    o.`下單時間`,
    o.`狀態`,
    b.`ISBN`,
    b.`書名`,
    p.`名稱` AS `出版社名稱`,
    od.`單價`,
    od.`數量`,
    od.`小計`
FROM `訂單` AS o
JOIN `會員` AS m
    ON o.`會員編號` = m.`會員編號`
JOIN `訂單明細` AS od
    ON o.`訂單編號` = od.`訂單編號`
JOIN `書籍` AS b
    ON od.`ISBN` = b.`ISBN`
JOIN `出版社` AS p
    ON b.`出版社代號` = p.`出版社代號`;

SELECT * FROM `訂單明細_檢視`;

-- View 2: Book sales summary
-- This view shows the total quantity and total sales for each book
CREATE OR REPLACE VIEW `書籍銷售統計_檢視`
AS SELECT
    b.`ISBN`,
    b.`書名`,
    p.`名稱` AS `出版社名稱`,
    IFNULL(SUM(od.`數量`), 0) AS `銷售數量`,
    IFNULL(SUM(od.`小計`), 0) AS `銷售總額`
FROM `書籍` AS b
JOIN `出版社` AS p
    ON b.`出版社代號` = p.`出版社代號`
LEFT JOIN `訂單明細` AS od
    ON b.`ISBN` = od.`ISBN`
GROUP BY b.`ISBN`, b.`書名`, p.`名稱`;

SELECT * FROM `書籍銷售統計_檢視`
ORDER BY `銷售總額` DESC;
