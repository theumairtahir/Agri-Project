/****** Object:  StoredProcedure [dbo].[UpdateUserName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateUserName]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserLocation]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateUserLocation]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserContact]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateUserContact]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserCity]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateUserCity]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAddress]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateUserAddress]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemWeightScale]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateItemWeightScale]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUWeightScale]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateItemUWeightScale]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemUName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateItemUName]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateItemName]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemCategory]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateItemCategory]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCityName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateCityName]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCityGeoLocation]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateCityGeoLocation]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryUName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateCategoryUName]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryName]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[UpdateCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[MakeSeller]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[MakeSeller]
GO
/****** Object:  StoredProcedure [dbo].[MakeBuyer]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[MakeBuyer]
GO
/****** Object:  StoredProcedure [dbo].[GetUsersCity]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetUsersCity]
GO
/****** Object:  StoredProcedure [dbo].[GetUserByContact]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetUserByContact]
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetUser]
GO
/****** Object:  StoredProcedure [dbo].[GetSellers]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetSellers]
GO
/****** Object:  StoredProcedure [dbo].[GetPostedAdvertisments]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetPostedAdvertisments]
GO
/****** Object:  StoredProcedure [dbo].[GetItemsCat]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetItemsCat]
GO
/****** Object:  StoredProcedure [dbo].[GetItemAds]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetItemAds]
GO
/****** Object:  StoredProcedure [dbo].[GetInterestedItems]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetInterestedItems]
GO
/****** Object:  StoredProcedure [dbo].[GetFavBuyers]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetFavBuyers]
GO
/****** Object:  StoredProcedure [dbo].[GetFavAdvertisments]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetFavAdvertisments]
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetCity]
GO
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetCities]
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetCategory]
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetCategories]
GO
/****** Object:  StoredProcedure [dbo].[GetBuyers]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetBuyers]
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItems]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetAgroItems]
GO
/****** Object:  StoredProcedure [dbo].[GetAgroItem]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetAgroItem]
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisements]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetAdvertisements]
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisement]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetAdvertisement]
GO
/****** Object:  StoredProcedure [dbo].[GetAdsCity]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetAdsCity]
GO
/****** Object:  StoredProcedure [dbo].[FavAd]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[FavAd]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAgroItem]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[DeleteAgroItem]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddNewUser]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCity]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddNewCity]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddNewCategory]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAgroItem]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddNewAgroItem]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAdvertisement]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddNewAdvertisement]
GO
/****** Object:  StoredProcedure [dbo].[AddBuyerToInterest]    Script Date: 2/9/2020 7:37:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[AddBuyerToInterest]
GO
