--Xiaocheng Hou A20309864
create or replace PROCEDURE QUESTION2
(se in CHAR, ye in NUMBER, cls OUT CHAR) AS

theYear CLASS.YEAR%TYPE;
theSeason CLASS.SEASON%TYPE;

CURSOR C IS 
SELECT title, YEAR, SEASON
FROM CLASS
WHERE SEASON=se OR YEAR=ye;

BEGIN
  OPEN C;
  LOOP
    FETCH C INTO cls, theYear, theSeason;
    EXIT WHEN C%NOTFOUND;
    IF (se IS NULL) THEN
    DBMS_OUTPUT.PUT_LINE('Class given in this year is '||cls);
    ELSIF (ye IS NULL) THEN
    DBMS_OUTPUT.PUT_LINE('Class given in this season is '||cls);
    ELSIF (ye=theYear AND se=theSeason) THEN
    DBMS_OUTPUT.PUT_LINE('Class given in this season and year is '||cls);
    /*ELSE
    DBMS_OUTPUT.PUT_LINE('No data, please input another year and season');*/
    END IF;
  END LOOP;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No data');
  END;
