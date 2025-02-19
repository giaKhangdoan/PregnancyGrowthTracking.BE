USE [PregnancyGrowthTrackingDB]
GO
/****** Object:  Table [dbo].[AC_Alerts]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AC_Alerts](
	[AC_Alerts_Id] [int] IDENTITY(1,1) NOT NULL,
	[GrowthStandardId] [int] NULL,
	[Notification] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AC_Alerts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[MediaId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EFW_Alerts]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EFW_Alerts](
	[EFW_Alerts_Id] [int] IDENTITY(1,1) NOT NULL,
	[GrowthStandardId] [int] NULL,
	[Notification] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EFW_Alerts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FL_Alerts]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FL_Alerts](
	[FL_Alerts_Id] [int] IDENTITY(1,1) NOT NULL,
	[GrowthStandardId] [int] NULL,
	[Notification] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FL_Alerts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foetus]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foetus](
	[FoetusId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoetusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumTag]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumTag](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrowthData]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrowthData](
	[GrowthDataId] [int] IDENTITY(1,1) NOT NULL,
	[FoetusId] [int] NULL,
	[Date] [date] NULL,
	[GrowthStandardId] [int] NULL,
	[Age] [int] NULL,
	[HC] [float] NULL,
	[AC] [float] NULL,
	[FL] [float] NULL,
	[EFW] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrowthDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrowthStandard]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrowthStandard](
	[GrowthStandardId] [int] IDENTITY(1,1) NOT NULL,
	[GestationalAge] [int] NULL,
	[HC_Median] [float] NULL,
	[AC_Median] [float] NULL,
	[FL_Median] [float] NULL,
	[EFW_Median] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrowthStandardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HC_Alerts]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HC_Alerts](
	[HC_Alerts_Id] [int] IDENTITY(1,1) NOT NULL,
	[GrowthStandardId] [int] NULL,
	[Notification] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[HC_Alerts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membership]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership](
	[MembershipId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[MembershipId] [int] NULL,
	[Date] [date] NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Phone] [nvarchar](15) NULL,
	[Available] [bit] NULL,
	[RoleId] [int] NULL,
	[ProfileImageUrl] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserComment]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserComment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BlogId] [int] NULL,
	[Detail] [nvarchar](255) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserForum]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserForum](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Detail] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[TagId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNote]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNote](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Date] [date] NULL,
	[Detail] [nvarchar](255) NULL,
	[UserNotePhoto] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReminders]    Script Date: 12/02/2025 10:42:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReminders](
	[RemindId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Date] [date] NULL,
	[Notification] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RemindId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AC_Alerts]  WITH CHECK ADD FOREIGN KEY([GrowthStandardId])
REFERENCES [dbo].[GrowthStandard] ([GrowthStandardId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[EFW_Alerts]  WITH CHECK ADD FOREIGN KEY([GrowthStandardId])
REFERENCES [dbo].[GrowthStandard] ([GrowthStandardId])
GO
ALTER TABLE [dbo].[FL_Alerts]  WITH CHECK ADD FOREIGN KEY([GrowthStandardId])
REFERENCES [dbo].[GrowthStandard] ([GrowthStandardId])
GO
ALTER TABLE [dbo].[Foetus]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[GrowthData]  WITH CHECK ADD FOREIGN KEY([FoetusId])
REFERENCES [dbo].[Foetus] ([FoetusId])
GO
ALTER TABLE [dbo].[GrowthData]  WITH CHECK ADD  CONSTRAINT [FK_GrowthData_GrowthStandard] FOREIGN KEY([GrowthStandardId])
REFERENCES [dbo].[GrowthStandard] ([GrowthStandardId])
GO
ALTER TABLE [dbo].[GrowthData] CHECK CONSTRAINT [FK_GrowthData_GrowthStandard]
GO
ALTER TABLE [dbo].[HC_Alerts]  WITH CHECK ADD FOREIGN KEY([GrowthStandardId])
REFERENCES [dbo].[GrowthStandard] ([GrowthStandardId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([MembershipId])
REFERENCES [dbo].[Membership] ([MembershipId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserComment]  WITH CHECK ADD FOREIGN KEY([BlogId])
REFERENCES [dbo].[UserForum] ([BlogId])
GO
ALTER TABLE [dbo].[UserComment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserForum]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserForum]  WITH CHECK ADD  CONSTRAINT [FK_UserForum_ForumTag] FOREIGN KEY([TagId])
REFERENCES [dbo].[ForumTag] ([TagId])
GO
ALTER TABLE [dbo].[UserForum] CHECK CONSTRAINT [FK_UserForum_ForumTag]
GO
ALTER TABLE [dbo].[UserNote]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserReminders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
