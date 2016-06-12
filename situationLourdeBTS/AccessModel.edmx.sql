
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/07/2016 20:13:49
-- Generated from EDMX file: C:\Users\Ghis\documents\visual studio 2015\Projects\situationLourdeBTS\situationLourdeBTS\AccessModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [situationBTSLourde];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AccessRooms_dbo_Rooms_RoomId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccessRooms] DROP CONSTRAINT [FK_dbo_AccessRooms_dbo_Rooms_RoomId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AccessRooms_dbo_SecurityLevels_SecurityLevelsId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccessRooms] DROP CONSTRAINT [FK_dbo_AccessRooms_dbo_SecurityLevels_SecurityLevelsId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Employees_dbo_SecurityLevels_SecurityLevelsId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_dbo_Employees_dbo_SecurityLevels_SecurityLevelsId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AccessRooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccessRooms];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Rooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rooms];
GO
IF OBJECT_ID(N'[dbo].[SecurityLevels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SecurityLevels];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [SecurityLevelId] int  NOT NULL,
    [ClearanceExpiration] datetime  NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- Creating table 'SecurityLevels'
CREATE TABLE [dbo].[SecurityLevels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'AccessRooms'
CREATE TABLE [dbo].[AccessRooms] (
    [Rooms_Id] int  NOT NULL,
    [SecurityLevels_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SecurityLevels'
ALTER TABLE [dbo].[SecurityLevels]
ADD CONSTRAINT [PK_SecurityLevels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Rooms_Id], [SecurityLevels_Id] in table 'AccessRooms'
ALTER TABLE [dbo].[AccessRooms]
ADD CONSTRAINT [PK_AccessRooms]
    PRIMARY KEY CLUSTERED ([Rooms_Id], [SecurityLevels_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SecurityLevelId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_dbo_Employees_dbo_SecurityLevels_SecurityLevelsId]
    FOREIGN KEY ([SecurityLevelId])
    REFERENCES [dbo].[SecurityLevels]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Employees_dbo_SecurityLevels_SecurityLevelsId'
CREATE INDEX [IX_FK_dbo_Employees_dbo_SecurityLevels_SecurityLevelsId]
ON [dbo].[Employees]
    ([SecurityLevelId]);
GO

-- Creating foreign key on [Rooms_Id] in table 'AccessRooms'
ALTER TABLE [dbo].[AccessRooms]
ADD CONSTRAINT [FK_AccessRooms_Rooms]
    FOREIGN KEY ([Rooms_Id])
    REFERENCES [dbo].[Rooms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SecurityLevels_Id] in table 'AccessRooms'
ALTER TABLE [dbo].[AccessRooms]
ADD CONSTRAINT [FK_AccessRooms_SecurityLevels]
    FOREIGN KEY ([SecurityLevels_Id])
    REFERENCES [dbo].[SecurityLevels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccessRooms_SecurityLevels'
CREATE INDEX [IX_FK_AccessRooms_SecurityLevels]
ON [dbo].[AccessRooms]
    ([SecurityLevels_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------