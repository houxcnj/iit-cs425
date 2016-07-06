--Xiaocheng Hou A20309864
create or replace PROCEDURE QUESTION4(fst IN char,lst IN char,ct OUT NUMBER,fsto1 OUT char,lsto1 OUT char,fsto2 OUT char,lsto2 OUT char)
AS

Cursor C1 IS
SELECT f_name,l_name FROM INSTRUCTOR;

Cursor C2 IS
SELECT f_name,l_name FROM RECCENTERMEMBER;

BEGIN
  ct:=0;
  OPEN C1;
  LOOP
      FETCH C1 into fsto1,lsto1;
      EXIT WHEN C1%NOTFOUND;
      IF fst=fsto1 AND lst=lsto1 THEN
        DBMS_OUTPUT.PUT_LINE('He is an instructor!');
        ct:=1;
      END IF;
  END LOOP;
  CLOSE C1;
  
  OPEN C2;
  LOOP
      FETCH C2 into fsto2,lsto2;
      EXIT WHEN C2%NOTFOUND;
      IF fst=fsto2 AND lst=lsto2 THEN
        DBMS_OUTPUT.PUT_LINE('He is a member of center!');
        ct:=1;
      END IF;
  END LOOP;
  CLOSE C2;
  IF ct=0 THEN
  DBMS_OUTPUT.PUT_LINE('He is not in database!');
  END IF;
END;
