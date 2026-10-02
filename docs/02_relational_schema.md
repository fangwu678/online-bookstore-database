# Relational Schema

This is the main table structure used in the project.

- `出版社` (Publisher): `出版社代號` (PK), `名稱`, `電話`
- `作者` (Author): `作者編號` (PK), `姓名`, `筆名`
- `會員` (Member): `會員編號` (PK), `姓名`, `生日`, `住址`, `電子郵件`
- `書籍` (Book): `ISBN` (PK), `書名`, `單價`, `出版日期`, `出版社代號` (FK)
- `書籍作者` (Book-Author): `ISBN` (PK, FK), `作者編號` (PK, FK)
- `會員電話` (Member Phone): `會員編號` (PK, FK), `電話` (PK)
- `購物車` (Shopping Cart): `會員編號` (PK, FK), `ISBN` (PK, FK), `數量`
- `訂單` (Order): `訂單編號` (PK), `會員編號` (FK), `下單時間`, `配送地址`, `狀態`
- `訂單明細` (Order Detail): `訂單編號` (PK, FK), `ISBN` (PK, FK), `單價`, `數量`, `小計`

The many-to-many relationship between books and authors is handled by
`書籍作者`.

The order header and order items are separated into `訂單` and `訂單明細`.
