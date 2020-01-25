CREATE TABLE Departments (
    dept_no char(4) NOT NULL,
    dept_name varchar(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);
SELECT * FROM Departments;



CREATE TABLE Department_Employee (
    emp_no int   NOT NULL,
    dept_no char(4)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	CONSTRAINT pk_Department_Employee PRIMARY KEY (
		emp_no
     )   
);
SELECT * FROM Department_Employee;



CREATE TABLE Department_Manager (
    dept_no char(4)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	CONSTRAINT pk_Employee PRIMARY KEY (
        emp_no
     )
);
SELECT * FROM Department_Manager;


CREATE TABLE Employee (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(100)   NOT NULL,
    last_name varchar(100)   NOT NULL,
    gender varchar(100)   NOT NULL,
    hire_date date   NOT NULL,
	CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);
SELECT * FROM Employee;


CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
 );
SELECT * FROM Salaries;


CREATE TABLE Titles (
    emp_no int   NOT NULL,
    title varchar(100)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	CONSTRAINT pk_Titles PRIMARY KEY (
        emp_no
     )
);
SELECT * FROM Titles;


ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department_Manager" ("dept_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department_Employee" ("dept_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Titles" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

