---Use Case 1---

---Ability to create a payroll service database---

mysql> create database payroll_services;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| payroll_services   |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.02 sec)

mysql> use payroll_services;
Database changed

----Use Case 2----

---Ability to create a employee payroll table in the payroll service database to manage employee payrolls---

mysql> create table employee_payroll (ID int PRIMARY KEY AUTO_INCREMENT , name varchar(50) , salary int , start_date DATE);
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee_payroll
    -> ;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| ID         | int         | NO   | PRI | NULL    | auto_increment |
| name       | varchar(50) | YES  |     | NULL    |                |
| salary     | int         | YES  |     | NULL    |                |
| start_date | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

----Use Case 3----

---Ability to create employee payroll data in the payroll service database as part of CRUD Operation---


mysql> insert into employee_payroll values(1,"Srinath",100000,'2021-11-24');
Query OK, 1 row affected (0.02 sec)

mysql> insert into employee_payroll values(2,"Richard",50000,'2021-11-25');
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee_payroll values(3,"Arun",75000,'2021-12-25');
Query OK, 1 row affected (0.00 sec)

----Use Case 4----

---Ability to retrieve all the employee payroll data that is added to payroll service database---

mysql> select * from employee_payroll;
+----+---------+--------+------------+
| ID | name    | salary | start_date |
+----+---------+--------+------------+
|  1 | Srinath | 100000 | 2021-11-24 |
|  2 | Richard |  50000 | 2021-11-25 |
|  3 | Arun    |  75000 | 2021-12-25 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)

----Use case 5----

---Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular date range---

mysql> select salary from employee_payroll where name = "Srinath";
+--------+
| salary |
+--------+
| 100000 |
+--------+
1 row in set (0.01 sec)

mysql> select salary from employee_payroll where start_date BETWEEN CAST('2021-11-25' AS DATE) AND DATE(NOW());
+--------+
| salary |
+--------+
|  50000 |
|  75000 |
+--------+
2 rows in set (0.01 sec)

----Use Case 6----

---Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender---

mysql> alter table employee_payroll ADD Gender varchar(10);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+--------+------------+--------+
| ID | name    | salary | start_date | Gender |
+----+---------+--------+------------+--------+
|  1 | Srinath | 100000 | 2021-11-24 | NULL   |
|  2 | Richard |  50000 | 2021-11-25 | NULL   |
|  3 | Arun    |  75000 | 2021-12-25 | NULL   |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set Gender = 'M' where name = "Srinath" or name =
 "Richard" or name = "Arun";
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+--------+------------+--------+
| ID | name    | salary | start_date | Gender |
+----+---------+--------+------------+--------+
|  1 | Srinath | 100000 | 2021-11-24 | M      |
|  2 | Richard |  50000 | 2021-11-25 | M      |
|  3 | Arun    |  75000 | 2021-12-25 | M      |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)

----Use Case 7----

---Ability to find sum, average, min, max and number of male and female employees---

mysql> select SUM(salary) from employee_payroll where Gender = 'M' group by Gender;
+-------------+
| SUM(salary) |
+-------------+
|      225000 |
+-------------+
1 row in set (0.01 sec)

mysql> select AVG(salary) from employee_payroll group by Gender;
+-------------+
| AVG(salary) |
+-------------+
|  75000.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> select MAX(salary) FROM employee_payroll GROUP BY Gender;
+-------------+
| MAX(salary) |
+-------------+
|      100000 |
+-------------+
1 row in set (0.00 sec)

mysql> select MIN(salary) FROM employee_payroll GROUP BY Gender;
+-------------+
| MIN(salary) |
+-------------+
|       50000 |
+-------------+
1 row in set (0.00 sec)

mysql> select COUNT(name) FROM employee_payroll GROUP BY Gender;
+-------------+
| COUNT(name) |
+-------------+
|           3 |
+-------------+
1 row in set (0.00 sec)

----Use Case 8----

---Ability to extend employee_payroll data to store employee information like employee phone, address and department---

mysql> alter table employee_payroll add address varchar(50) default 'Tamilnadu';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add phoneNumber int ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add department varchar(50) Not Null;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+--------+------------+--------+-----------+-------------+------------+
| ID | name    | salary | start_date | Gender | address   | phoneNumber | department |
+----+---------+--------+------------+--------+-----------+-------------+------------+
|  1 | Srinath | 100000 | 2021-11-24 | M      | Tamilnadu |        NULL |            |
|  2 | Richard |  50000 | 2021-11-25 | M      | Tamilnadu |        NULL |            |
|  3 | Arun    |  75000 | 2021-12-25 | M      | Tamilnadu |        NULL |            |
+----+---------+--------+------------+--------+-----------+-------------+------------+
3 rows in set (0.00 sec)

----Use Case 9----

---Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay---

mysql> alter table employee_payroll add column deductions int;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll rename column salary to basic_pay;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Taxable_Pay int;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Income_Tax int;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Net_Pay int;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
| ID | name    | basic_pay | start_date | Gender | address   | phoneNumber | department | deductions | Taxable_Pay | Income_Tax | Net_Pay |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
|  1 | Srinath |    100000 | 2021-11-24 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  2 | Richard |     50000 | 2021-11-25 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  3 | Arun    |     75000 | 2021-12-25 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
3 rows in set (0.00 sec)

----Use Case 10----

---Ability to make Terissa as part of Sales and Marketing Department---

mysql> Insert Into employee_payroll Values(4,'Terissa',20000,'2021-10-22','F','Chennai',9,'Marketing',2000,1000,200,18000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_payroll;
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
| ID | name    | basic_pay | start_date | Gender | address   | phoneNumber | department | deductions | Taxable_Pay | Income_Tax | Net_Pay |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
|  1 | Srinath |    100000 | 2021-11-24 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  2 | Richard |     50000 | 2021-11-25 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  3 | Arun    |     75000 | 2021-12-25 | M      | Tamilnadu |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  4 | Terissa |     20000 | 2021-10-22 | F      | Chennai   |           9 | Marketing  |       2000 |        1000 |        200 |   18000 |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
4 rows in set (0.00 sec)




