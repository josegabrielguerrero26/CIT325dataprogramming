/*
||  Name:          apply_plsql_lab3.sql
||  Date:          17 January 2023
||  Purpose:       Complete 325 Chapter 4 lab.
*/

-- Call seeding libraries.
-- @$LIB/cleanup_oracle.sql
-- @$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql
@verify_date.sql
-- Open log file.
-- SPOOL apply_plsql_lab3.txt

-- Enter your solution here.

SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
DECLARE
 -- declaring variables
    TYPE list IS TABLE OF VARCHAR2(100);
    lv_input1 VARCHAR2(100);
    lv_input2 VARCHAR2(100);
    lv_input3 VARCHAR2(100);
    lv_strings LIST;
	
	TYPE three_type IS RECORD
    (xnum NUMBER
    , xdate DATE
    , xstring VARCHAR2(100)
    );
    
    lv_three_type three_type; -- declare the type variable
    
BEGIN
	lv_input1:= '&1';
    lv_input2:= '&2';
    lv_input3:= '&3';
    
	lv_strings:= list(lv_input1,lv_input2,lv_input3);

   /* Loop through list of values */
   FOR i IN 1..lv_strings.COUNT LOOP
        IF  REGEXP_LIKE(lv_strings(i), '^[[:digit:]]*$') THEN
            lv_three_type.xnum := lv_strings(i);
        ELSIF verify_date(lv_strings(i)) IS NOT NULL THEN
            lv_three_type.xdate := lv_strings(i);
        ELSIF REGEXP_LIKE(lv_strings(i), '^[[:alnum:]]*$') THEN
            lv_three_type.xstring := lv_strings(i);
        END IF;
    END LOOP;
	dbms_output.put_line('Record: ['||lv_three_type.xnum||'] ['||lv_three_type.xstring||'] ['||lv_three_type.xdate||']');

END;
/
-- Close log file.  ||lv_strings(i)||
-- SPOOL OFF
 -- QUIT;
