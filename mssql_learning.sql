USE Northwind 

-- select * from Personeller

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
-- select * from Personeller where Year(DogumTarihi) Between 1950 and 1960

-- SELECT MusteriAdi from Musteriler
-- select SUBSTRING(MusteriAdi, 0, CHARIndex(' ',MusteriAdi)) from Musteriler
-- select SUBSTRING(MusteriAdi, CHARIndex(' ',MusteriAdi), LEN(MusteriAdi)) from Musteriler
-- select SUBSTRING(MusteriAdi, 0, CHARIndex(' ',MusteriAdi)),SUBSTRING(MusteriAdi, CHARIndex(' ',MusteriAdi), LEN(MusteriAdi)) from Musteriler


-- select 3+2 -- -,*,/,%
-- select pi()
-- select sin(90)
-- select power(2,3)
-- select abs(-12)
--   select floor(rand()*10)

-- select getdate()
-- select dateadd(day, 10, getdate()) --year,month
-- select datediff(year, '05.03.1677',getdate())
-- select datepart(dw, getdate())

--select top 5 * from Personeller

-- select Distinct Sehir from Personeller -- tekrar datalari gostermir

-- select * from Urunler
-- select KategoriID, count(*) from Urunler group by KategoriID --normal ve aggregate funksiyasi olan columnlar yanasi cagirilirsa, group by ist olunur
-- select * from Satislar
-- select PersonelID, count(*) from Satislar group by PersonelID
-- select PersonelID, sum(NakliyeUcreti) from Satislar group by PersonelID
--select PersonelID, sum(NakliyeUcreti) from Satislar where PersonelID <> 10 group by PersonelID --where normal kolonlarda ist. olunur

-- select PersonelID, sum(NakliyeUcreti) from Satislar  group by PersonelID having sum(NakliyeUcreti)>10000

-- table birlestirme
-- select * from Personeller,Satislar -- duzgun yanasma deyil
-- select * from Personeller p,Satislar s where p.PersonelID = s.PersonelID

--join - 2 ve daha cox cedveli elaqeli sekilde birlesdirir ve yalniz elaqeli olan datalar gelecek. Table t1 - t1.Column1 = Table1.Column1
--hansi personel hansi satisaleri edib:
--select * from Personeller inner join Satislar on Personeller.PersonelID = Satislar.PersonelID
--hansi Urun hansi Kategoriyadadir
--select Urunler.UrunAdi, Kategoriler.KategoriAdi from Urunler inner join Kategoriler on Urunler.KategoriID = Kategoriler.KategoriID where Kategoriler.KategoriAdi= 'Beverages'

--select Urunler.UrunAdi, Kategoriler.KategoriAdi from Urunler inner join Kategoriler on Urunler.KategoriID = Kategoriler.KategoriID where Kategoriler.KategoriAdi = 'Beverages'  

--hansi satisi hansi personel edib
--select Satislar.SatisID, Personeller.Adi+' '+Personeller.SoyAdi from Satislar inner join Personeller on Satislar.PersonelID = Personeller.PersonelID where Personeller.PersonelID>4

--faks nomresi null olmayan tedarukculerden alinmis productlar hansilardir  
-- select Urunler.UrunAdi from Urunler inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID 
--where Tedarikciler.Faks<>'null'
--where Tedarikciler.Faks is not null

--3 ve daha artiq table birlestirme
--select * from Personeller inner join Satislar on Personeller.PersonelID = Satislar.PersonelID inner join Musteriler on Satislar.MusteriID = Musteriler.MusteriID where Personeller.Adi = 'Nancy' and year(Satislar.SatisTarihi)>=1997

--Limited olan tedarukculerden alinmis seafood kategorisindeki urunlerimin toplam satis tutari (Urunler,Kategoruler, Tedarukculer)
--select sum(Urunler.HedefStokDuzeyi*Urunler.BirimFiyati)  from Urunler inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID inner join Kategoriler k on k.KategoriID = Urunler.KategoriID
--where Tedarikciler.SirketAdi like '%Ltd.%' and k.KategoriAdi = 'Seafood'

--eyni table da elaqeli birlestirme
--select p1.Adi, p2.Adi from Personeller p1 inner join Personeller p2 on p1.BagliCalistigiKisi = p2.PersonelID

--group by with inner join
--hansi personel(adi ve soyadi ile birlikde) toplam ne qeder satis edib, satis ededi 100den artiq olanlar ve personelin adinin bas herfi "M" olanlar gelsin(Personeller, Satislar)
--select p.Adi + ' ' + p.Soyadi, count(s.SatisID) from Personeller p inner join Satislar s on p.PersonelID = s.PersonelID where p.Adi like 'm%' group by p.Adi + ' ' + p.Soyadi having count(s.SatisID)>100

--seafood kategorisindeki urunlerin sayisi kactir
--select k.KategoriAdi, count(u.UrunAdi) from Urunler u inner join Kategoriler k on k.KategoriID = u.KategoriID where k.KategoriAdi = 'Seafood' group by k.KategoriAdi

--en cox satis eden personel
--select top 1 Personeller.Adi, count(Satislar.SatisID) from Personeller
--inner join Satislar on Personeller.PersonelID = Satislar.SatisID
--group by Personeller.Adi 
--order by count(Satislar.SatisID) desc

--adinda 'a' herfi kecen personellerin satis id si 10500 den boyuk olan 
--satislarinin toplam tutarini(miktar* birimfiyat) ve bu satislarin hansi tarihte gerceklestiyini listele
select sum(sd.BirimFiyati*sd.Miktar), s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID = s.PersonelID inner join [Satis Detaylari] sd on s.SatisID = sd.SatisID where Adi like '%a%' and s.SatisID > 10500 group by s.SatisTarihi 