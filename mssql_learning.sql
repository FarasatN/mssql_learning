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
--select sum(sd.BirimFiyati*sd.Miktar), s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID = s.PersonelID inner join [Satis Detaylari] sd on s.SatisID = sd.SatisID where Adi like '%a%' and s.SatisID > 10500 group by s.SatisTarihi 

--select Filmler.FilmAdi, Oyuncular.Adi+' '+Oyuncular.Soyadi from Filmler inner join Oyuncular on Filmler.FilmId = Oyuncular.FilmId

--INNER JOINDE ESLESEN DATALAR, OUTER JOINDE ISE ESLESMEYEN DATALAR GELIR
--OUTER JOINLER LEFT, RIGHT VE FULL OLARAQ AYRILIR
--left/right outer joinin qisa formasi - left/right join

--select * from Oyuncular o left join Filmler f on o.FilmId = f.FilmId
--select * from Filmler f left join Oyuncular o on o.FilmId = f.FilmId

--select * from Oyuncular o right join Filmler f on o.FilmId = f.FilmId
--select * from Filmler f right join Oyuncular o on o.FilmId = f.FilmId

--FULL JOIN
--her 2 table da her seyi getirir
--select * from Oyuncular o full join Filmler f on o.FilmId = f.FilmId

--CROSS JOIN
--select count(*) from Personeller
--select count(*) from Bolge

--select p.Adi, b.BolgeID from Personeller p cross join Bolge b





--DML KOMANDALARI

--Insert
--insert [Table Adi](Kolonlar) Values(Degerler)
--insert Personeller(Adi,Soyadi) Values('Gencay','Yildiz')
--insert Personeller Values('Gencay','Yildiz','..','..') --butun deyerler verilmelidir
--select * from Personeller

--select ile basqa bir table a insert etme 
--insert OrnekPersoneller select Adi,Soyadi from Personeller

--select ile cekilen datalari yeni table yaradib ora insert etmek
--select	Adi,Soyadi, Ulke into OrnekPersoneller2 from Personeller

--Update 
--update [Table Adi] set [Column Adi] = Deger
--update OrnekPersoneller set Adi = 'Ahmet' where Soyadi = 'Novruzov'

--update with joins
--update Urunler set UrunAdi = k.KategoriAdi from Urunler u inner join Kategoriler k on u.KategoriID = k.KategoriID

--Subquery ile update etmek
--update Urunler set UrunAdi = (select Adi from Personeller where PersonelID=3)

--Top ile update etmek
--update top(10) Urunler set UrunAdi = 'x'

--Delete
--Delete from [Table Adi]
--delete from Urunler where KategoriID<3

--delete komandasi identity ni sifirlamayacaq

--Union | Union All
--Union 
--Birden fazla select sorgusunun neticesini tek seferde alt alta gosterir

--select Adi,Soyadi from Personeller
--Union 
--select MusteriAdi, MusteriUnvani from Musteriler

--Union joinden ferqli olaraq alt alta birlesdirir ve teakra olan datalari getirmir
--Inion da selecte cekilen columnlar eyni sayda olmalidir

--Union All ise butun tekrar eden de daxil datalari getirir
--select Adi,Soyadi from Personeller
--Union All
--select Adi,Soyadi from Personeller

--With Rollup
--Group By ile gruplanmis data set lerinde ist. olunur
--Datalari hiyerarxik olaraq qruplasdirir
--select SatisID, UrunID, SUM(Miktar) from [Satis Detaylari] group by	SatisID, UrunID with rollup

--with cube



--CASE - WHEN - ELSE - END
--text tex ist olunur
--select Adi, Soyadi, 
--case 
--when UnvanEki = 'Mrs.' or UnvanEki = 'Ms.' then 'Qadin'
--when UnvanEki = 'Mr.' then 'Kisi'
--else UnvanEki
--end 
--from Personeller

--select UrunID, BirimFiyati from Urunler
--select UrunID,
--case 
--when BirimFiyati between 0 and 50 then 'cin mali'
--when BirimFiyati between 50 and 100 then 'ucuz'
--when BirimFiyati between 100 and 200 then 'normal'
--when BirimFiyati > 200 then 'pahali'
--else 
--'Belirsiz'
--end
--from Urunler


--With Ties 
--Eger bir table da en ustten tutaq ki 3 eded data cekmek isteyirik ve sonuncu olanin deyerinde olan qalan datalari da isteyirik
--select top 6 * from [Satis Detaylari]
--select top 6 with ties * from [Satis Detaylari] order by SatisID

--With
--Complex sorgularda ist. olunur, miveqqeti table kimi coxlu sorgulularin neticelerini ora yigib gostere bilirik
--with PersonelSatis(id, adi, soyadi, satisid)
--as
--(
--select p.PersonelID, Adi, Soyadi, SatisID from Personeller p inner join Satislar s on p.PersonelID = s.PersonelID
--)
--select * from PersonelSatis

--SUBQUERY
--select s.SatisID, s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID = s.PersonelID where Adi = 'Nancy'
--select s.SatisID, s.SatisTarihi from Satislar s where PersonelID = (select PersonelID from Personeller where Adi = 'Nancy')
--subquery tek netice vermelidir

--Bulk Insert - xarici bir fayldan table formalasdirmaq ucundur
--bulk insert Bulk_Insert_Example
--from 'C:\Users\faras\OneDrive\Desktop\dev\full_stack_web_dev\mssql\mssql_learning\Bulk_Insert_Example.txt'
--with(fieldterminator = '\t',rowterminator = '\n' )


--Truncate - table in butun datalarini, o cumleden identify column u da silir, delete ise id columnu sifirlamirdi
--delete from Truncate_Ex
--truncate table Truncate_Ex


--@@Identity emri - id nomerisini getirir deyisikliyin
--insert Kategoriler(KategoriAdi,Tanimi,Resim) values('X','X Kategorisi',null)
--select @@IDENTITY

--@@RowCount emri - setir nomresini getirir hansi ki son deyisiklik edilib
--select * from Personeller
--select @@ROWCOUNT


--Automatik mueyyen nomreden etibaren id vermek
--dbcc checkident(Personeller, reseed, 27) --cox da tovsiye edilmir ancaq


--Null deger kontrolu
--is null
--...
--when Bolge is null then 'Bolge bilinmiyor'

--coalesce - gelen null degerler basqalari ile eve edilir bununla
--select MusteriAdi, coalesce(Bolge, 'Bolge Bilinmiyor') from Musteriler

--isnul = coalesce
--select MusteriAdi, IsNull(Bolge, 'Bolge bilinmiyor') from Musteriler



--nulliff - 1. parametrdeki deger eger 2. deki ile eynidirse null qaytaracaq
--select nullif(0,0)

--select avg(HedefStokDuzeyi) from urunler

--select avg(HedefStokDuzeyi) from Urunler where HedefStokDuzeyi <> 0
--select avg(nullif(HedefStokDuzeyi,0)) from Urunler -- yuxaridaki ile eyni deyeri qaytaracaq



--T-Sql ile db deki table+ ri listelemek
--select * from sys.tables
--select * from sysobjects where xtype = 'U'


--Bir table in Primary Key-inin olub olmadigini yoxlamaq
--select OBJECTPROPERTY(OBJECT_ID('Oyuncular'),'TableHasPrimaryKey')


--DDL - Data Definition Language
--use ExampleDB

--CREATE ile db qurmaq (eger log file yaradilmayibsa, default settingsle log file yaradilacaq)
--create database ExampleDB on(	name='GG',filename='D:\GG.mdf',size=5,filegrowth=3)
--log on (name= 'GG_LG',filename='D:\GG.ldf',size=5,filegrowth=3)

--Create Table ExampleTable(Id int primary key identity(1,1), Column1 int, Column2 nvarchar(max),[Column 3] money)

--ALTER emri - for db updating
-- alter database ExampleDB modify file( name='GG',size=20)

--alter - adding column a table
--alter table ExampleTable add Column4 nvarchar(50)

--alter - update a column
--alter table ExampleTable
--alter column Column4 int

--alter - delete a column
--alter table ExampleTable
--drop column Column4

--alter - adding constraint to table
--alter table ExampleTable
--add constraint ExampleConstraint default 'bos' for Column2

--alter - deleting constraint to table
--alter table ExampleTable
--drop constraint ExampleConstraint 


--SP_RENAME - table name updating
--exec sp_rename 'ExampleTable','ExTable'

--SP_RENAME - column of table name updating
--exec sp_rename 'ExTable.Column2','Col2'

--drop 
--drop table ExTable
--drop database ExampleDB




--Constraints

--DEFAULT Constraint - columna eger bir deger girilmirse, default olaraq ne gotureceyini teyin edirik
--Add Constraint [Constraint  Adi] Default 'Default Value' For [Column Name]
-- use ExampleDB

--Create Table ExampleTable( Id int primary key identity(1,1), Column1 nvarchar)
--alter table ExampleTable
--add constraint Column1Constraint default 'Bos' for Column1

--alter table ExampleTable
--add constraint Column2Constraint default -1 for Column2

--insert ExampleTable(Column2) Values(0)
--insert ExampleTable(Column1) Values('Example value')

--check constraint
--verilen sert duzgun oldugu halda deger vermek mumkundur, serte uygun olmayan deyerler varsa constrain yaradilmayacaq
--alter table ExampleTable
--add constraint Column3Control check ((Column3*5)%2=0)

--with nocheck komandasi indiye kimi save olunanlari gormezden gelir check ucun


--primary key constraint- primary key yalniz bir eded olmalidir
--alter table ExampleTable
--add constraint PrimaryId primary key (id)

--unique consraint column u unique hala getirir, tekrar eden deger yazmaq olmur
--alter table ExampleTable
--add constraint ExampleTableUnique unique (Column3)

--foreign key constraint - bir birine bagle table lari baglandigi columndan nese silinmesinin qarsisini alir
--create table Students
--(
--	StudentID int primary key identity(1,1),
--	LessonID int,
--	StudentName nvarchar(max),
--	StudentSurname nvarchar(max)
--)
--create table Lessons
--(
--	LessonID int primary key identity(1,1),
--	LessonName nvarchar(max),
--)

--alter table Students
--add constraint ForeignKeyStudentLesson foreign key (LessonID) references Lessons(LessonID)

--cascade - eger foreign key silinirse,onun elaqqeli oldugu columdaki qarsiligi da silinsin ya yox, onu teyin edir
--alter table Students
--add constraint ForeignKeyStudentLesson2 foreign key (LessonID) references Lessons(LessonID)
--on delete cascade
--on update cascade

--set null - eger foreign key olan sutundan bir deger silinse, qarsiliq geldiyi sutundaki deyer null olacaq

-- set default - da eyni qaydada silinende deault istediyimiz deyeri gosterecek

--bu konf+ verilmediyi teqdirde "no action" ozelligi kecerlidir




--Variables
-- declare @x int, @y nvarchar
--declare @age int = 30
--set @age  = 35

--declare @date datetime = GetDate()
--set @date = GetDate()+1
--select @date


-- reading from value of variable
--declare @x int = 3
--set @x = 4
--select @x -- select table yaradib degeri getirir
--print @x  -- print ise birbasa message kimi gosterir


-- select ile gelen datalari degiskenle elde etmek
--declare @adi nvarchar(max), @soyadi nvarchar(max)
--select @adi = Adi,@soyadi = Soyadi from Personeller where PersonelID=1
--1. sorgu neticesinde gelen setir sayi 1 eded olmalidir
--2. columnlardaki datalarin tipleri ne ise o datalari temsil edecek degiskenlerin tipleri de benzer olmalidir
--select @adi,@soyadi 


--Batch - Go
--ardicil yazilan sorgularda pille pille getmeyi saglayir
--create database BatchGoExample
--go
--use BatchGoExample
--go 
--create table BatchGoExample2
--(
--	id int primary key identity(1,1),
--	Column1 nvarchar(MAX),
--	Column2 nvarchar(MAX)
--)


--if serti
-- = : c# ==
-- <> : !=
-- > : >
-- < : <

--tek setirlik if
--declare @name nvarchar(max)
--set @name = 'Gencay'
--if @name = 'Gencay'
--	print 'Yes'
--else 
--	print 'No'


-- begin end (scope), ifden sonra birden cox is gorulecekse, begin end ist. edilmelidi
--declare @n1 int = 3
--declare @n2 int = 5
--if @n1 < @n2 
--	begin
--		print 'Yes'
--		select @n1 [n1], @n2 [n2]
--	end
--else 
--	begin
--		print 'No'
--		select @n1 [n1], @n2 [n2]
--	end


--musteri cedvelinde amerikali musteri var mi?
use Northwind
--select * from Musteriler where Ulke = 'USA'
--if @@ROWCOUNT > 0
--	print 'amerikali musteri var'
--else 
--	print 'amerikali musteri yoxdur'

--adi 'Farasat', soyadi 'Novruzov' olan Personel var mi? Varsa he, yoxdursa yox desin
--declare @Adi nvarchar(max) = 'F', @Soyadi nvarchar(max) = 'N'
--select Adi, Soyadi from Personeller where Adi = @Adi and Soyadi = @Soyadi
--if @@ROWCOUNT > 0
--	print 'he'
--else 
--	begin 
--		print 'yox'
--		insert Personeller(Adi, Soyadi) values(@Adi,@Soyadi)
--	end

--if - else if - else
--declare @name nvarchar(max) = 'Gencay'
--declare @age int = 25 
--if @name = 'Mahmut'
--	print 1
--else if @name = 'Gencay'
--	print 2
--else 
--	print 3



--Exists funksiyasi
--if exists(select * from Personeller) 
--	print 'full'
--else 
--	print 'empty'


--while loop
--declare @counter int = 0
--while @counter < 100000
--	begin
--		print @counter
--		set @counter = @counter+1
--		if @counter % 19 = 0
--			break
--	end

--declare @counter int = 0
--while @counter < 100000
--	begin
--		if @counter % 2 = 0
--			begin
--				set @counter = @counter+1
--				continue
--			end
--			print @counter
--			set @counter = @counter+1
--	end
	

--temporary tables
--table i fiziksel olaraq kopyalama
--select * into #TempPersoneller from Personeller -- bu halda primary ve foreign keyler yaradilmir, qalan her sey eynidir
--select * from #TempPersoneller --eyni qaydada update,insert, delete de ede bilirik
-- ## ile yaradilan temp. table lar ise hem de 3. sexsler ucun de elcatan olur


--uniqueidentifier data type
--declare @x uniqueidentifier
--set @x = newid()
--select @x


--View - umumilikde, qarisiq sorgulari tek bir sorgu ile etmek ucun ist. olunur, fiziki olaraq save olunur
--create view vwGotur
--as
--select p.Adi + ' ' +p.Soyadi [Adi Soyadi], k.kategoriAdi], count(s.SatisID) [Toplam Satış] from Personeller p inner join 
--	Satislar s on p.Personeller = s.PersonelID
--		inner join [Satis Detaylari] sd on s.SatisID = sd.SatisID
--		inner join Urunler u on sd.UrunID = u.UrunID
--		inner join Kategoriler k on k.kategoriID =u.KategoriID
--group by p.Adi+ ' '+ p.Soyadi,k.kategoriAdi
--select *from vwGotur
--select * from vwGotur where [Adi Soyadi] like '%Robert%'

--with encryption ile qaynaq kodunu gizetmek olur
--with check options




--Functions - Scalar, Inline
--Scalar - geriye deger gonderen funk.
--Inline - geriye table gonderen funk.
--her ikisi de fiziki olaraq db de yaradilir
--uzerinde calisilan db-nin Programmability -> Functions kombinasiyasindan yaradilan funk+i gore bierik

--Scalar function
--create function Topla(@Sayi1 int, @Sayi2 int) returns int
--as
--	begin 
--		return @Sayi1 + @Sayi2
--	end

--funksiyanin cagirilmasi
--select dbo.Topla(2,3)

--Example: 
--"Northwind" dbda, herhansi bir mehsulun %18 faiz edv daxil olmaq uzere toplam maliyyetini getiren funksiyani yazaq
--create function Maliyet(@BirimFiyati int, @StokMiktari int) returns nvarchar(max)
--as 
--	begin 
--		declare @Sonuc int = @BirimFiyati * @StokMiktari * 1.18
--		return @Sonuc
--	end

--select dbo.Maliyet(10,20)


--Inline Function
--bu funksiyalarda begin/end istifade olunmur,geriye table qaytarir

--create function OrnekFunksiyon() returns int 
--with encryption --daha sonra bu funksiyada deyisiklik etmek ucun alter function etmeli ve with encryption i silmeliyik
--as
--	begin
--		return 3
--	end



--Computed Column
--select UrunAdi, dbo.Topla(BirimFiyati, HedefStokDuzeyi) HesaplanmisKolon from Urunler





--Stored Procedures - normal sorgulardan daha suretli isleyir
--cunki, her defe hansi tabledan neyi cekdiyini tekrar etmir, birinci defe bunu save edir
--ic-ice ist. oluna bilir, select, insert, update, delete etmek olir
--iclerinde funksiya yaratmaq olur
--sorgularin kenardan alacagi deyerleri parametr kimi stored procedure kecirde bildiyimiz ucun 'sql injectiona' da qarsi tedbir gormek olur
--fiziki db obyektidir, ona gore de create ile yaradilir
--Programmability -> Store Procedures kombinasiyasinda yerlesir

--create proc sp_Ornek
--(--bu moterizesiz de ola bilir
--	@Id int -- eksi olmadigi teqdirde bu parametre inuttur
--)as
--select * from Personeller where PersonelID = @Id

--exec dbo.sp_Ornek 3


-- geriye deger donduren stored procedure
--create proc UrunGetir
--(
--	@Fiyat Money
--)as
--select * from Urunler where BirimFiyati > @Fiyat
--return @@rowcount

--exec UrunGetir 40 -- bu ancaq geriye gelen datani gosterir

--eger gelen degeri ist. etmek isteyirikse
--declare @Sonuc int
--exec @Sonuc = UrunGetir 40
--print cast(@Sonuc as nvarchar(max)) + ' eded urun tesirlenmisdir'


--output ile deger dondurmek, output olan parametrler procedurun icinden gelir
--create proc sp_Ornek2
--(
--	@Id int,
--	@Adi nvarchar(max) output,
--	@Soyadi nvarchar(max) output 
--)as
--select @Adi = Adi, @Soyadi = Soyadi from Personeller where PersonelID = @Id

--declare @Adi nvarchar(max), @Soyadi nvarchar(max)
--exec sp_Ornek2 3, @Adi Output, @Soyadi Output
--select @Adi + ' '+@Soyadi

--Example:
--create proc sp_PersonelEkle(@Ad nvarchar(max), @Soyad nvarchar(max),@Sehir nvarchar(max))
--as insert Personeller(Adi,Soyadi,Sehir) Values(@Ad,@Soyad,@Sehir)

--exec sp_PersonelEkle 'Farasat', 'Novruzov','Baku'
--select * from Personeller

--parametr olaraq default deger vermek - @Ad varchar(50) = 'Farasat'



--exec command
--exec('select * from Personeller')
--lazim olan sorgu tam olaraq bir execde yerlesmelidir, ayri ayri bolsek xeta verecek




--Trigger-SQL'de bir sorgu çalıştırdığımızda, başka bir sorgunun çalışmasını sağlamak için yazılan koddur.
--Mesela bir tablodan kayıt sildiğimizde, başka bir tablodan onunla ilgili bir kaydın silinmesi için kullanabiliriz.

--DML Triggerlar - bir table da insert,update,delete islemleri gerceklestiginde devreye giren yapilardir,bu islemler sonucunda,yaxud esnasinda ortaya cixar
--DDL Triggerlar - Create, Alter, Drop islerinde ortaya cixar

--Inserted Table/Deleted Table

--create trigger OrnekTrigger
--on Personeller
--after insert
--as 
--select * from Personeller

--insert Personeller(Adi,SoyAdi) values('Gencay','Yildiz')--insert etdikden sonra Personeller table i listelenir trigger sayesinde

--example:
--Tedarikciler cedvelinden bir data silindikde butun urunlerin fiyati avtomatik olaraq 10 artsin

--create trigger triggerTedarikciler
--on Tedarikciler
--after delete
--as 
--update Urunler set BirimFiyati = BirimFiyati + 10
--select * from Urunler

--delete from Tedarikciler where TedarikciID = 30

--example 2:
--create table LogTablosu(Id int primary key identity(1,1), Rapor nvarchar(max))
--create trigger triggerPersoneller
--on Personeller
--after delete
--as 
--declare @Adi nvarchar(max), @Soyadi nvarchar(max)
--select @Adi = Adi, @Soyadi = Soyadi from deleted
--insert LogTablosu 
--values('sdfdf')
--values('Adi ve Soyadi '+@Adi + ' '+@Soyadi+' olan personel '+suser_name()+' tarafindan '+cast(getdate() as nvarchar(max))+' tarihinde silinmistir.')

--delete from Personeller where PersonelID = 10

--multiple trigger
--create trigger Multitrigger
--on Personeller
--after delete, insert
--as
--print 'Personeller has been changed'


--insert Personeller(Adi,Soyadi) values('Gencay','Yildiz')
--delete from Personeller where PersonelID=29

--DROP TRIGGER dbo.triggerPersoneller


--instead of
--insert,update,delete yerine bu isleri gor menasina gelir
--meselen, kimse update etmek istedi tablei, bunu log kimi saxlamaq olar

--create trigger trgPersonellerRaporInstead
--on Personeller
--instead of update
--as
--declare @EskiAdi nvarchar(max), @YeniAdi nvarchar(max)
--select @EskiAdi = Adi from deleted
--select @YeniAdi = Adi from inserted
--insert LogTablosu Values('Adi '+@EskiAdi+' olan personel '+@YeniAdi+' yeni adiyla degistirilerek '+SUSER_NAME()+' kullanicisi tarafindan '+cast(getdate() as nvarchar(max))+' tarihinde guncellenmek istendi')

--update Personeller set Adi = 'Farasat' where PersonelID=2

--after
--create trigger FarasatTrigger
--on Personeller
--after delete 
--as 
--declare @Adi nvarchar(max)
--select @Adi = Adi from deleted
--if @Adi = 'Farasat'
--	begin 
--		print 'Bu kayiti silemezsiniz'
--		rollback --edilen butun isleri geri qaytarir
--	end

--delete from Personeller where PersonelID = 31

--DDL triggers - create,alter, drop zamani
--create trigger DDL_Trigger
--on database
--for drop_table,alter_table, create_function
--as 
--print 'Bu islem gerceklestirilemez'
--rollback

--drop table LogTablosu


--triggers disable/enable
--disable trigger DDL_Trigger on database
--enable trigger DDL_Trigger on database


--Transaction- eger edilen islerin hnsindasa probem varsa, butun iseri geri qaytarir
--misal ucun, kart ile odenislerde transaction olur. Siz marketden mehsul alarken sizin hesabinizdan pul cixacaq, eger hemin anda internetde tutaq ki, problem oldu,o zaman pul geri qayidacaq

--begin tran- isi basladir
--commit tran - transaction ugurludur - normalda gorunmeden, default olaraq butun islerde bu kecerlidir
--rollback tran -  transaction legv olunur

--insert Bolge values(5,'Baku')

--begin tran kontrol
--declare @i int
--delete from Personeller where PersonelID > 20
--set @i = @@ROWCOUNT
--if @i = 1
--begin 
--	print 'Kayit silindi'
--	commit 
--end
--else
--begin 
--	print 'Islemler geri alindi'
--	rollback
--end


--backup/restore
--backup: full, differential(son full backupdan ferqli olanlarin backupini alir), transaction log

--generate scripts for backup/restore - bu usul tovsiyye olunur



--son primary keyi oyrenmek
--select IDENT_CURRENT('Personeller')


--@@identity, scope_identity(), ident_current() ferqleri

--@@identity - trigger ist. olunan sorgularda yalnis netice verme ehtimali oldugu ucun ist. olunmasi tovsiyye edilmir
 --evezine scope_identity() olacaq

 --ident_current() de scopea baxmadan gosterir


 --row_number() - setirlerin sayini gosterir
 --select row_number() over(order by Adi) indexer, * from Personeller order by PersonelID

 --partition by - eyni olanlari xirda qrup halina getirir


 --ansi_nulls - null degerlerin sorguda gorunub/gorunmemesini teskil edir
 --set ansi_nulls on
 --select * from Personeller where Bolge = null
 --set ansi_nulls off


 --sql server 2016 - dynamic data masking - sorguda gelen datalardan istediyimizi gorunmemek ucun maskalamaq dir





 --Scaffold-DbContext 'Server=(localdb)\MSSQLLocalDB;Database=Northwind;Trusted_Connection=True;' Microsoft.EntityFrameworkCore.SqlServer -Tables Personeller,PersonelBolgeler -ContextDir Data -OutputDir Models