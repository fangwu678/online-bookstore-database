# Normalization Notes

## 1NF

Each field stores only one value.

Examples:
- One email field stores one email address.
- Member phone numbers are stored in a separate table.
- One row in `訂單明細` stores one book in one order.

## 2NF

For tables with a composite primary key, non-key data should depend on the
whole key.

Examples:
- `訂單明細` uses (`訂單編號`, `ISBN`) as the primary key. The book title is
  not stored here because the title depends on `ISBN`. It is stored in `書籍`.
- `書籍作者` uses (`ISBN`, `作者編號`) as the primary key. The author name is
  stored in `作者`.
- `購物車` uses (`會員編號`, `ISBN`) as the primary key. The member name is
  stored in `會員`.

## 3NF

Non-key data should not depend on other non-key data.

Examples:
- The member name is not stored in `訂單`. It can be found through `會員編號`.
- Publisher name and phone are stored in `出版社`, not directly in `書籍`.
- Book title and publisher name are not stored in `訂單明細`.

## Why this is useful

This design helps reduce repeated data.

For example:
- If a publisher changes its phone number, I only need to update one table.
- An author can be added before the author has a book in the database.
- Removing a book-author relationship does not remove the author's basic data.
