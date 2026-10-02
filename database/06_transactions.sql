USE `online_bookstore`;

-- Example 1: Member 3 checks out from the shopping cart
-- This is the successful transaction with COMMIT
START TRANSACTION;

INSERT INTO `訂單` (`會員編號`, `配送地址`, `狀態`)
SELECT `會員編號`, '台南市西區安平街6之7號', '處理中'
FROM `會員`
WHERE `會員編號` = 3;

-- Save the new order ID
SET @neworderid = LAST_INSERT_ID();

-- Add the cart items to the order details
INSERT INTO `訂單明細` (`訂單編號`, `ISBN`, `單價`, `數量`, `小計`)
SELECT
    @neworderid,
    c.`ISBN`,
    b.`單價`,
    c.`數量`,
    b.`單價` * c.`數量` AS `小計`
FROM `購物車` AS c
JOIN `書籍` AS b
    ON c.`ISBN` = b.`ISBN`
WHERE c.`會員編號` = 3;

-- Clear the member's shopping cart
DELETE FROM `購物車`
WHERE `會員編號` = 3;

COMMIT;

-- Check the result after COMMIT
SELECT * FROM `訂單` WHERE `訂單編號` = @neworderid;
SELECT * FROM `訂單明細` WHERE `訂單編號` = @neworderid;
SELECT * FROM `購物車` WHERE `會員編號` = 3;


-- Example 2: This transaction ends with ROLLBACK
-- The changes will not be saved
START TRANSACTION;

INSERT INTO `訂單` (`會員編號`, `配送地址`, `狀態`)
SELECT `會員編號`, '高雄市前鎮區梅花路9號', '處理中'
FROM `會員`
WHERE `會員編號` = 8;

SET @rollback_order_id = LAST_INSERT_ID();

INSERT INTO `訂單明細` (`訂單編號`, `ISBN`, `單價`, `數量`, `小計`)
SELECT
    @rollback_order_id,
    c.`ISBN`,
    b.`單價`,
    c.`數量`,
    b.`單價` * c.`數量` AS `小計`
FROM `購物車` AS c
JOIN `書籍` AS b
    ON c.`ISBN` = b.`ISBN`
WHERE c.`會員編號` = 8;

DELETE FROM `購物車`
WHERE `會員編號` = 8;

ROLLBACK;

-- Check that the order was not saved
SELECT * FROM `訂單` WHERE `訂單編號` = @rollback_order_id;
SELECT * FROM `購物車` WHERE `會員編號` = 8;
