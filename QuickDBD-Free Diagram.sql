-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hvpIdc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "emp_no" INT   NOT NULL,
    "birth_date" INT   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" INT   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" INT   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Employee" (
    "Employee" INT   NOT NULL,
    "Departments" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "dept_no" INT   NOT NULL,
    "from_date" INT   NOT NULL,
    "to_date" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Title" (
    "Dept_Employee" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" INT   NOT NULL,
    "to_date" INT   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Managers" (
    "Title" INT   NOT NULL,
    "Dept_Employee" INT   NOT NULL,
    "dept_no" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" INT   NOT NULL,
    "to_date" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Managers" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Dept_Managers" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" INT   NOT NULL,
    "to_date" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_Employee" FOREIGN KEY("Employee")
REFERENCES "Employee" ("");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_Departments" FOREIGN KEY("Departments")
REFERENCES "Departments" ("");

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_Dept_Employee" FOREIGN KEY("Dept_Employee")
REFERENCES "Employee" ("");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_Title" FOREIGN KEY("Title")
REFERENCES "Employee" ("");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_Dept_Employee" FOREIGN KEY("Dept_Employee")
REFERENCES "Departments" ("");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Dept_Managers" FOREIGN KEY("Dept_Managers")
REFERENCES "Employee" ("");

