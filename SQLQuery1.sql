CREATE TABLE [dbo].[Rooms] ( 
    [Id] [int] NOT NULL IDENTITY, 
    [Name] [nvarchar](max), 
    CONSTRAINT [PK_dbo.Rooms] PRIMARY KEY ([Id]) 
) 

CREATE TABLE [dbo].[AccessRooms] ( 
    [RoomId] [int] NOT NULL, 
    [SecurityLevelId] [int] NOT NULL
) 
 
CREATE TABLE [dbo].[Employees] ( 
    [Id] [int] NOT NULL IDENTITY, 
    [Name] [nvarchar](max), 
	[SecurityLevelId] [int] NOT NULL,
    [ClearanceExpiration] [DateTime], 
    CONSTRAINT [PK_dbo.Employees] PRIMARY KEY ([Id]) 
) 

CREATE TABLE [dbo].[SecurityLevels] ( 
    [Id] [int] NOT NULL IDENTITY, 
    [Description] [nvarchar](max)
    CONSTRAINT [PK_dbo.SecurityLevels] PRIMARY KEY ([Id]) 
) 
 
CREATE INDEX [IX_SecurityLevelId] ON [dbo].[Employees]([SecurityLevelId]) 
 
ALTER TABLE [dbo].[AccessRooms] ADD CONSTRAINT [FK_dbo.AccessRooms_dbo.Rooms_RoomId] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Rooms] ([Id]) ON DELETE CASCADE

ALTER TABLE [dbo].[AccessRooms] ADD CONSTRAINT [FK_dbo.AccessRooms_dbo.SecurityLevels_SecurityLevelsId] FOREIGN KEY ([SecurityLevelId]) REFERENCES [dbo].[SecurityLevels] ([Id]) ON DELETE CASCADE

ALTER TABLE [dbo].[Employees] ADD CONSTRAINT [FK_dbo.Employees_dbo.SecurityLevels_SecurityLevelsId] FOREIGN KEY ([SecurityLevelId]) REFERENCES [dbo].[SecurityLevels] ([Id]) ON DELETE CASCADE