create table students (
    snum int,
    ssn int,
    name varchar(10),
    gender char(1),
    dob date,
    c_addr varchar(20),
    c_phone varchar(10),
    p_addr varchar(20),
    p_phone varchar(10),
    PRIMARY KEY(ssn),
    UNIQUE(snum)
);

create table departments (
    code int,
    name varchar(50),
    phone varchar(10),
    college varchar(20),
    PRIMARY KEY(code),
    UNIQUE(name)
);

create table degrees (
    name varchar(50),
    level varchar(5),
    department_code int,
    PRIMARY KEY(name, level),
    FOREIGN KEY(department_code) REFERENCES departments(code)
);

create table courses (
    number int,
    name varchar(50),
    description varchar(50),
    credithours int,
    level varchar(20),
    department_code int,
    PRIMARY KEY(number),
    UNIQUE(name),
    FOREIGN KEY(department_code) REFERENCES departments(code)
);

create table register (
    snum int,
    course_number int,
    regtime varchar(20),
    grade int,
    PRIMARY KEY(snum, course_number),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(course_number) REFERENCES courses(number)
);

create table major (
    snum int,
    name varchar(50),
    level varchar(5),
    PRIMARY KEY(snum, name, level),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(name, level) REFERENCES degrees(name, level)
);

create table minor (
    snum int,
    name varchar(50),
    level varchar(5),
    PRIMARY KEY(snum, name, level),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(name, level) REFERENCES degrees(name, level)
);