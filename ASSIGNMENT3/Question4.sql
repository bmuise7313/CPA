DECLARE
TYPE studentz IS RECORD (
FIRST_NAME VARCHAR2(20),
LAST_NAME VARCHAR2(20),
FINAL_GRADE NUMBER);

TYPE tblStudent IS TABLE OF studentz;
student tblStudent := tblStudent();
cnt PLS_INTEGER :=1;
BEGIN
  for n in (SELECT last_name,first_name,final_grade FROM studentdb.student
  JOIN studentdb.enrollment ON studentdb.student.student_id = studentdb.enrollment.student_id) LOOP
  student.extend;
    student(cnt).first_name := n.first_name;
    student(cnt).last_name := n.last_name;
   student(cnt).FINAL_GRADE := n.FINAL_GRADE;
    DBMS_OUTPUT.PUT_LINE(student(cnt).first_name || ' ' || student(cnt).last_name || ' ' || student(cnt).final_grade);
    cnt := cnt+1;
    END LOOP;
END;