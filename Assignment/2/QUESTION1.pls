--Xiaocheng Hou A20309864
create or replace PROCEDURE QUESTION1
(t in CHAR, fst OUT CHAR, lst OUT CHAR, cls OUT CHAR) AS

CURSOR C IS 
SELECT title, f_name, l_name
FROM (
SELECT type, title, f_name, l_name
FROM CLASS, INSTRUCTOR
WHERE CLASS.INSTRUCTOR=INSTRUCTOR.ID) STP
WHERE STP.TYPE = t;


BEGIN
  OPEN C;
  LOOP 
        FETCH C INTO cls,fst,lst;
        EXIT WHEN C%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('The title in this type is '||cls||'The teacher is '||fst||''||lst);
  END LOOP;
  CLOSE C;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No data');
  END;
