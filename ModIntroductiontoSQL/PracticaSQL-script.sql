/*
	Práctica de Modelado de datos e introducción a SQL
	
	Nota: Este script genera el modelo ER planteado por el alumno y carga datos para hacer pruebas.

*/

-- Creamos nuestro esquema/espacio de trabajo

create schema practicaSQL authorization bfngolmn;

--Creamos las tablas de CARGROUP/BRAND/MODEL con sus PK y FK

create table practicasql.carGroup(
idcarGroup varchar(10) not null, -- PK
groupName varchar(100) not null
);

create table practicasql.brand(
idBrand varchar(10) not null, -- PK
idcarGroup varchar(10) not null, -- FK
brandname varchar(100) not null
);

create table practicasql.model(
idModel varchar(10) not null, -- PK
idBrand varchar(10) not null, -- FK
modelname varchar(100) not null,
description varchar(250) null
);

alter table practicasql.cargroup
add constraint cargroup_pk primary key (idcarGroup);

alter table practicasql.brand
add constraint brand_pk primary key(idBrand);

alter table practicasql.brand 
add constraint brand_fk foreign key (idCarGroup)
references practicasql.carGroup(idCarGroup);

alter table practicasql.model
add constraint model_pk primary key (idModel);

alter table practicasql.model
add constraint model_FK foreign key (idBrand)
references practicasql.brand(idBrand);

--Creamos la tabla COLOR y su PK

create table practicasql.color(
idcolor varchar(10) not null, --PK
colorname varchar(100) not null,
description varchar(250) null 
);

alter table practicasql.color
add constraint color_pk primary key (idcolor);

--Creamos la tabla CURRENCY y su PK

create table practicasql.currency(
idcurrency varchar(10) not null, -- PK
currency_name varchar(100) not null
);

alter table practicasql.currency
add constraint currency_pk primary key (idcurrency);

--Creamos la tabla CAR con su PK y FK 

create table practicasql.car(
idcar varchar(10) not null, -- PK 
idmodel varchar(10) not null, -- FK
plate varchar(50) not null, 
idcolor varchar(10) not null, -- FK
acq_date date not null, 
total_km integer not null,
description varchar (250) null
);

alter table practicasql.car
add constraint car_pk primary key (idcar);

alter table practicasql.car 
add constraint car_model_FK foreign key (idmodel)
references practicasql.model(idmodel);

alter table practicasql.car 
add constraint car_color_FK foreign key (idcolor)
references practicasql.color(idcolor);


-- Creamos la tabla REVISION
create table practicasql.revision(
idrevision varchar(10) not null, --PK
idcar varchar(10) not null, -- PK FK
rev_km integer not null, 
rev_date date not null, 
total_cost integer not null, 
idCurrency varchar(10) not null, --FK
description varchar(250) null
);

alter table practicasql.revision
add constraint revision_pk primary key (idrevision, idcar);

alter table practicasql.revision
add constraint revision_car_fr foreign key (idcar)
references practicasql.car(idcar);

alter table practicasql.revision
add constraint revision_currency_fr foreign key (idcurrency)
references practicasql.currency(idcurrency);

--Creamos la tabla COMPANY y sus PK y FK
create table practicasql.company(
idcompany varchar(10) not null, -- PK
companyName varchar(100) not null
);

alter table practicasql.company
add constraint company_pk primary key (idcompany);

--Creamos la tabla INSURANCE
create table practicasql.insurance(
idinsurance varchar(10) not null, --PK
idcar varchar(10) not null, -- PK FK
idcompany varchar(10) not null, --FK 
insurance_number varchar(20) not null, 
acq_date date not null, 
end_date date not null,
total_cost integer not null, 
idCurrency varchar(10) not null, --FK
description varchar(250) null
);

alter table practicasql.insurance
add constraint insurance_pk primary key (idinsurance, idcar);

alter table practicasql.insurance
add constraint insurance_car_fk foreign key (idcar)
references practicasql.car(idcar);

alter table practicasql.insurance
add constraint insurance_company_fk foreign key (idcompany)
references practicasql.company(idcompany);

alter table practicasql.insurance
add constraint insurance_currency_fr foreign key (idcurrency)
references practicasql.currency(idcurrency);

--------------------------------------------------------------- Fin de creacion de tablas

/* 
 * Ahora vamos a crear los datos que iran dentro de nuestras tablas 
 * Se crearan 
 * 5 grupos
 * 10 marcas
 * 15 modelos
 * 20 coches
 * 4 colores
 * 3 monedas
 * 4 compañias aseguradoras
 * 20 polizas de seguro una para cada cohe
 * 5 revisiones
 * */

--Añadimos datos a los grupos empresariales
insert into practicasql.cargroup (idcargroup, Groupname) values ('000001', 'BMWGroup');
insert into practicasql.cargroup (idcargroup, Groupname) values ('000002', 'Daimler');
insert into practicasql.cargroup (idcargroup, Groupname) values ('000003', 'FCA');
insert into practicasql.cargroup (idcargroup, Groupname) values ('000004', 'FORDGroup');
insert into practicasql.cargroup (idcargroup, Groupname) values ('000005', 'GeneralMotors');

--Añadimos datos a las marcas
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000001', '000001', 'BMW');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000002', '000001', 'Mini');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000003', '000002', 'Mercedes-Benz');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000004', '000002', 'Smart');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000005', '000003', 'Fiat');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000006', '000003', 'Jeep');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000007', '000004', 'FORD');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000008', '000004', 'TROLLER');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000009', '000005', 'Chevrolet');
insert into practicasql.brand (idbrand, idcargroup, brandname) values ('000010', '000005', 'Cadillac');

--Añadimos datos a los modelos
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000001', '000001', 'BMW iX', 'Electrico');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000002', '000002', 'Mini Cabrio Copper', 'Descapotable');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000003', '000003', 'EQE 350+', 'WLTP: consumo eléctrico en kWh/100 km (ciclo mixto): 18,7-16,1; emisiones de CO2 en g/km (ciclo mixto): 0');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000004', '000004', 'SmartForTwo', 'Solo dos personas');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000005', '000005', '500X Hatchback MY22', 'WLTP emisiones CO2 combinado (g/km): 136 WLTP consumo ciclo mixto (l/100km): 6');
insert into practicasql.model (idmodel, idbrand, modelname) values ('000006', '000006', 'RENEGADE e-Hybrid MY23');
insert into practicasql.model (idmodel, idbrand, modelname) values ('000007', '000007', 'KUGA ST LINE');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000008', '000008', 'TX4', 'Muy guay');
insert into practicasql.model (idmodel, idbrand, modelname) values ('000009', '000009', 'Spark 2022');
insert into practicasql.model (idmodel,idbrand, modelname, description) values ('000010', '000010', 'CT4-V', 'Luxury' );
insert into practicasql.model (idmodel, idbrand, modelname) values ('000011', '000009', 'Spark 2021');
insert into practicasql.model (idmodel, idbrand, modelname) values ('000012', '000009', 'Spark 2020');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000013', '000004', 'SmartForFour', 'Para cuatro');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000014', '000008', 'TX3', 'Guay');
insert into practicasql.model (idmodel, idbrand, modelname, description) values ('000015', '000001', 'Serie 3 Berlina', 'Gasolina, Diesel, Hibrido Enchufable');

--Añadimos datos a los colores
insert into practicasql.color (idcolor, colorname) values ('00001', 'BLACK');
insert into practicasql.color (idcolor, colorname, description) values ('00002', 'AZUL MISTICO', 'Very cool color');
insert into practicasql.color (idcolor, colorname) values ('00003', 'WHITE');
insert into practicasql.color (idcolor, colorname) values ('00004', 'GREY');
insert into practicasql.color (idcolor, colorname) values ('00005', 'RED');

--Añadimos datos a monedas
insert into practicasql.currency (idcurrency, currency_name) values ('000001', 'Euro');
insert into practicasql.currency (idcurrency, currency_name) values ('000002', 'Dolar');
insert into practicasql.currency (idcurrency, currency_name) values ('000003', 'Libra');

--Añadimos datos a coches
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000001', '000001', '2360 GVK', '00001', '2022-01-01', '12000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000002', '000001', '2373 INY', '00003', '2022-01-01', '20000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000003', '000002', '0541 GNM', '00002', '2022-03-14', '5000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000004', '000003', '8030 EXU', '00005', '2021-07-20', '1000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000005', '000004', '6620 HCY', '00001', '2021-01-13', '17000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000006', '000004', '1738 FHT', '00001', '2021-02-21', '30000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000007', '000005', '9587 NWL', '00003', '2022-09-20', '21000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000008', '000006', '4375 RWF', '00003', '2021-05-22', '2000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000009', '000007', '7260 LJL', '00003', '2022-03-01', '4000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000010', '000008', '4956 UNP', '00004', '2022-11-21', '50000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000011', '000009', '6669 GQR', '00002', '2022-07-20', '35000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000012', '000009', '9417 CGX', '00003', '2021-02-02', '110000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000013', '000010', '7952 VOD', '00005', '2021-05-15', '200000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000014', '000011', '7280 XKE', '00004', '2022-10-04', '12000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000015', '000012', '1870 ZTF', '00001', '2020-12-30', '42000');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000016', '000013', '2986 LOJ', '00001', '2021-12-03', '122030');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000017', '000014', '5200 HJP', '00001', '2022-02-14', '113322');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000018', '000015', '2696 LNC', '00001', '2022-08-18', '1344324');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000019', '000002', '8928 FRV', '00002', '2022-09-07', '1343245');
insert into practicasql.car (idcar, idmodel, plate, idcolor, acq_date, total_km) values ('000020', '000011', '9793 GIP', '00003', '2021-09-03', '55724');

--Añadimos compañias aseguradoras
insert into practicasql.company (idcompany, companyname) values ('00001', 'Mapfre');
insert into practicasql.company (idcompany, companyname) values ('00002', 'Allianz');
insert into practicasql.company (idcompany, companyname) values ('00003', 'Mutua Madrileña');
insert into practicasql.company (idcompany, companyname) values ('00004', 'AXA');

--Añadimos seguros para cada coche 
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00001', '000001', '00001', '35267184', '2022-01-15', '2023-01-15', '113', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00002', '000002', '00002', '12344532', '2022-01-15', '2023-01-15', '120', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00003', '000003', '00003', '56564344', '2022-01-15', '2023-01-15', '89', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00004', '000004', '00004', '76443345', '2022-01-15', '2023-01-15', '203', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00005', '000005', '00001', '86545333', '2022-01-15', '2023-01-15', '142', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00006', '000006', '00001', '34234544', '2022-01-15', '2023-01-15', '230', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00007', '000007', '00001', '74435335', '2022-01-15', '2023-01-15', '99', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00008', '000008', '00002', '13243535', '2022-01-15', '2023-01-15', '232', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00009', '000009', '00002', '28358746', '2022-01-15', '2023-01-15', '170', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00010', '000010', '00002', '98743634', '2022-01-15', '2023-01-15', '189', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00011', '000011', '00002', '98473456', '2022-01-15', '2023-01-15', '210', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00012', '000012', '00003', '43354334', '2022-01-15', '2023-01-15', '200', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00013', '000013', '00003', '43628387', '2022-01-15', '2023-01-15', '302', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00014', '000014', '00001', '53167838', '2022-01-15', '2023-01-15', '321', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00015', '000015', '00001', '34236324', '2022-01-15', '2023-01-15', '421', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00016', '000016', '00001', '65654456', '2022-01-15', '2023-01-15', '211', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00017', '000017', '00004', '98756546', '2022-01-15', '2023-01-15', '201', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00018', '000018', '00004', '12233435', '2022-01-15', '2023-01-15', '91', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00019', '000019', '00004', '23465757', '2022-01-15', '2023-01-15', '242', '000001' );
insert into practicasql.insurance (idinsurance, idcar, idcompany, insurance_number, acq_date, end_date, total_cost, idcurrency) values ('00020', '000020', '00004', '34355768', '2022-01-15', '2023-01-15', '234', '000001' );

--Añadimos datos a revisiones 
insert into practicasql.revision (idrevision, idcar, rev_km, rev_date, total_cost, idcurrency, description) values ('0001','000011', '7627', '2022-10-21', '120', '000001', 'Revision general' );
insert into practicasql.revision (idrevision, idcar, rev_km, rev_date, total_cost, idcurrency, description) values ('0002','000007', '17842', '2022-10-12', '79', '000001', 'Abolladura' );
insert into practicasql.revision (idrevision, idcar, rev_km, rev_date, total_cost, idcurrency, description) values ('0003','000018', '12000', '2022-10-19', '125', '000001', 'Revision ruedas' );
insert into practicasql.revision (idrevision, idcar, rev_km, rev_date, total_cost, idcurrency, description) values ('0004','000005', '10000', '2022-08-03', '150', '000001', 'Revision general' );
insert into practicasql.revision (idrevision, idcar, rev_km, rev_date, total_cost, idcurrency) values ('0005','000014', '10000', '2022-11-23', '230', '000001' );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Fin carga de datos*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
