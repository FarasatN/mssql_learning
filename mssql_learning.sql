USE Northwind 

-- Select * from Personeller

-- select Adi, Soyadi from Personeller

-- select 'Farasat Novruzov' 'Adi Soyadi'
 
-- select * from xxxx

-- select Adi,IseBaslamaTarihi from Personeller //2 ferqli column tipindeki degerler birlesdirile bilmez, buna gore de asagidaki metodlardan ist. edirik

-- select adi + ' : ' + CONVERT(nvarchar, IseBaslamaTarihi) from Personeller
-- select Adi + ' ' + Cast(IsebaslamaTarihi as nvarchar) from Personeller 

-- select * from Personeller where Sehir = 'London'
-- select * from Personeller where BagliCalistigiKisi<3 and Sehir = 'London'

-- select * from Personeller where YEAR(IseBaslamaTarihi) = 1993
-- select * from Personeller where Day(DogumTarihi) <> 23
-- select * from Personeller where Year(DogumTarihi) > 1956
-- select * from Personeller where Year(DogumTarihi) > 1956 and Sehir = 'London'
select * from Personeller where Year(DogumTarihi) Between 1950 and 1960


  