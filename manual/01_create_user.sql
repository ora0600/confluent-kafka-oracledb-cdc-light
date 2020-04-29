--------------------------------------------------------------------------------------
-- Name	       : OT (Oracle Tutorial) Sample Database
--------------------------------------------------------------------
-- execute the following statements to create a user name OT and
-- grant priviledges
--------------------------------------------------------------------

-- create new user
Create user kafka identified by yourpassword;

-- grant priviledges
grant RESOURCE to kafka;
grant create session to kafka;

-- give right to write data to tablespace
alter user kafka quota 50m on data;