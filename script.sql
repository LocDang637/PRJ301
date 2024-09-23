USE [ShoesShop]
GO
/****** Object:  Table [dbo].[tbl_Cart]    Script Date: 2/23/2024 10:58:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](20) NULL,
	[shoesId] [varchar](10) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Shoes]    Script Date: 2/23/2024 10:58:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Shoes](
	[shoesId] [varchar](10) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[shoesName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[shoesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 2/23/2024 10:58:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Cart] ON 

INSERT [dbo].[tbl_Cart] ([cartId], [userId], [shoesId], [quantity]) VALUES (3, N'khoa@gmail.com', N'ferfe', 33)
SET IDENTITY_INSERT [dbo].[tbl_Cart] OFF
GO
INSERT [dbo].[tbl_Shoes] ([shoesId], [description], [price], [shoesName], [yearOfProduction], [quantity], [notSale], [image]) VALUES (N'#5353', N'Very Luxury', 94949, N'Givenchy', 2023, 9, 0, N'images.jpg')
INSERT [dbo].[tbl_Shoes] ([shoesId], [description], [price], [shoesName], [yearOfProduction], [quantity], [notSale], [image]) VALUES (N'43', N'hehee', 99999, N'33', 33, 11, 0, N'apple-iphone-14-pro-max-1.jpg')
INSERT [dbo].[tbl_Shoes] ([shoesId], [description], [price], [shoesName], [yearOfProduction], [quantity], [notSale], [image]) VALUES (N'ferfe', N'343', 34234, N'dfas', 2342, 9, 0, N'loginshoes.jpg.jpg')
INSERT [dbo].[tbl_Shoes] ([shoesId], [description], [price], [shoesName], [yearOfProduction], [quantity], [notSale], [image]) VALUES (N'wewe', N'22', 322, N's234', 222, 22, 0, N'con bo cuoi.jpg')
GO
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'hoang@gmail.com', 123, N'HoangHoang', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'huy', 111, N'huy', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'huy@gmail.com', 123, N'CongHuy', 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'khoa@gmail.com', 123, N'DangKhoa', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'manager_Jenifer', 123, N'Jenifer', 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'staff_Chau', 123, N'Chau', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'user_Tony', 123, N'Tony', 2)
GO