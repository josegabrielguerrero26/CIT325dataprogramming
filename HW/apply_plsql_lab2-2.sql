/*
||  Name:          apply_plsql_lab2-2.sql
||  Date:          11 Ene 2023
||  Purpose:       Complete 325 Chapter 3 lab2-2.
*/

-- Call seeding libraries.
-- @$LIB/cleanup_oracle.sql
-- @$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
-

-- environment command to allow PL/SQL to print to console.
SET SERVEROUTPUT ON SIZE UNLIMITED
SET VERIFY OFF

DECLARE
    lv_raw_input varchar2(20):= '&input';
    lv_input varchar2(20);
    
BEGIN
    IF LENGTH(lv_raw_input) <= 10 THEN
		dbms_output.put_line('Less than 10 characters. Then, Hello '||lv_raw_input);   
    ELSIF LENGTH(lv_raw_input) >10 THEN
        lv_input := SUBSTR(lv_raw_input,1,10);
		dbms_output.put_line('More than 10 character. Then: Hello '||lv_input);
    ELSE
         dbms_output.put_line('No characters in : '||lv_raw_input||'Then: Hello World!');
    END IF;	

END;
/

-- Close log file.

QUIT;