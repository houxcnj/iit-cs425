--Xiaocheng Hou

/*
  declare a FamilyPackage table
  Because there is no foreign key in the table
*/
CREATE TABLE FamilyPackage (
  id INT UNIQUE,
  address VARCHAR(50),
  phone CHAR(12)
);

/*
  Create a RecCenterMember table
  which has a foreign key reference in FamilyPackage
*/
CREATE TABLE RecCenterMember (
  id INT PRIMARY KEY,
  f_name CHAR(30),
  l_name CHAR(30),
  dob DATE,
  family_id INT REFERENCES FamilyPackage(id)
);

/*
  Create a Type table, no foreign key.
  Then, we can create others.
*/
CREATE TABLE Type (
  type CHAR(20) PRIMARY KEY,
  description VARCHAR(60)
);

/*
  Declare a Instructor table
  which has a foreign key reference in RecCenterMember
*/
CREATE TABLE Instructor (
  id INT PRIMARY KEY,
  f_name CHAR(30),
  l_name CHAR(30),
  member_id INT REFERENCES RecCenterMember(id)
);

/*
  Create a Class table
  which has two foreign keys reference in Type and Instructor
*/  
CREATE TABLE Class (
  id INT UNIQUE,
  title CHAR(30),
  type CHAR(20) REFERENCES Type(type),
  instructor INT,
  season CHAR(10),
  year INT,
  FOREIGN KEY(instructor) REFERENCES Instructor(id)
);

/*
  Declare a Enrollment table
  which has two foreign keys reference in class and RecCenterMember
*/    
CREATE TABLE Enrollment (
  class_id INT REFERENCES Class(id),
  member_id INT REFERENCES RecCenterMember(id),
  cost INT,
  UNIQUE(class_id, member_id)
);