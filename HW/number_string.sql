SET SERVEROUTPUT ON SIZE UNLIMITED
DECLARE
  /* Declare a collection of strings. */
  TYPE list IS TABLE OF VARCHAR2(12);
  /* Declare a variable of the string collection. */
  lv_strings  LIST := list('10','Ten','Twelve12','28-FEB-2016');
BEGIN
  /* Loop through list of values to find only the numbers. */
  FOR i IN 1..lv_strings.COUNT LOOP
    IF REGEXP_LIKE(lv_strings(i),'^[[:digit:]]*$') OR
       REGEXP_LIKE(lv_strings(i),'^[0-9]{2,2}-[[:alpha:]]{3,3}-([0-9]{2,2}|[0-9]{4,4})$') OR
       REGEXP_LIKE(lv_strings(i),'^[[:alnum:]]*$') THEN
       dbms_output.put_line('Print string ['||lv_strings(i)||']');
    END IF;
  END LOOP;
END;
/