/****** Object:  Table [dbo].[ADVERTISEMENTS]    Script Date: 2/21/2020 7:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADVERTISEMENTS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[PostedDateTime] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[Picture] [varchar](max) NOT NULL,
	[SellerId] [bigint] NOT NULL,
	[ItemId] [int] NOT NULL,
	[CityId] [smallint] NOT NULL,
 CONSTRAINT [PK_ADVERTISEMENTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AGRO_ITEMS]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGRO_ITEMS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Uname] [varchar](50) NULL,
	[WeightScale] [nchar](10) NOT NULL,
	[UWeightScale] [nchar](10) NULL,
	[CategoryId] [smallint] NOT NULL,
 CONSTRAINT [PK_AGRO_ITEMS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV](
	[BuyerId] [bigint] NOT NULL,
	[AdId] [bigint] NOT NULL,
 CONSTRAINT [PK_BUYER_ADDS_DIFFERENT_ADS_TO_FAV] PRIMARY KEY CLUSTERED 
(
	[BuyerId] ASC,
	[AdId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST](
	[BuyerId] [bigint] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_BUYERS_ADD_AGRO_ITEM_TO_INTEREST] PRIMARY KEY CLUSTERED 
(
	[BuyerId] ASC,
	[ItemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UName] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CITIES]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITIES](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[GLat] [decimal](10, 8) NOT NULL,
	[GLng] [decimal](11, 8) NOT NULL,
 CONSTRAINT [PK_CITIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_LOCATION] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SELLERS_FAVORITES_BUYERS]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SELLERS_FAVORITES_BUYERS](
	[SellerId] [bigint] NOT NULL,
	[BuyerId] [bigint] NOT NULL,
 CONSTRAINT [PK_SELLERS_FAVORITES_BUYERS] PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC,
	[BuyerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](max) NOT NULL,
	[LName] [varchar](max) NOT NULL,
	[CCompanyCode] [nchar](3) NOT NULL,
	[CCountryCode] [nchar](3) NOT NULL,
	[CPhone] [nchar](7) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[GLat] [decimal](10, 8) NULL,
	[GLng] [decimal](11, 8) NULL,
	[BuyerFlag] [bit] NOT NULL,
	[SellerFlag] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_CONTACT] UNIQUE NONCLUSTERED 
(
	[CCompanyCode] ASC,
	[CCountryCode] ASC,
	[CPhone] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_BuyerFlag]  DEFAULT ((0)) FOR [BuyerFlag]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_SellerFlag]  DEFAULT ((0)) FOR [SellerFlag]
GO
ALTER TABLE [dbo].[ADVERTISEMENTS]  WITH CHECK ADD  CONSTRAINT [ADVERTISEMENTS_INCLUDE_A_CITY] FOREIGN KEY([CityId])
REFERENCES [dbo].[CITIES] ([Id])
GO
ALTER TABLE [dbo].[ADVERTISEMENTS] CHECK CONSTRAINT [ADVERTISEMENTS_INCLUDE_A_CITY]
GO
ALTER TABLE [dbo].[ADVERTISEMENTS]  WITH CHECK ADD  CONSTRAINT [AN_ADVERTISEMENT_IS_RELATED_TO_AN_ITEM] FOREIGN KEY([ItemId])
REFERENCES [dbo].[AGRO_ITEMS] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ADVERTISEMENTS] CHECK CONSTRAINT [AN_ADVERTISEMENT_IS_RELATED_TO_AN_ITEM]
GO
ALTER TABLE [dbo].[ADVERTISEMENTS]  WITH CHECK ADD  CONSTRAINT [USERS_POST_ADVERTISEMENTS] FOREIGN KEY([SellerId])
REFERENCES [dbo].[USERS] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ADVERTISEMENTS] CHECK CONSTRAINT [USERS_POST_ADVERTISEMENTS]
GO
ALTER TABLE [dbo].[AGRO_ITEMS]  WITH CHECK ADD  CONSTRAINT [AGRO_ITEMS_BELONG_TO_A_CATEGORY] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CATEGORIES] ([Id])
GO
ALTER TABLE [dbo].[AGRO_ITEMS] CHECK CONSTRAINT [AGRO_ITEMS_BELONG_TO_A_CATEGORY]
GO
ALTER TABLE [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV]  WITH NOCHECK ADD  CONSTRAINT [FK_BUYER_ADDS_DIFFERENT_ADS_TO_FAV_ADVERTISEMENTS] FOREIGN KEY([AdId])
REFERENCES [dbo].[ADVERTISEMENTS] ([Id])
GO
ALTER TABLE [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV] NOCHECK CONSTRAINT [FK_BUYER_ADDS_DIFFERENT_ADS_TO_FAV_ADVERTISEMENTS]
GO
ALTER TABLE [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV]  WITH NOCHECK ADD  CONSTRAINT [FK_BUYER_ADDS_DIFFERENT_ADS_TO_FAV_USERS] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[USERS] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV] NOCHECK CONSTRAINT [FK_BUYER_ADDS_DIFFERENT_ADS_TO_FAV_USERS]
GO
ALTER TABLE [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST]  WITH CHECK ADD  CONSTRAINT [FK_BUYERS_ADD_AGRO_ITEM_TO_INTEREST_AGRO_ITEMS] FOREIGN KEY([ItemId])
REFERENCES [dbo].[AGRO_ITEMS] ([Id])
GO
ALTER TABLE [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST] CHECK CONSTRAINT [FK_BUYERS_ADD_AGRO_ITEM_TO_INTEREST_AGRO_ITEMS]
GO
ALTER TABLE [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST]  WITH CHECK ADD  CONSTRAINT [FK_BUYERS_ADD_AGRO_ITEM_TO_INTEREST_USERS] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[BUYERS_ADD_AGRO_ITEM_TO_INTEREST] CHECK CONSTRAINT [FK_BUYERS_ADD_AGRO_ITEM_TO_INTEREST_USERS]
GO
ALTER TABLE [dbo].[SELLERS_FAVORITES_BUYERS]  WITH CHECK ADD  CONSTRAINT [FK_SELLERS_FAVORITES_BUYERS_USERS] FOREIGN KEY([SellerId])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[SELLERS_FAVORITES_BUYERS] CHECK CONSTRAINT [FK_SELLERS_FAVORITES_BUYERS_USERS]
GO
ALTER TABLE [dbo].[SELLERS_FAVORITES_BUYERS]  WITH CHECK ADD  CONSTRAINT [FK_SELLERS_FAVORITES_BUYERS_USERS1] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[USERS] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SELLERS_FAVORITES_BUYERS] CHECK CONSTRAINT [FK_SELLERS_FAVORITES_BUYERS_USERS1]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_CITIES] FOREIGN KEY([CityId])
REFERENCES [dbo].[CITIES] ([Id])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_CITIES]
GO
/****** Object:  StoredProcedure [dbo].[AddBuyerToInterest]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBuyerToInterest]
	@sellerId bigint,
	@buyerId bigint
AS
BEGIN
	INSERT INTO [dbo].[SELLERS_FAVORITES_BUYERS]
           ([SellerId]
           ,[BuyerId])
     VALUES
           (@sellerId
           ,@buyerId);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewAdvertisement]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewAdvertisement] 
	@quality smallint, 
	@quantity smallint,
	@dateTime datetime,
	@price money,
	@picture varchar(MAX),
	@sellerId bigint,
	@itemId int,
	@cityId smallint
AS
BEGIN
	INSERT INTO [dbo].[ADVERTISEMENTS]
           ([Quality]
           ,[Quantity]
           ,[PostedDateTime]
           ,[Price]
           ,[Picture]
           ,[SellerId]
           ,[ItemId]
           ,[CityId])
     VALUES
           (@quality
           ,@quantity
           ,@dateTime
           ,@price
           ,@picture
           ,@sellerId
           ,@itemId
           ,@cityId);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewAgroItem]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewAgroItem]
	@name varchar(50),
	@uName varchar(50),
	@scale nchar(10),
	@uScale nchar(10),
	@catId smallint
AS
BEGIN
	INSERT INTO [dbo].[AGRO_ITEMS]
           ([Name]
           ,[Uname]
           ,[WeightScale]
           ,[UWeightScale]
           ,[CategoryId])
     VALUES
           (@name
           ,@uName
           ,@scale
           ,@uScale
           ,@catId);
		   SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewCategory]
	@name varchar(50),
	@uName varchar(50)
AS
BEGIN
	INSERT INTO [dbo].[CATEGORIES]
           ([Name]
           ,[UName])
     VALUES
           (@name
           ,@uName);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewCity]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewCity]
	@name varchar(50),
	@lat decimal(10,8),
	@lng decimal(11,8)
AS
BEGIN
	INSERT INTO [dbo].[CITIES]
           ([Name]
           ,[GLat]
           ,[GLng])
     VALUES
           (@name
           ,@lat
           ,@lng);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser]
	@fName varchar(MAX),
	@lName varchar(MAX),
	@countryCode nchar(3),
	@companyCode nchar(3),
	@phone nchar(7),
	@address varchar(MAX),
	@cityId smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[USERS]
           ([FName]
           ,[LName]
           ,[CCompanyCode]
           ,[CCountryCode]
           ,[CPhone]
           ,[Address]
           ,[CityId])
     VALUES
           (@fName
           ,@lName
           ,@companyCode
           ,@countryCode
           ,@phone
           ,@address
           ,@cityId);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAgroItem]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAgroItem]
	@itemId int,
	@name varchar(50)
AS
BEGIN
	DELETE AGRO_ITEMS
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[FavAd]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FavAd]
		@buyerId bigint,
		@adId bigint
AS
BEGIN
	INSERT INTO [dbo].[BUYER_ADDS_DIFFERENT_ADS_TO_FAV]
           ([BuyerId]
           ,[AdId])
     VALUES
           (@buyerId
           ,@adId);
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdsCity]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdsCity]
	@cityId smallint
AS
BEGIN
	SELECT Id
	FROM ADVERTISEMENTS
	WHERE CityId=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisement]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdvertisement]
		@id bigint
AS
BEGIN
	SELECT *
	FROM ADVERTISEMENTS
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisements]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdvertisements]
		@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM ADVERTISEMENTS
	ORDER BY PostedDateTime DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItem]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAgroItem]
	@id int
AS
BEGIN
	SELECT *
	FROM AGRO_ITEMS
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItems]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAgroItems]
	@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM AGRO_ITEMS;
END
GO
/****** Object:  StoredProcedure [dbo].[GetBuyers]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBuyers]
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE BuyerFlag=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategories]
	@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM CATEGORIES;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategory]
	@id smallint
AS
BEGIN
	SELECT *
	FROM CATEGORIES
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCities] 
	@max int
AS
BEGIN
	SELECT TOP(@max)Id
	FROM CITIES;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCity] 
	@id smallint
AS
BEGIN
	SELECT * 
	FROM CITIES
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFavAdvertisments]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFavAdvertisments]
		@buyerId bigint
AS
BEGIN
	SELECT AdId
	FROM BUYER_ADDS_DIFFERENT_ADS_TO_FAV
	WHERE BuyerId=@buyerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFavBuyers]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFavBuyers]
	@sellerId bigint
AS
BEGIN
	SELECT BuyerId
	FROM SELLERS_FAVORITES_BUYERS
	WHERE SellerId=@sellerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterestedItems]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterestedItems]
		@buyerId bigint
AS
BEGIN
	SELECT ItemId 
	FROM BUYERS_ADD_AGRO_ITEM_TO_INTEREST
	WHERE BuyerId=@buyerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetItemAds]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemAds]
	@itemId int,
	@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM ADVERTISEMENTS
	WHERE ItemId=@itemId
	ORDER BY [PostedDateTime] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetItemsCat]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemsCat]
	@catId smallint
AS
BEGIN
	SELECT Id
	FROM AGRO_ITEMS
	WHERE CategoryId=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPostedAdvertisments]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPostedAdvertisments]
	@sellerId bigint,
	@startDate datetime,
	@endDate datetime
AS
BEGIN
	SELECT Id
	FROM ADVERTISEMENTS
	WHERE SellerId=@sellerId AND (PostedDateTime BETWEEN @startDate AND @endDate);
END
GO
/****** Object:  StoredProcedure [dbo].[GetSellers]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSellers]
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE SellerFlag=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser]
	@id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM USERS
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByContact]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByContact]
	@countryCode nchar(3),
	@companyCode nchar(3),
	@phone nchar(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id
	FROM USERS
	WHERE CCountryCode=@countryCode AND CCompanyCode=@companyCode AND CPhone=@phone;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersCity]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersCity]
	@cityId smallint
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE CityId=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[MakeBuyer]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeBuyer]
	@userId bigint
AS
BEGIN
	UPDATE USERS
	SET BuyerFlag=1
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[MakeSeller]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeSeller]
	@userId bigint
AS
BEGIN
	UPDATE USERS
	SET SellerFlag=1
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategoryName]
	@catId smallint,
	@name varchar(MAX)
AS
BEGIN
	UPDATE CATEGORIES
	SET [Name]=@name
	WHERE Id=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryUName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategoryUName]
	@catId smallint,
	@uName varchar(MAX)
AS
BEGIN
	UPDATE CATEGORIES
	SET UName=@uName
	WHERE Id=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCityGeoLocation]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCityGeoLocation]
	@cityId smallint,
	@lat decimal(10,8),
	@lng decimal(11,8)
AS
BEGIN
	UPDATE CITIES
	SET GLat=@lat, GLng=@lng
	WHERE Id=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCityName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCityName]
	@cityId smallint,
	@name varchar(50)
AS
BEGIN
	UPDATE CITIES
	SET [Name]=@name
	WHERE Id=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemCategory]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemCategory]
	@itemId int,
	@catId smallint
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET CategoryId=@catId
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemName]
	@itemId int,
	@name varchar(50)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET [Name]=@name
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemUName]
	@itemId int,
	@uName varchar(50)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET Uname=@uName
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUWeightScale]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemUWeightScale]
	@itemId int,
	@uScale nchar(10)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET UWeightScale=@uScale
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemWeightScale]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemWeightScale]
	@itemId int,
	@scale nchar(10)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET WeightScale=@scale
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAddress]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserAddress]
	@userId bigint,
	@address varchar(MAX)
AS
BEGIN
	UPDATE USERS
	SET [Address]=@address
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserCity]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserCity] 
	@userId bigint,
	@cityId smallint
AS
BEGIN
	UPDATE USERS
	SET CityId=@cityId
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserContact]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserContact]
	@userId bigint,
	@countryCode nchar(3),
	@comapnyCode nchar(3),
	@phone nchar(7)
AS
BEGIN
	UPDATE USERS
	SET CCountryCode=@countryCode, CCompanyCode=@comapnyCode,CPhone=@phone
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserLocation]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserLocation]
	@userId bigint,
	@lat decimal(10,8),
	@lng decimal(11,8)
AS
BEGIN
	UPDATE USERS
	SET GLat=@lat, GLng=@lng
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserName]    Script Date: 2/21/2020 7:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserName]
	@userId bigint,
	@fName varchar(max),
	@lName varchar(max)
AS
BEGIN
	UPDATE USERS
	SET FName=@fName, LName=@lName
	WHERE Id=@userId;
END
GO
ALTER DATABASE [EFarmerDb] SET  READ_WRITE 
GO
