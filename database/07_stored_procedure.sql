USE `online_bookstore`;

-- This procedure calculates a member's order count and total spending
DELIMITER $$

CREATE PROCEDURE `查會員消費總額`(IN p_會員編號 INT)
BEGIN
    SELECT
        m.`會員編號`,
        m.`姓名` AS `會員姓名`,
        COUNT(DISTINCT o.`訂單編號`) AS `訂單數`,
        IFNULL(SUM(od.`小計`), 0) AS `消費總額`
    FROM `會員` AS m
    LEFT JOIN `訂單` AS o
        ON m.`會員編號` = o.`會員編號`
    LEFT JOIN `訂單明細` AS od
        ON o.`訂單編號` = od.`訂單編號`
    WHERE m.`會員編號` = p_會員編號
    GROUP BY m.`會員編號`, m.`姓名`;
END$$

DELIMITER ;

-- Example: check member 1
CALL `查會員消費總額`(1);
