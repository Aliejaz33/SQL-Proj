-- create a table
CREATE TABLE students (
  sid INTEGER PRIMARY KEY,
  sname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  avgrage float NOT NULL,
  clgId INTEGER NOT NULL
);
CREATE TABLE prof (
  
  pname VARCHAR(30) NOT NULL PRIMARY KEY,
  esp VARCHAR(30) NOT NULL,
  degree VARCHAR(30) NOT NULL,
  clgId INTEGER NOT NULL
);
CREATE TABLE crs (
  cid INTEGER PRIMARY KEY,
  cname VARCHAR(30) NOT NULL,
  unit INTEGER NOT NULL,
  clgId INTEGER NOT NULL
);
CREATE TABLE clg (
  clgid INTEGER PRIMARY KEY,
  clgname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  pname VARCHAR(30) NOT NULL
);

CREATE TABLE sec (
  sid INTEGER NOT NULL,
  cid INTEGER not NULL,
  pname VARCHAR(30) NOT NULL,
  PRIMARY KEY(sid,cid)
);



INSERT INTO students VALUES (6, 'ali', 'hamedan',17.70,101);
INSERT INTO students VALUES (2, 'sara', 'tehran',18,101);
INSERT INTO students VALUES (5, 'taha', 'hamedan',14.22,100);
INSERT INTO students VALUES (9, 'arman', 'ahvaz',16.5,102);
INSERT INTO students VALUES (3, 'farshid', 'tabriz',20,100);


INSERT INTO prof VALUES ('shirafkan', 'coumputer', 'doctora',100);
INSERT INTO prof VALUES ('mohammadi', 'coumputer', 'arshad',100);
INSERT INTO prof VALUES ('hasani', 'riazi', 'doctora',102);
INSERT INTO prof VALUES ('rasti', 'zaban', 'arshad',101);
INSERT INTO prof VALUES ('amini', 'coumputer', 'doctora',102);

INSERT INTO crs VALUES (20, 'riazi', 3,101);
INSERT INTO crs VALUES (22, 'algoritm', 4,100);
INSERT INTO crs VALUES (21, 'database', 3,100);
INSERT INTO crs VALUES (23, 'zaban', 2,101);

INSERT INTO clg VALUES (100, 'tehran', 'shirafkan',101);
INSERT INTO clg VALUES (101, 'shiraz', 'rasti',101);
INSERT INTO clg VALUES (102, 'hamedan', 'amini',101);



INSERT INTO sec VALUES (6,22,'hasani');
INSERT INTO sec VALUES (2,23,'rasti');
INSERT INTO sec VALUES (6,20,'shirafkan');
INSERT INTO sec VALUES (5,22,'shirafkan');
INSERT INTO sec VALUES (9,21,'amini');


-- دانشجویان که معدل بالا 17 دارند
select * from students 
where avgrage>17;


-- استاد دارای مدرک دکتری 
select * from prof where degree='doctora';





-- دروسی که استاد شیرافکن درس میدهد
select cname from crs where cid in (
select cid from sec where pname='shirafkan'
);



-- نام اساتید که دروس 3 واحدی درس میدهند
select pname from prof where pname in (
     select pname from sec where cid in(
        select cid from crs where unit=3
     )
);






