/****** Object:  StoredProcedure [dbo].[AddBuyerToInterest]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddBuyerToInterest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddBuyerToInterest] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddBuyerToInterest]
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
/****** Object:  StoredProcedure [dbo].[AddNewAdvertisement]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewAdvertisement]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewAdvertisement] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddNewAdvertisement] 
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
/****** Object:  StoredProcedure [dbo].[AddNewAgroItem]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewAgroItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewAgroItem] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddNewAgroItem]
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
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewCategory] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddNewCategory]
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
/****** Object:  StoredProcedure [dbo].[AddNewCity]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewCity] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddNewCity]
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
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[AddNewUser]
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
/****** Object:  StoredProcedure [dbo].[DeleteAgroItem]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteAgroItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteAgroItem] AS' 
END
GO
ALTER PROCEDURE [dbo].[DeleteAgroItem]
	@itemId int,
	@name varchar(50)
AS
BEGIN
	DELETE AGRO_ITEMS
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[FavAd]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FavAd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FavAd] AS' 
END
GO
ALTER PROCEDURE [dbo].[FavAd]
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
/****** Object:  StoredProcedure [dbo].[GetAdsCity]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAdsCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAdsCity] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetAdsCity]
	@cityId smallint
AS
BEGIN
	SELECT Id
	FROM ADVERTISEMENTS
	WHERE CityId=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisement]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAdvertisement]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAdvertisement] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetAdvertisement]
		@id bigint
AS
BEGIN
	SELECT *
	FROM ADVERTISEMENTS
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisements]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAdvertisements]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAdvertisements] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetAdvertisements]
		@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM ADVERTISEMENTS
	ORDER BY PostedDateTime DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItem]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAgroItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAgroItem] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetAgroItem]
	@id int
AS
BEGIN
	SELECT *
	FROM AGRO_ITEMS
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItems]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAgroItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAgroItems] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetAgroItems]
	@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM AGRO_ITEMS;
END
GO
/****** Object:  StoredProcedure [dbo].[GetBuyers]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetBuyers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetBuyers] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetBuyers]
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE BuyerFlag=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCategories] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetCategories]
	@max int
AS
BEGIN
	SELECT TOP(@max) Id
	FROM CATEGORIES;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCategory] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetCategory]
	@id smallint
AS
BEGIN
	SELECT *
	FROM CATEGORIES
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCities]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCities] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetCities] 
	@max int
AS
BEGIN
	SELECT TOP(@max)Id
	FROM CITIES;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCity] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetCity] 
	@id smallint
AS
BEGIN
	SELECT * 
	FROM CITIES
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFavAdvertisments]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFavAdvertisments]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetFavAdvertisments] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetFavAdvertisments]
		@buyerId bigint
AS
BEGIN
	SELECT AdId
	FROM BUYER_ADDS_DIFFERENT_ADS_TO_FAV
	WHERE BuyerId=@buyerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFavBuyers]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFavBuyers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetFavBuyers] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetFavBuyers]
	@sellerId bigint
AS
BEGIN
	SELECT BuyerId
	FROM SELLERS_FAVORITES_BUYERS
	WHERE SellerId=@sellerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterestedItems]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetInterestedItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetInterestedItems] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetInterestedItems]
		@buyerId bigint
AS
BEGIN
	SELECT ItemId 
	FROM BUYERS_ADD_AGRO_ITEM_TO_INTEREST
	WHERE BuyerId=@buyerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetItemAds]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetItemAds]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetItemAds] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetItemAds]
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
/****** Object:  StoredProcedure [dbo].[GetItemsCat]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetItemsCat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetItemsCat] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetItemsCat]
	@catId smallint
AS
BEGIN
	SELECT Id
	FROM AGRO_ITEMS
	WHERE CategoryId=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPostedAdvertisments]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPostedAdvertisments]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetPostedAdvertisments] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetPostedAdvertisments]
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
/****** Object:  StoredProcedure [dbo].[GetSellers]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSellers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetSellers] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetSellers]
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE SellerFlag=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetUser]
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
/****** Object:  StoredProcedure [dbo].[GetUserByContact]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserByContact]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUserByContact] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetUserByContact]
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
/****** Object:  StoredProcedure [dbo].[GetUsersCity]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUsersCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUsersCity] AS' 
END
GO
ALTER PROCEDURE [dbo].[GetUsersCity]
	@cityId smallint
AS
BEGIN
	SELECT Id
	FROM USERS
	WHERE CityId=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[MakeBuyer]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MakeBuyer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[MakeBuyer] AS' 
END
GO
ALTER PROCEDURE [dbo].[MakeBuyer]
	@userId bigint
AS
BEGIN
	UPDATE USERS
	SET BuyerFlag=1
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[MakeSeller]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MakeSeller]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[MakeSeller] AS' 
END
GO
ALTER PROCEDURE [dbo].[MakeSeller]
	@userId bigint
AS
BEGIN
	UPDATE USERS
	SET SellerFlag=1
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCategoryName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateCategoryName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateCategoryName]
	@catId smallint,
	@name varchar(MAX)
AS
BEGIN
	UPDATE CATEGORIES
	SET [Name]=@name
	WHERE Id=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryUName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCategoryUName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateCategoryUName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateCategoryUName]
	@catId smallint,
	@uName varchar(MAX)
AS
BEGIN
	UPDATE CATEGORIES
	SET UName=@uName
	WHERE Id=@catId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCityGeoLocation]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCityGeoLocation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateCityGeoLocation] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateCityGeoLocation]
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
/****** Object:  StoredProcedure [dbo].[UpdateCityName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCityName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateCityName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateCityName]
	@cityId smallint,
	@name varchar(50)
AS
BEGIN
	UPDATE CITIES
	SET [Name]=@name
	WHERE Id=@cityId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemCategory]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateItemCategory] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateItemCategory]
	@itemId int,
	@catId smallint
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET CategoryId=@catId
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateItemName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateItemName]
	@itemId int,
	@name varchar(50)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET [Name]=@name
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemUName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateItemUName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateItemUName]
	@itemId int,
	@uName varchar(50)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET Uname=@uName
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUWeightScale]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemUWeightScale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateItemUWeightScale] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateItemUWeightScale]
	@itemId int,
	@uScale nchar(10)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET UWeightScale=@uScale
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemWeightScale]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemWeightScale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateItemWeightScale] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateItemWeightScale]
	@itemId int,
	@scale nchar(10)
AS
BEGIN
	UPDATE AGRO_ITEMS
	SET WeightScale=@scale
	WHERE Id=@itemId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAddress]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserAddress] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserAddress]
	@userId bigint,
	@address varchar(MAX)
AS
BEGIN
	UPDATE USERS
	SET [Address]=@address
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserCity]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserCity] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserCity] 
	@userId bigint,
	@cityId smallint
AS
BEGIN
	UPDATE USERS
	SET CityId=@cityId
	WHERE Id=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserContact]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserContact]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserContact] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserContact]
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
/****** Object:  StoredProcedure [dbo].[UpdateUserLocation]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserLocation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserLocation] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserLocation]
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
/****** Object:  StoredProcedure [dbo].[UpdateUserName]    Script Date: 2/9/2020 7:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserName] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserName]
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
