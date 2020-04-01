CREATE DATABASE [ShoppingCartDB]
GO
USE [ShoppingCartDB]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20/04/2018 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](max) NULL,
	[ItemId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Carts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](160) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ItemPictureUrl] [nvarchar](1024) NULL,
	[InternalImage] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/04/2018 13:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](160) NOT NULL,
	[LastName] [nvarchar](160) NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[City] [nvarchar](40) NOT NULL,
	[State] [nvarchar](40) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Experation] [datetime] NOT NULL,
	[SaveInfo] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (2, N'cdf5aec7-3e35-4cd0-91aa-f25399998790', 2, 1, CAST(N'2018-04-19T13:08:32.197' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (3, N'28267aa3-7ce8-4d51-9106-14d8ff65498b', 1, 1, CAST(N'2018-04-19T15:14:54.497' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (4, N'2ef0a8b6-59f0-4576-a827-1ddaf6a0ab8c', 1, 1, CAST(N'2018-04-19T16:08:48.273' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (5, N'c8c8e94c-9d54-4386-97f0-7dc766fa56d5', 1, 2, CAST(N'2018-04-19T16:09:43.743' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (6, N'4a6cee5d-6319-4611-988d-d879511cf0ec', 1, 2, CAST(N'2018-04-19T16:22:47.820' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (7, N'dcb22424-ed74-4410-8e03-5d737636d840', 1, 1, CAST(N'2018-04-19T16:24:47.300' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (8, N'0ace13e9-7b01-4143-9f0c-7a3ac0fbc208', 1, 1, CAST(N'2018-04-19T16:34:40.757' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (9, N'c3cec18f-ba36-44eb-82a4-10ebcb8444af', 1, 1, CAST(N'2018-04-19T16:42:14.703' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (10, N'c3cec18f-ba36-44eb-82a4-10ebcb8444af', 2, 1, CAST(N'2018-04-19T16:42:19.317' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (11, N'9782f65c-4061-4769-9eba-a45411771033', 1, 1, CAST(N'2018-04-19T16:43:36.813' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (12, N'9782f65c-4061-4769-9eba-a45411771033', 2, 1, CAST(N'2018-04-19T16:43:44.323' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (13, N'875b3d73-e4c7-4417-be5a-0c399d5cf636', 1, 2, CAST(N'2018-04-19T16:44:40.520' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (14, N'875b3d73-e4c7-4417-be5a-0c399d5cf636', 2, 1, CAST(N'2018-04-19T16:44:44.180' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (15, N'8158d780-c42f-4ce0-9fce-8300b33ac7af', 1, 1, CAST(N'2018-04-19T16:49:58.713' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (16, N'8158d780-c42f-4ce0-9fce-8300b33ac7af', 2, 2, CAST(N'2018-04-19T16:50:02.963' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (17, N'fd13c954-56fb-4e12-b6c7-3463f0fb2841', 1, 2, CAST(N'2018-04-20T08:14:01.833' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (18, N'fd13c954-56fb-4e12-b6c7-3463f0fb2841', 2, 1, CAST(N'2018-04-20T08:14:06.783' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (19, N'2b2f5997-9eb9-4a24-a5f3-e9f0e6cdcd16', 1, 3, CAST(N'2018-04-20T08:16:51.557' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (20, N'2b2f5997-9eb9-4a24-a5f3-e9f0e6cdcd16', 2, 2, CAST(N'2018-04-20T08:16:53.230' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (21, N'1852a46a-3e69-4e82-8564-4102593ac7e7', 1, 1, CAST(N'2018-04-20T08:18:09.897' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (22, N'4dcd4693-4d93-4007-a77f-e23619ed6003', 1, 1, CAST(N'2018-04-20T08:22:22.320' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (23, N'aef63746-58f4-4d64-bb85-8b9bc3e0ebd0', 1, 3, CAST(N'2018-04-20T08:23:34.133' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (24, N'aef63746-58f4-4d64-bb85-8b9bc3e0ebd0', 2, 1, CAST(N'2018-04-20T08:23:39.613' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (25, N'35916804-3b69-4e92-a8ba-7ed3e144a293', 1, 1, CAST(N'2018-04-20T08:25:26.877' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (26, N'7d66e304-cbaa-4322-b57b-cdbebf1d90a5', 1, 1, CAST(N'2018-04-20T08:26:21.067' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (27, N'7d66e304-cbaa-4322-b57b-cdbebf1d90a5', 2, 1, CAST(N'2018-04-20T08:26:24.527' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (28, N'cda0668b-133e-42b0-a15e-7494ce8eb3b8', 1, 2, CAST(N'2018-04-20T08:33:11.527' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (29, N'cda0668b-133e-42b0-a15e-7494ce8eb3b8', 2, 2, CAST(N'2018-04-20T08:33:17.483' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (30, N'fceb715b-aa21-4d29-89cd-77f37c73186d', 1, 1, CAST(N'2018-04-20T09:08:05.650' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (31, N'fceb715b-aa21-4d29-89cd-77f37c73186d', 2, 1, CAST(N'2018-04-20T09:08:08.997' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (32, N'8598e912-4f4e-4666-8c89-fb40d592d7f7', 1, 2, CAST(N'2018-04-20T09:12:11.170' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (33, N'4d58d59b-6eea-4d32-aa30-8a7e2887e05c', 1, 1, CAST(N'2018-04-20T09:16:01.450' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (34, N'72a629ac-aae4-4803-8949-e7ab21dd224c', 1, 2, CAST(N'2018-04-20T09:21:41.583' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (35, N'72a629ac-aae4-4803-8949-e7ab21dd224c', 2, 3, CAST(N'2018-04-20T09:21:57.620' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (36, N'd00ec6e8-214a-4283-a65d-e2081c2c0416', 1, 1, CAST(N'2018-04-20T09:30:44.407' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (37, N'8f9b922f-46d6-484b-8ec9-42d6e726de5d', 1, 1, CAST(N'2018-04-20T09:32:55.773' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (38, N'8f9b922f-46d6-484b-8ec9-42d6e726de5d', 2, 1, CAST(N'2018-04-20T09:33:13.457' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (39, N'a0662fbf-cf0b-43c0-b9c4-aca8c4a16d5a', 1, 1, CAST(N'2018-04-20T09:35:00.650' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (40, N'8c0fe8ba-c30f-426c-b22b-dd570b0b0ecb', 1, 1, CAST(N'2018-04-20T09:37:09.787' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (41, N'8ff30935-0d46-49b4-a226-c41d6f5282b4', 1, 1, CAST(N'2018-04-20T09:39:05.023' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (42, N'4caecbe8-8e70-4c27-9b1c-a23728417e86', 1, 1, CAST(N'2018-04-20T09:39:49.597' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (43, N'51a2ca3c-2fab-4657-8334-256dfeceec93', 1, 1, CAST(N'2018-04-20T09:41:10.440' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (44, N'ff7a8bbc-7231-4c26-817d-254991a5bfd9', 1, 1, CAST(N'2018-04-20T09:42:53.600' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (45, N'b9757c0a-a46f-4f7c-8925-1836b44ab372', 1, 1, CAST(N'2018-04-20T09:45:57.640' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (46, N'9ec55a69-d105-4c3f-8fbc-4e54ac2922f0', 1, 1, CAST(N'2018-04-20T09:48:15.497' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (47, N'387c474c-83c7-4a63-8067-2f00c4c6cb81', 1, 2, CAST(N'2018-04-20T09:51:34.503' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (48, N'83ae0db7-3259-4dee-a896-0fab3e7ebafb', 1, 1, CAST(N'2018-04-20T09:56:52.813' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (49, N'f21939f4-aac3-4827-8737-c25d189fbf28', 1, 1, CAST(N'2018-04-20T09:58:11.807' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (50, N'5961eaca-4fa2-4719-9b94-432273a7c689', 1, 1, CAST(N'2018-04-20T09:59:25.293' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (51, N'c111b065-a0a9-4f28-9a77-5efe29c58059', 1, 1, CAST(N'2018-04-20T10:03:27.800' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (52, N'c111b065-a0a9-4f28-9a77-5efe29c58059', 2, 1, CAST(N'2018-04-20T10:03:41.313' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (53, N'd113fd35-7749-44dd-9e92-d050079d48f9', 1, 1, CAST(N'2018-04-20T10:04:28.847' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (54, N'94d7612b-5852-4e5d-a5dd-b3805ca4ff64', 1, 1, CAST(N'2018-04-20T10:05:08.867' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (55, N'454552a7-b410-4f02-a5d1-769c122cc5a7', 1, 1, CAST(N'2018-04-20T10:11:59.380' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (56, N'053d7ccf-abd9-426d-b188-e5b44ca0bf16', 1, 1, CAST(N'2018-04-20T10:13:15.090' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (57, N'a6a869c1-5ada-41ed-99ed-cbb4dddfa1a6', 1, 1, CAST(N'2018-04-20T10:14:58.663' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (58, N'95d0d0b2-ef1d-4814-9483-6df24a90e309', 1, 1, CAST(N'2018-04-20T10:15:59.543' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (59, N'a82192bc-0e93-4f3a-8890-6046ffbffcf7', 1, 1, CAST(N'2018-04-20T10:16:46.700' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (60, N'a82192bc-0e93-4f3a-8890-6046ffbffcf7', 2, 1, CAST(N'2018-04-20T10:17:17.350' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (61, N'ea5cd0d7-8d5a-423e-a583-6816525eeb93', 1, 1, CAST(N'2018-04-20T10:18:03.587' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (62, N'ca598d6f-3b1f-4e03-b70c-093d567d198f', 1, 1, CAST(N'2018-04-20T10:19:09.713' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (63, N'd2652a0d-7e1f-4cf8-a65e-629c4b1d8480', 1, 1, CAST(N'2018-04-20T10:20:15.447' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (64, N'0640cc77-f233-4c70-87af-1f449ccf0166', 1, 1, CAST(N'2018-04-20T10:21:57.360' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (65, N'eada38a7-cd28-4d75-be61-c2bb0aa6846b', 1, 1, CAST(N'2018-04-20T10:23:55.273' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (66, N'7d8697d6-2e48-44f3-b94d-51862da331c0', 1, 1, CAST(N'2018-04-20T10:24:55.367' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (67, N'b7d0f9b7-cf74-4a47-9b5e-83aa5f771651', 1, 1, CAST(N'2018-04-20T10:26:11.017' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (68, N'368e1da3-90a6-486d-ad51-23e9b4c949d6', 1, 1, CAST(N'2018-04-20T10:33:05.623' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (69, N'bb8980ac-88fc-4ffa-8185-18afe76ec5d4', 1, 1, CAST(N'2018-04-20T10:36:26.470' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (70, N'47ccc174-259d-4033-a0d5-0154676ebacc', 1, 1, CAST(N'2018-04-20T10:37:23.710' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (71, N'54151e85-033d-4149-bc19-962c2138f36c', 1, 1, CAST(N'2018-04-20T10:38:19.600' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (72, N'01d02e87-8966-4be3-ba19-6724d5559fc0', 2, 1, CAST(N'2018-04-20T10:41:28.227' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (73, N'fe566d8b-f276-4d64-9d3a-4e9a81ac6533', 1, 1, CAST(N'2018-04-20T10:43:14.837' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (74, N'ba020761-fed9-47be-8a1b-2debe5427046', 1, 1, CAST(N'2018-04-20T10:44:40.567' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (75, N'81f9bf55-28ef-45d1-b8b6-ae90b681f418', 1, 1, CAST(N'2018-04-20T10:45:15.633' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (83, N'7a9612ec-0ad1-47e0-947b-3b6e5a870d11', 1, 3, CAST(N'2018-04-20T11:13:29.547' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (84, N'cbe1170f-8bc6-45ec-a66d-8e595983d5b8', 1, 1, CAST(N'2018-04-20T11:14:57.843' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (86, N'0f5b4266-5aab-4127-b1ce-f28c8c0f3c95', 1, 1, CAST(N'2018-04-20T11:17:30.040' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (87, N'0f5b4266-5aab-4127-b1ce-f28c8c0f3c95', 2, 2, CAST(N'2018-04-20T11:18:18.347' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (88, N'b6845efe-267b-402a-bc24-d78d9839b23f', 1, 1, CAST(N'2018-04-20T11:23:14.387' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (89, N'91a49867-4d7a-41a6-92c3-7ac5904315ec', 1, 1, CAST(N'2018-04-20T11:24:21.290' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (90, N'498e4955-644a-49ba-9b42-9b1f540a65ac', 1, 1, CAST(N'2018-04-20T11:27:18.540' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (94, N'7e682533-49e5-401a-a990-ff9fed8392c4', 2, 1, CAST(N'2018-04-20T11:32:00.563' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (100, N'b708823e-c79c-458f-925b-52feff94ead5', 1, 3, CAST(N'2018-04-20T11:56:39.143' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (101, N'b708823e-c79c-458f-925b-52feff94ead5', 2, 1, CAST(N'2018-04-20T11:56:54.353' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (102, N'3b30cb0b-0ffd-48a2-8395-4cd0f3a87313', 1, 4, CAST(N'2018-04-20T11:59:19.010' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (103, N'551314d3-ea16-46ce-af04-3b9bd81f3c1b', 1, 1, CAST(N'2018-04-20T12:00:46.857' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (108, N'91968b56-9378-41ed-9f97-ead2e5aff986', 1, 2, CAST(N'2018-04-20T13:26:22.740' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (109, N'91968b56-9378-41ed-9f97-ead2e5aff986', 2, 1, CAST(N'2018-04-20T13:26:41.617' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (110, N'1799b00e-0a22-4f43-9677-82a77badcfae', 1, 1, CAST(N'2018-04-20T13:28:00.167' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (117, N'8f790f95-546e-4484-b481-a1e9c75a176b', 1, 1, CAST(N'2018-04-20T13:32:59.073' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (119, N'f3379a89-77a5-4d51-aac5-67b3c20c374c', 2, 1, CAST(N'2018-04-20T13:34:12.287' AS DateTime))
GO
INSERT [dbo].[Carts] ([ID], [CartId], [ItemId], [Count], [DateCreated]) VALUES (120, N'f3379a89-77a5-4d51-aac5-67b3c20c374c', 1, 1, CAST(N'2018-04-20T13:34:14.800' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Test')
GO
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Test2')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([ID], [CategoryId], [Name], [Price], [ItemPictureUrl], [InternalImage]) VALUES (1, 1, N'Sausage', CAST(15.00 AS Decimal(18, 2)), N'https://www.kingsford.com/wp-content/uploads/2016/02/KFD_Header_SAUSAGES_CINEMAGRAPH-0106.jpg', NULL)
GO
INSERT [dbo].[Items] ([ID], [CategoryId], [Name], [Price], [ItemPictureUrl], [InternalImage]) VALUES (2, 1, N'Chiken', CAST(10.00 AS Decimal(18, 2)), N'https://media1.s-nbcnews.com/i/newscms/2017_20/1215661/baked-chicken-today-170519-tease_15b214baba5431d761c7a46cf08e062c.jpg', NULL)
GO
INSERT [dbo].[Items] ([ID], [CategoryId], [Name], [Price], [ItemPictureUrl], [InternalImage]) VALUES (6, 1, N'Pizza', CAST(12.00 AS Decimal(18, 2)), N'http://www.pizzaduroy.fr/assets/images/slider/5.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [Experation]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [SaveInfo]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Carts_dbo.Items_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_dbo.Carts_dbo.Items_ItemId]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Items_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_dbo.Items_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Items_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Items_ItemId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
