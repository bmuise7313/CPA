DECLARE
CURSOR c_instructors is
SELECT SALUTATION, FIRST_NAME , LAST_NAME FROM STUDENTDB.INSTRUCTOR;
TYPE c_list IS VARRAY(20) OF VARCHAR(30);
instructors c_list := c_list();
cnt PLS_INTEGER :=0;
BEGIN
  for n in c_instructors LOOP
    cnt := cnt+1;
    instructors.extend;
    instructors(cnt) := n.SALUTATION || ' ' || n.FIRST_NAME || ' ' || n.LAST_NAME;
    DBMS_OUTPUT.PUT_LINE(instructors(cnt));
    END LOOP;
END;