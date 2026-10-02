USE `online_bookstore`;

-- The online bookstore often searches for books by title
-- First, use EXPLAIN before adding the index
EXPLAIN
SELECT *
FROM `書籍`
WHERE `書名` = '玻璃瓶中的塵埃';

-- Add an index to the book title column
CREATE INDEX `書籍書名_索引`
ON `書籍` (`書名`);

-- Check if the index was created
SHOW INDEX FROM `書籍`;

-- Use EXPLAIN again after adding the index
-- Before the index, type = ALL means MySQL scans the whole table
-- After the index, type = ref means MySQL can use the index
EXPLAIN
SELECT *
FROM `書籍`
WHERE `書名` = '玻璃瓶中的塵埃';
