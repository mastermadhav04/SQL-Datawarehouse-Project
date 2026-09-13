/*
===========================================================
Create Database and Schemas
===========================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database : 'bronze', 'silver', and 'gold'.

Warning: 
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data inside the database will be permanently deleted. Proceed with caution and ensure we have
    proper backups before running this script.
*/

USE master; -- master database is the main control center of a SQL server instance (server directory)
GO 
---- 'GO' is a SQL separator, which is telling SQL Server to firstly excecute the above command, 
---- then executing the next command.

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
---- the above command forces the database into Single-user mode and tells it to cancels all the 
---- active queries of other users connected to the database (ROLLBACK IMMEDIATE).
    DROP DATABASE DataWarehouse;
END;
GO
  
-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO 

USE DataWarehouse;
GO 

-- Create Schemas 
CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
