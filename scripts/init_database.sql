/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'staging', 'clean', and 'reporting'.
	
WARNINGS:
    ⚠️  DATA LOSS: Running this script will drop the entire 'DataWarehouse' database if it exists. 
        All data in the database will be permanently deleted. Proceed with caution 
        and ensure you have proper backups before running this script.
    
    ⚠️  CONNECTION TERMINATION: This script will immediately terminate ALL active connections 
        to the DataWarehouse database, including:
        - Active user sessions and queries
        - Open transactions (will be rolled back)
        - Application connections
        - SSMS connections
        - Any other database connections
    
    ⚠️  BACKUP: Always create a backup before running this script if the database 
        contains important data that cannot be recreated.
*/


USE master;
GO
    
-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO
    
-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO
    
USE DataWarehouse;
GO
    
-- Create Schemas
CREATE SCHEMA staging;
GO
    
CREATE SCHEMA clean;
GO
    
CREATE SCHEMA reporting;
GO
    

