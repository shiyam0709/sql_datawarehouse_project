\c postgres

select pg_terminate_backend(pid) from pg_stat_activity where datname = 'sql_datawarehouse_project';

drop database if exists sql_datawarehouse_project;

create database sql_datawarehouse_project;

\c sql_datawarehouse_project

create schema bronze;

create schema silver;

create schema gold;
