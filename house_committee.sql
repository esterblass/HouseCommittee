--יצירת מסד נתונים
create database house_Committee
--יצירת הטבלאות


create table Cities_tb --ערים
(
CityId int identity not null primary key,
CityName varchar(10) not null
)

create table TypeUser_tb--סוג דייר
(
TypeUserID int identity not null primary key,
TypeApartment int not null,
PaymentPerMonth int not null,
OneTimePayment int not null--תשלום ח"פ באחוזים
)
 create table Building_tb--בניינים
(
BuildingID int identity not null primary key ,
CityId int foreign key references Cities_tb(CityId),
Floors int not null,--מספר קומות
Flats int not null,--מספר דירות
Street varchar(50) not null,
numBuilding int,
TypeUserID int foreign key references TypeUser_tb(TypeUserID)
)

create table Dayar_tb --דיירים
(
DayarID  int primary key not null, 
FirstName varchar(50)not null,
LastName varchar(50)not null,
Ps_word varchar(50) not null,
MailAddress varchar(50) not null,
Phone varchar(50) not null,
StateOfSum int not null , 
IsHouseCommittee bit not null ,
BuildingID int foreign key references Building_tb(BuildingID) not null ,--לברר איך כותבים
TypeUserID int foreign key references TypeUser_tb(TypeUserID)
)

create table TypeOfPayment_tb--סוג תשלום
(
TypeOfPaymentId int identity not null primary key,
NameType varchar(20)
)


create table Payment_tb--תשלומים
(
PaymentID int primary key not null, 
PaymentDate date not null,
TypeUserID int foreign key references TypeUser_tb(TypeUserID), --תשלום לחודש לפי סוג דירה
DayarID int foreign key references Dayar_tb(DayarID) not null,
TypeOfPaymentId int foreign key references TypeOfPayment_tb(TypeOfPaymentId),
--צורת תשלום
NumOfPayment int ,--מספר תשלומים
sumOfPayment int --סכום לתשלום
)

create table Messages_tb --הודעות
(
MessagesID int identity primary key not null, 
MessageContent varchar(10) not null,
--Situation smallInt not null, --מצב ההודעה  
BuildingID int foreign key references Building_tb(BuildingID) not null,
DayarId int foreign key references Dayar_tb(DayarId)
)

create table ProfessionalCategory_tb --קטגוריה
(
CategoryId int primary key,
Description_C varchar(20)
)

create table Professional_tb--בעלי מקצוע
(
ProfessionalId int primary key,
Name_Prof varchar(20),
Phone varchar(10),
Email varchar(20),
CategoryId int foreign key references ProfessionalCategory_tb(CategoryId),
)

create table TypeExpenses_tb--סוגי הוצאות
(
TypeExpensesId int primary key not null,
ExpenditureDescription varchar(20) not null,--תאור ההוצאה ח"פ או חודשי
)

create table BuildingExpenses_tb --הוצאות לבניין
(
BuildingExpensesId int primary key not null,
TypeExpensesId int foreign key references TypeExpenses_tb(TypeExpensesId),
SumExpenses int not null,
DateExpenses date not null,
ProfessionalId int foreign key references professional_tb(ProfessionalId),
) 

create table Surveys_tb--סקרים
(
SurveyId int primary key not null,
Sub_Survey varchar(20) not null,
Content varchar(50) not null,
startDate datetime ,
endDate datetime,
DayarId int foreign key references Dayar_tb(DayarId),
result bit,
NumAnswers int,
BuildingID int foreign key references Building_tb(BuildingID)
)

create table SurveyResults_tb--תוצאות הסקר
(
SurveyResultsId int primary key not null,
DayarId int foreign key references Dayar_tb(DayarId),
SurveyId int foreign key references Surveys_tb(SurveyId),
FinallAnswer int identity  not null,
AnotherAnswer varchar(50)
)

create table TakalotCategory_tb--קטגורית תקלות
(
TakalotCategoryId int primary key,
Description_C varchar(20)
)

create table UrgencyLevel_tb--סוגי רמת דחיפות
(
UrgencyLevelId int primary key,
NameUrgency varchar(20) not null
)

create table Takalot_tb--תקלות
(
TakalotId int primary key,
TakalotCategoryId int foreign key references TakalotCategory_tb(TakalotCategoryId),
OpenTakala int foreign key references Dayar_tb(DayarId),--נפתח ע"י הדייר
UrgencyLevelId int foreign key references UrgencyLevel_tb(UrgencyLevelId),
--צרוף תמונה
)

create table Gviyot_tb --גביות
(
GviyaId int identity primary key not null,
BuildingId int foreign key references Building_tb(BuildingId),
TypeOfPaymentId int foreign key references TypeOfPayment_tb(TypeOfPaymentId),
StartDate date not null,
EndDate date not null,
Amount int not null
)



