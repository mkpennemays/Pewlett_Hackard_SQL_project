CREATE TABLE Employee (
    emp_no int   NOT NULL,
    emp_title varchar(45)   NOT NULL,
    birth_date varchar(45)     NOT NULL,
    first_name varchar(45)    NOT NULL,
    last_name varchar(45)     NOT NULL,
    sex varchar(1)     NOT NULL,
    hire_date varchar(45)    NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Employee_salary (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_Employee_salary PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE Employee_salary ADD CONSTRAINT fk_Employee_salary_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

CREATE TABLE Employee_title (
    title_id VARCHAR(45)   NOT NULL,
    title VARCHAR(45)   NOT NULL,
    CONSTRAINT pk_Employee_title PRIMARY KEY (
        title_id
     )
);
ALTER TABLE Employee ADD CONSTRAINT fk_Employee_title_title_id FOREIGN KEY(emp_title)
REFERENCES Employee_title (title_id);

CREATE TABLE Department (
    dept_no VARCHAR(45)   NOT NULL,
    dept_name VARCHAR(45)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Department_Employee (
    emp_no int   NOT NULL,
	dept_no VARCHAR(45)   NOT NULL,
    CONSTRAINT pk_Department_Employee PRIMARY KEY (
        dept_no,emp_no
     )
);
ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

CREATE TABLE Dept_manager (
    dept_no VARCHAR(45)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);
ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);
