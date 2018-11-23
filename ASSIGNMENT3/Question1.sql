DECLARE
TYPE tblInstructor IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
instructors tblInstructor;
cnt PLS_INTEGER :=1;
BEGIN
  for n in (SELECT salutation,last_name,first_name FROM studentdb.instructor) LOOP
    instructors(cnt) := n.SALUTATION || ' ' || n.FIRST_NAME || ' ' || n.LAST_NAME;
    DBMS_OUTPUT.PUT_LINE(instructors(cnt));
    cnt := cnt+1;
    END LOOP;
END;