USE [master]
GO
/****** Object:  Database [PRJ301_CarRegistration]    Script Date: 3/4/2024 5:26:44 AM ******/
CREATE DATABASE [PRJ301_CarRent]
use [PRJ301_CarRent]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[cmnd] [varchar](255) NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[nameOfCar] [nvarchar](255) NULL,
	[CodeCar] [nvarchar](255) NULL,
	[accepted] [int] NULL,
	[createdAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/4/2024 5:26:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[displayName] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[dob] [date] NOT NULL,
	[phoneNumber] [nvarchar](100) NOT NULL,
	[registerAt] [datetime] NOT NULL,
	[lastLogin] [datetime] NOT NULL,
	[isAdmin] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 

SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
INSERT [dbo].[User] ([username], [password], [displayName], [email], [dob], [phoneNumber], [registerAt], [lastLogin], [isAdmin]) VALUES (N'admin', N'123', N'123', N'1234', CAST(N'2023-12-12' AS Date), N'2023-12-12', CAST(N'2023-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([username], [password], [displayName], [email], [dob], [phoneNumber], [registerAt], [lastLogin], [isAdmin]) VALUES (N'heh1', N'123', N'1', N'1', CAST(N'2023-12-12' AS Date), N'123', CAST(N'2023-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[User] ([username], [password], [displayName], [email], [dob], [phoneNumber], [registerAt], [lastLogin], [isAdmin]) VALUES (N'user', N'123', N'123', N'1231', CAST(N'2023-12-12' AS Date), N'2023-12-12', CAST(N'2023-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), 0)
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_CarRegistration] SET  READ_WRITE 
GO
