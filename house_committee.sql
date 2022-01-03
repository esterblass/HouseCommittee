--����� ��� ������
create database house_Committee
--����� �������


create table Cities_tb --����
(
CityId int identity not null primary key,
CityName varchar(10) not null
)

create table TypeUser_tb--��� ����
(
TypeUserID int identity not null primary key,
TypeApartment int not null,
PaymentPerMonth int not null,
OneTimePayment int not null--����� �"� �������
)
 create table Building_tb--�������
(
BuildingID int identity not null primary key ,
CityId int foreign key references Cities_tb(CityId),
Floors int not null,--���� �����
Flats int not null,--���� �����
Street varchar(50) not null,
numBuilding int,
TypeUserID int foreign key references TypeUser_tb(TypeUserID)
)

create table Dayar_tb --������
(
DayarID  int primary key not null, 
FirstName varchar(50)not null,
LastName varchar(50)not null,
Ps_word varchar(50) not null,
MailAddress varchar(50) not null,
Phone varchar(50) not null,
StateOfSum int not null , 
IsHouseCommittee bit not null ,
BuildingID int foreign key references Building_tb(BuildingID) not null ,--���� ��� ������
TypeUserID int foreign key references TypeUser_tb(TypeUserID)
)

create table TypeOfPayment_tb--��� �����
(
TypeOfPaymentId int identity not null primary key,
NameType varchar(20)
)


create table Payment_tb--�������
(
PaymentID int primary key not null, 
PaymentDate date not null,
TypeUserID int foreign key references TypeUser_tb(TypeUserID), --����� ����� ��� ��� ����
DayarID int foreign key references Dayar_tb(DayarID) not null,
TypeOfPaymentId int foreign key references TypeOfPayment_tb(TypeOfPaymentId),
--���� �����
NumOfPayment int ,--���� �������
sumOfPayment int --���� ������
)

create table Messages_tb --������
(
MessagesID int identity primary key not null, 
MessageContent varchar(10) not null,
--Situation smallInt not null, --��� ������  
BuildingID int foreign key references Building_tb(BuildingID) not null,
DayarId int foreign key references Dayar_tb(DayarId)
)

create table ProfessionalCategory_tb --�������
(
CategoryId int primary key,
Description_C varchar(20)
)

create table Professional_tb--���� �����
(
ProfessionalId int primary key,
Name_Prof varchar(20),
Phone varchar(10),
Email varchar(20),
CategoryId int foreign key references ProfessionalCategory_tb(CategoryId),
)

create table TypeExpenses_tb--���� ������
(
TypeExpensesId int primary key not null,
ExpenditureDescription varchar(20) not null,--���� ������ �"� �� �����
)

create table BuildingExpenses_tb --������ ������
(
BuildingExpensesId int primary key not null,
TypeExpensesId int foreign key references TypeExpenses_tb(TypeExpensesId),
SumExpenses int not null,
DateExpenses date not null,
ProfessionalId int foreign key references professional_tb(ProfessionalId),
) 

create table Surveys_tb--�����
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

create table SurveyResults_tb--������ ����
(
SurveyResultsId int primary key not null,
DayarId int foreign key references Dayar_tb(DayarId),
SurveyId int foreign key references Surveys_tb(SurveyId),
FinallAnswer int identity  not null,
AnotherAnswer varchar(50)
)

create table TakalotCategory_tb--������� �����
(
TakalotCategoryId int primary key,
Description_C varchar(20)
)

create table UrgencyLevel_tb--���� ��� ������
(
UrgencyLevelId int primary key,
NameUrgency varchar(20) not null
)

create table Takalot_tb--�����
(
TakalotId int primary key,
TakalotCategoryId int foreign key references TakalotCategory_tb(TakalotCategoryId),
OpenTakala int foreign key references Dayar_tb(DayarId),--���� �"� �����
UrgencyLevelId int foreign key references UrgencyLevel_tb(UrgencyLevelId),
--���� �����
)

create table Gviyot_tb --�����
(
GviyaId int identity primary key not null,
BuildingId int foreign key references Building_tb(BuildingId),
TypeOfPaymentId int foreign key references TypeOfPayment_tb(TypeOfPaymentId),
StartDate date not null,
EndDate date not null,
Amount int not null
)



