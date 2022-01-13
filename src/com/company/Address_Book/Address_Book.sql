---Use Case 1---

---Ability to create a Address Book Service DB---

mysql> create database Address_Book_DB;
Query OK, 1 row affected (0.01 sec)

mysql> use Address_Book_DB;
Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Address_Book_DB    |
| information_schema |
| mysql              |
| payroll_service    |
| payroll_services   |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

---Use Case 2---

---Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes---

mysql> create table Address_Book(firstName varchar(50) , lastName varchar(50) , address varchar(100),city varchar(20), state varchar(20), zip int(10) , phoneNumber int(20) , email varchar(50));
Query OK, 0 rows affected, 2 warnings (0.02 sec)

mysql> desc Address_Book;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(50)  | YES  |     | NULL    |       |
| lastName    | varchar(50)  | YES  |     | NULL    |       |
| address     | varchar(100) | YES  |     | NULL    |       |
| city        | varchar(20)  | YES  |     | NULL    |       |
| state       | varchar(20)  | YES  |     | NULL    |       |
| zip         | int          | YES  |     | NULL    |       |
| phoneNumber | int          | YES  |     | NULL    |       |
| email       | varchar(50)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

---Use Case 3---

---Ability to insert new Contacts to Address Book---

mysql> insert into Address_Book values("Srinath","Siva","Bargur","Krishnagiri","Tamilnadu",1234,123456,"sri@gmail.com");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Address_Book values("Richard","Martin","Medavakkam","Chennai","Tamilnadu",1234,123456,"rich@gmail.com");
Query OK, 1 row affected (0.00 sec)

mysql> insert into Address_Book values("Arun","Elamaran","BTM Layout","Banglore","Karnataka",1111,635103,"arun@gmail.com");
Query OK, 1 row affected (0.00 sec)

mysql> select * from Address_Book
    -> ;
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| firstName | lastName | address    | city        | state     | zip  | phoneNumber | email          |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| Srinath   | Siva     | Bargur     | Krishnagiri | Tamilnadu | 1234 |      123456 | sri@gmail.com  |
| Richard   | Martin   | Medavakkam | Chennai     | Tamilnadu | 1234 |      123456 | rich@gmail.com |
| Arun      | Elamaran | BTM Layout | Banglore    | Karnataka | 1111 |      635103 | arun@gmail.com |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
3 rows in set (0.00 sec)

---Use Case 4---

--Ability to edit existing contact person using their name---

mysql> update Address_Book SET state = 'Goa' where firstName = 'Srinath';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Address_Book;
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| firstName | lastName | address    | city        | state     | zip  | phoneNumber | email          |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| Srinath   | Siva     | Bargur     | Krishnagiri | Goa       | 1234 |      123456 | sri@gmail.com  |
| Richard   | Martin   | Medavakkam | Chennai     | Tamilnadu | 1234 |      123456 | rich@gmail.com |
| Arun      | Elamaran | BTM Layout | Banglore    | Karnataka | 1111 |      635103 | arun@gmail.com |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
3 rows in set (0.00 sec)

---Use Case 5---

---Ability to delete a person using person's name---

mysql> delete from Address_Book where firstName = "Arun";
Query OK, 1 row affected (0.00 sec)

mysql> select * from Address_Book;
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| firstName | lastName | address    | city        | state     | zip  | phoneNumber | email          |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
| Srinath   | Siva     | Bargur     | Krishnagiri | Goa       | 1234 |      123456 | sri@gmail.com  |
| Richard   | Martin   | Medavakkam | Chennai     | Tamilnadu | 1234 |      123456 | rich@gmail.com |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+
2 rows in set (0.00 sec)

---Use Case 6---

---Ability to Retrieve Person belonging to a City or State from the Address Book---

mysql> select * from Address_Book where city = "Krishnagiri" or state = 'Goa';
+-----------+----------+---------+-------------+-------+------+-------------+---------------+
| firstName | lastName | address | city        | state | zip  | phoneNumber | email         |
+-----------+----------+---------+-------------+-------+------+-------------+---------------+
| Srinath   | Siva     | Bargur  | Krishnagiri | Goa   | 1234 |      123456 | sri@gmail.com |
+-----------+----------+---------+-------------+-------+------+-------------+---------------+
1 row in set (0.00 sec)

---Use Case 7---

---Ability to understand the size of address book by City and State---

mysql> select COUNT(firstName) from Address_Book where city = "Krishnagiri" or state = 'Goa';
+------------------+
| COUNT(firstName) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

---Use Case 8---

---Ability to retrieve entries sorted alphabetically by Person’s name for a given city---


mysql> select city , firstName from Address_Book ORDER BY city ASC;
+-------------+-----------+
| city        | firstName |
+-------------+-----------+
| Chennai     | Richard   |
| Krishnagiri | Srinath   |
+-------------+-----------+
2 rows in set (0.00 sec)

---Use Case 9---

---Ability to identify each Address Book with name and Type---

mysql> update Address_Book SET Type = "Family" where firstName = "Srinath";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Address_Book SET Type = "Friend" where firstName = "Richard";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> insert into Address_Book values("Arun","Elamaran","BTM Layout","Banglore","Karnataka",1111,635103,"arun@gmail.com","Profession");
Query OK, 1 row affected (0.00 sec)

mysql> select * from Address_Book;
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+------------+
| firstName | lastName | address    | city        | state     | zip  | phoneNumber | email          | Type       |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+------------+
| Srinath   | Siva     | Bargur     | Krishnagiri | Goa       | 1234 |      123456 | sri@gmail.com  | Family     |
| Richard   | Martin   | Medavakkam | Chennai     | Tamilnadu | 1234 |      123456 | rich@gmail.com | Friend     |
| Arun      | Elamaran | BTM Layout | Banglore    | Karnataka | 1111 |      635103 | arun@gmail.com | Profession |
+-----------+----------+------------+-------------+-----------+------+-------------+----------------+------------+
3 rows in set (0.00 sec)

---Use Case 10---

---Ability to get number of contact persons i.e. count by type---

mysql> select COUNT(firstName) from Address_Book where Type = "Friend";
+------------------+
| COUNT(firstName) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

mysql> select COUNT(firstName) from Address_Book;
+------------------+
| COUNT(firstName) |
+------------------+
|                3 |
+------------------+
1 row in set (0.00 sec)

---Use Case 11---

---Ability to add person to both Friend and Family---

mysql>  insert into Address_Book values("Pradeep","Kumar","Tirupattur","Vellore","Tamilnadu",2222,603203,"pradeep@gmail.com","Friend");
Query OK, 1 row affected (0.00 sec)

mysql>  insert into Address_Book values("Chandru","Chetty","Solang","Ladakh","Kashmir",3333,635104,"chandru@gmail.com","Family");
Query OK, 1 row affected (0.00 sec)

mysql> select * from Address_Book;
+-----------+----------+------------+-------------+-----------+------+-------------+-------------------+------------+
| firstName | lastName | address    | city        | state     | zip  | phoneNumber | email             | Type       |
+-----------+----------+------------+-------------+-----------+------+-------------+-------------------+------------+
| Srinath   | Siva     | Bargur     | Krishnagiri | Goa       | 1234 |      123456 | sri@gmail.com     | Family     |
| Richard   | Martin   | Medavakkam | Chennai     | Tamilnadu | 1234 |      123456 | rich@gmail.com    | Friend     |
| Arun      | Elamaran | BTM Layout | Banglore    | Karnataka | 1111 |      635103 | arun@gmail.com    | Profession |
| Pradeep   | Kumar    | Tirupattur | Vellore     | Tamilnadu | 2222 |      603203 | pradeep@gmail.com | Friend     |
| Chandru   | Chetty   | Solang     | Ladakh      | Kashmir   | 3333 |      635104 | chandru@gmail.com | Family     |
+-----------+----------+------------+-------------+-----------+------+-------------+-------------------+------------+
5 rows in set (0.00 sec)




