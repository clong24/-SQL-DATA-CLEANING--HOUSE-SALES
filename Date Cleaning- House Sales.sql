SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT SaleDate, CONVERT(Date,SaleDate)
FROM [SQL Tutorial].[dbo].[Nashville Housing]


Update [SQL Tutorial].[dbo].[Nashville Housing]
SET SaleDate = CONVERT(Date,SaleDate)


ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add SaleDateConverted Date 

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET SaleDateConverted = CONVERT(Date,SaleDate)


SELECT SaleDateConverted, CONVERT(Date,SaleDate)
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]



SELECT PropertyAddress
FROM [SQL Tutorial].[dbo].[Nashville Housing]
WHERE PropertyAddress is Null


SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]
WHERE PropertyAddress is Null


SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]
ORDER BY ParcelID


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM [SQL Tutorial].[dbo].[Nashville Housing] a
JOIN [SQL Tutorial].[dbo].[Nashville Housing] b
   on a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
   WHERE a.PropertyAddress is null


Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM [SQL Tutorial].[dbo].[Nashville Housing] a
JOIN [SQL Tutorial].[dbo].[Nashville Housing] b
   on a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
   WHERE a.PropertyAddress is null


SELECT PropertyAddress
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address,
SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as City
FROM [SQL Tutorial].[dbo].[Nashville Housing]


ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add PropertySpiltAddress Nvarchar(225);

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET PropertySpiltAddress = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add PropertySpiltCity Nvarchar(225); 

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET PropertySpiltCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))


SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT OwnerAddress
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT
PARSENAME(REPLACE(OwnerAddress, ',','.'),3),
PARSENAME(REPLACE(OwnerAddress, ',','.'),2),
PARSENAME(REPLACE(OwnerAddress, ',','.'),1)
FROM [SQL Tutorial].[dbo].[Nashville Housing]


ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add OwnerSplitAddress Nvarchar(255) 

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',','.'),3)

ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add OwnerSplitCity Nvarchar(255) 

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',','.'),2)

ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
Add OwnerSplitState Nvarchar(255) 

Update [SQL Tutorial].[dbo].[Nashville Housing]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',','.'),1)


SELECT *
FROM [SQL Tutorial].[dbo].[Nashville Housing]


SELECT Distinct(SoldAsVacant), COUNT(SoldAsVacant)
FROM [SQL Tutorial].[dbo].[Nashville Housing]
Group By SoldAsVacant


SELECT SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
FROM [SQL Tutorial].[dbo].[Nashville Housing]

UPdate [SQL Tutorial].[dbo].[Nashville Housing]
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END

SELECT Distinct(SoldAsVacant), COUNT(SoldAsVacant)
FROM [SQL Tutorial].[dbo].[Nashville Housing]
Group By SoldAsVacant 


WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY 
				 UniqueID
				 ) row_num
FROM [SQL Tutorial].[dbo].[Nashville Housing]
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress


WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY 
				 UniqueID
				 ) row_num
FROM [SQL Tutorial].[dbo].[Nashville Housing]
)
DELETE 
From RowNumCTE
Where row_num > 1


WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY 
				 UniqueID
				 ) row_num
FROM [SQL Tutorial].[dbo].[Nashville Housing]
)
Select *
From RowNumCTE
Where row_num > 1



SELECT *
From [SQL Tutorial].[dbo].[Nashville Housing]

ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
DROP COLUMN OwnerAddress, TaxDistrict,PropertyAddress

ALTER TABLE [SQL Tutorial].[dbo].[Nashville Housing]
DROP COLUMN SaleDate

