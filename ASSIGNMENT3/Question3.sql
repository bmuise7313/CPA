DECLARE
TYPE student IS RECORD (
FIRST_NAME VARCHAR2(20),
LAST_NAME VARCHAR2(20),
FINAL_GRADE PLS_INTEGER);

TYPE tblStudent IS TABLE OF student INDEX BY PLS_INTEGER;

StudentTbl tblStudent;
cnt PLS_INTEGER :=1;
BEGIN
  for n in (SELECT last_name,first_name,final_grade FROM studentdb.student
  JOIN studentdb.enrollment ON studentdb.student.student_id = studentdb.enrollment.student_id) LOOP
    StudentTbl(cnt).first_name := n.first_name;
    StudentTbl(cnt).last_name := n.last_name;
    StudentTbl(cnt).final_grade := n.final_grade;
    DBMS_OUTPUT.PUT_LINE(StudentTbl(cnt).first_name || ' ' || StudentTbl(cnt).last_name || ' ' || StudentTbl(cnt).final_grade);
    cnt := cnt+1;
    END LOOP;
END;