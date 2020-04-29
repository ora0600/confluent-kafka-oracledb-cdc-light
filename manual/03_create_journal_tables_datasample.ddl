-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-03-04 17:02:42 CET
--   site:      Oracle Database 12cR2
--   type:      Oracle Database 12cR2

CREATE TABLE KAFKA.CONTACTS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,CONTACT_ID NUMBER(10,0) NOT NULL
 ,FIRST_NAME VARCHAR2 (255 BYTE) NOT NULL
 ,LAST_NAME VARCHAR2 (255 BYTE) NOT NULL
 ,EMAIL VARCHAR2 (255 BYTE) NOT NULL
 ,PHONE VARCHAR2 (20 BYTE)
 ,CUSTOMER_ID NUMBER(10,0)
 );

CREATE OR REPLACE TRIGGER KAFKA.CONTACTS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.CONTACTS for each row 
 Declare 
  rec KAFKA.CONTACTS_JN%ROWTYPE; 
  blank KAFKA.CONTACTS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.CONTACT_ID := :NEW.CONTACT_ID; 
      rec.FIRST_NAME := :NEW.FIRST_NAME; 
      rec.LAST_NAME := :NEW.LAST_NAME; 
      rec.EMAIL := :NEW.EMAIL; 
      rec.PHONE := :NEW.PHONE; 
      rec.CUSTOMER_ID := :NEW.CUSTOMER_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.CONTACT_ID := :OLD.CONTACT_ID; 
      rec.FIRST_NAME := :OLD.FIRST_NAME; 
      rec.LAST_NAME := :OLD.LAST_NAME; 
      rec.EMAIL := :OLD.EMAIL; 
      rec.PHONE := :OLD.PHONE; 
      rec.CUSTOMER_ID := :OLD.CUSTOMER_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.CONTACTS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.COUNTRIES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,COUNTRY_ID CHAR (2 BYTE) NOT NULL
 ,COUNTRY_NAME VARCHAR2 (40 BYTE) NOT NULL
 ,REGION_ID NUMBER(10,0)
 );

CREATE OR REPLACE TRIGGER KAFKA.COUNTRIES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.COUNTRIES for each row 
 Declare 
  rec KAFKA.COUNTRIES_JN%ROWTYPE; 
  blank KAFKA.COUNTRIES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.COUNTRY_ID := :NEW.COUNTRY_ID; 
      rec.COUNTRY_NAME := :NEW.COUNTRY_NAME; 
      rec.REGION_ID := :NEW.REGION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.COUNTRY_ID := :OLD.COUNTRY_ID; 
      rec.COUNTRY_NAME := :OLD.COUNTRY_NAME; 
      rec.REGION_ID := :OLD.REGION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.COUNTRIES_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.CUSTOMERS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,CUSTOMER_ID NUMBER(10,0) NOT NULL
 ,NAME VARCHAR2 (255 BYTE) NOT NULL
 ,ADDRESS VARCHAR2 (255 BYTE)
 ,WEBSITE VARCHAR2 (255 BYTE)
 ,CREDIT_LIMIT NUMBER (8,2)
 );

CREATE OR REPLACE TRIGGER KAFKA.CUSTOMERS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.CUSTOMERS for each row 
 Declare 
  rec KAFKA.CUSTOMERS_JN%ROWTYPE; 
  blank KAFKA.CUSTOMERS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.CUSTOMER_ID := :NEW.CUSTOMER_ID; 
      rec.NAME := :NEW.NAME; 
      rec.ADDRESS := :NEW.ADDRESS; 
      rec.WEBSITE := :NEW.WEBSITE; 
      rec.CREDIT_LIMIT := :NEW.CREDIT_LIMIT; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.CUSTOMER_ID := :OLD.CUSTOMER_ID; 
      rec.NAME := :OLD.NAME; 
      rec.ADDRESS := :OLD.ADDRESS; 
      rec.WEBSITE := :OLD.WEBSITE; 
      rec.CREDIT_LIMIT := :OLD.CREDIT_LIMIT; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.CUSTOMERS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.EMPLOYEES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,EMPLOYEE_ID NUMBER(10,0) NOT NULL
 ,FIRST_NAME VARCHAR2 (255 BYTE) NOT NULL
 ,LAST_NAME VARCHAR2 (255 BYTE) NOT NULL
 ,EMAIL VARCHAR2 (255 BYTE) NOT NULL
 ,PHONE VARCHAR2 (50 BYTE) NOT NULL
 ,HIRE_DATE DATE NOT NULL
 ,MANAGER_ID NUMBER (12,0)
 ,JOB_TITLE VARCHAR2 (255 BYTE) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.EMPLOYEES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.EMPLOYEES for each row 
 Declare 
  rec KAFKA.EMPLOYEES_JN%ROWTYPE; 
  blank KAFKA.EMPLOYEES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.EMPLOYEE_ID := :NEW.EMPLOYEE_ID; 
      rec.FIRST_NAME := :NEW.FIRST_NAME; 
      rec.LAST_NAME := :NEW.LAST_NAME; 
      rec.EMAIL := :NEW.EMAIL; 
      rec.PHONE := :NEW.PHONE; 
      rec.HIRE_DATE := :NEW.HIRE_DATE; 
      rec.MANAGER_ID := :NEW.MANAGER_ID; 
      rec.JOB_TITLE := :NEW.JOB_TITLE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.EMPLOYEE_ID := :OLD.EMPLOYEE_ID; 
      rec.FIRST_NAME := :OLD.FIRST_NAME; 
      rec.LAST_NAME := :OLD.LAST_NAME; 
      rec.EMAIL := :OLD.EMAIL; 
      rec.PHONE := :OLD.PHONE; 
      rec.HIRE_DATE := :OLD.HIRE_DATE; 
      rec.MANAGER_ID := :OLD.MANAGER_ID; 
      rec.JOB_TITLE := :OLD.JOB_TITLE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.EMPLOYEES_JN VALUES rec; 
  END; 
  /
  

CREATE TABLE KAFKA.INVENTORIES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,PRODUCT_ID NUMBER (12,0) NOT NULL
 ,WAREHOUSE_ID NUMBER (12,0) NOT NULL
 ,QUANTITY NUMBER (8,0) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.INVENTORIES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.INVENTORIES for each row 
 Declare 
  rec KAFKA.INVENTORIES_JN%ROWTYPE; 
  blank KAFKA.INVENTORIES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.PRODUCT_ID := :NEW.PRODUCT_ID; 
      rec.WAREHOUSE_ID := :NEW.WAREHOUSE_ID; 
      rec.QUANTITY := :NEW.QUANTITY; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.PRODUCT_ID := :OLD.PRODUCT_ID; 
      rec.WAREHOUSE_ID := :OLD.WAREHOUSE_ID; 
      rec.QUANTITY := :OLD.QUANTITY; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.INVENTORIES_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.LOCATIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,LOCATION_ID NUMBER(10,0) NOT NULL
 ,ADDRESS VARCHAR2 (255 BYTE) NOT NULL
 ,POSTAL_CODE VARCHAR2 (20 BYTE)
 ,CITY VARCHAR2 (50 BYTE)
 ,STATE VARCHAR2 (50 BYTE)
 ,COUNTRY_ID CHAR (2 BYTE)
 );

CREATE OR REPLACE TRIGGER KAFKA.LOCATIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.LOCATIONS for each row 
 Declare 
  rec KAFKA.LOCATIONS_JN%ROWTYPE; 
  blank KAFKA.LOCATIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.LOCATION_ID := :NEW.LOCATION_ID; 
      rec.ADDRESS := :NEW.ADDRESS; 
      rec.POSTAL_CODE := :NEW.POSTAL_CODE; 
      rec.CITY := :NEW.CITY; 
      rec.STATE := :NEW.STATE; 
      rec.COUNTRY_ID := :NEW.COUNTRY_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.LOCATION_ID := :OLD.LOCATION_ID; 
      rec.ADDRESS := :OLD.ADDRESS; 
      rec.POSTAL_CODE := :OLD.POSTAL_CODE; 
      rec.CITY := :OLD.CITY; 
      rec.STATE := :OLD.STATE; 
      rec.COUNTRY_ID := :OLD.COUNTRY_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.LOCATIONS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.ORDER_ITEMS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,ORDER_ID NUMBER (12,0) NOT NULL
 ,ITEM_ID NUMBER (12,0) NOT NULL
 ,PRODUCT_ID NUMBER (12,0) NOT NULL
 ,QUANTITY NUMBER (8,2) NOT NULL
 ,UNIT_PRICE NUMBER (8,2) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.ORDER_ITEMS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.ORDER_ITEMS for each row 
 Declare 
  rec KAFKA.ORDER_ITEMS_JN%ROWTYPE; 
  blank KAFKA.ORDER_ITEMS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ORDER_ID := :NEW.ORDER_ID; 
      rec.ITEM_ID := :NEW.ITEM_ID; 
      rec.PRODUCT_ID := :NEW.PRODUCT_ID; 
      rec.QUANTITY := :NEW.QUANTITY; 
      rec.UNIT_PRICE := :NEW.UNIT_PRICE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ORDER_ID := :OLD.ORDER_ID; 
      rec.ITEM_ID := :OLD.ITEM_ID; 
      rec.PRODUCT_ID := :OLD.PRODUCT_ID; 
      rec.QUANTITY := :OLD.QUANTITY; 
      rec.UNIT_PRICE := :OLD.UNIT_PRICE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.ORDER_ITEMS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.ORDERS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,ORDER_ID NUMBER(10,0) NOT NULL
 ,CUSTOMER_ID NUMBER (6,0) NOT NULL
 ,STATUS VARCHAR2 (20 BYTE) NOT NULL
 ,SALESMAN_ID NUMBER (6,0)
 ,ORDER_DATE DATE NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.ORDERS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.ORDERS for each row 
 Declare 
  rec KAFKA.ORDERS_JN%ROWTYPE; 
  blank KAFKA.ORDERS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ORDER_ID := :NEW.ORDER_ID; 
      rec.CUSTOMER_ID := :NEW.CUSTOMER_ID; 
      rec.STATUS := :NEW.STATUS; 
      rec.SALESMAN_ID := :NEW.SALESMAN_ID; 
      rec.ORDER_DATE := :NEW.ORDER_DATE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ORDER_ID := :OLD.ORDER_ID; 
      rec.CUSTOMER_ID := :OLD.CUSTOMER_ID; 
      rec.STATUS := :OLD.STATUS; 
      rec.SALESMAN_ID := :OLD.SALESMAN_ID; 
      rec.ORDER_DATE := :OLD.ORDER_DATE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.ORDERS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.PRODUCT_CATEGORIES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,CATEGORY_ID NUMBER(10,0) NOT NULL
 ,CATEGORY_NAME VARCHAR2 (255 BYTE) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.PRODUCT_CATEGORIES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.PRODUCT_CATEGORIES for each row 
 Declare 
  rec KAFKA.PRODUCT_CATEGORIES_JN%ROWTYPE; 
  blank KAFKA.PRODUCT_CATEGORIES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.CATEGORY_ID := :NEW.CATEGORY_ID; 
      rec.CATEGORY_NAME := :NEW.CATEGORY_NAME; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.CATEGORY_ID := :OLD.CATEGORY_ID; 
      rec.CATEGORY_NAME := :OLD.CATEGORY_NAME; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.PRODUCT_CATEGORIES_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.PRODUCTS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,PRODUCT_ID NUMBER(10,0) NOT NULL
 ,PRODUCT_NAME VARCHAR2 (255 BYTE) NOT NULL
 ,DESCRIPTION VARCHAR2 (2000 BYTE)
 ,STANDARD_COST NUMBER (9,2)
 ,LIST_PRICE NUMBER (9,2)
 ,CATEGORY_ID NUMBER(10,0) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.PRODUCTS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.PRODUCTS for each row 
 Declare 
  rec KAFKA.PRODUCTS_JN%ROWTYPE; 
  blank KAFKA.PRODUCTS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.PRODUCT_ID := :NEW.PRODUCT_ID; 
      rec.PRODUCT_NAME := :NEW.PRODUCT_NAME; 
      rec.DESCRIPTION := :NEW.DESCRIPTION; 
      rec.STANDARD_COST := :NEW.STANDARD_COST; 
      rec.LIST_PRICE := :NEW.LIST_PRICE; 
      rec.CATEGORY_ID := :NEW.CATEGORY_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.PRODUCT_ID := :OLD.PRODUCT_ID; 
      rec.PRODUCT_NAME := :OLD.PRODUCT_NAME; 
      rec.DESCRIPTION := :OLD.DESCRIPTION; 
      rec.STANDARD_COST := :OLD.STANDARD_COST; 
      rec.LIST_PRICE := :OLD.LIST_PRICE; 
      rec.CATEGORY_ID := :OLD.CATEGORY_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.PRODUCTS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.REGIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,REGION_ID NUMBER(10,0) NOT NULL
 ,REGION_NAME VARCHAR2 (50 BYTE) NOT NULL
 );

CREATE OR REPLACE TRIGGER KAFKA.REGIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.REGIONS for each row 
 Declare 
  rec KAFKA.REGIONS_JN%ROWTYPE; 
  blank KAFKA.REGIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.REGION_ID := :NEW.REGION_ID; 
      rec.REGION_NAME := :NEW.REGION_NAME; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.REGION_ID := :OLD.REGION_ID; 
      rec.REGION_NAME := :OLD.REGION_NAME; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.REGIONS_JN VALUES rec; 
  END; 
  /

CREATE TABLE KAFKA.WAREHOUSES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38,0)
 ,WAREHOUSE_ID NUMBER(10,0) NOT NULL
 ,WAREHOUSE_NAME VARCHAR2 (255 BYTE)
 ,LOCATION_ID NUMBER (12,0)
 );

CREATE OR REPLACE TRIGGER KAFKA.WAREHOUSES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON KAFKA.WAREHOUSES for each row 
 Declare 
  rec KAFKA.WAREHOUSES_JN%ROWTYPE; 
  blank KAFKA.WAREHOUSES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.WAREHOUSE_ID := :NEW.WAREHOUSE_ID; 
      rec.WAREHOUSE_NAME := :NEW.WAREHOUSE_NAME; 
      rec.LOCATION_ID := :NEW.LOCATION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.WAREHOUSE_ID := :OLD.WAREHOUSE_ID; 
      rec.WAREHOUSE_NAME := :OLD.WAREHOUSE_NAME; 
      rec.LOCATION_ID := :OLD.LOCATION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into KAFKA.WAREHOUSES_JN VALUES rec; 
  END; 
  /