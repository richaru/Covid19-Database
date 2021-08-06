 CREATE TABLE admin (
  AdminId varchar(10) NOT NULL,
  LoginId varchar(10) DEFAULT NULL,
  PRIMARY KEY (AdminId),
  KEY LoginId (LoginId),
  CONSTRAINT admin_ibfk_1 FOREIGN KEY (LoginId) REFERENCES login (LoginId)
);

 CREATE TABLE assign (
  AssignId int NOT NULL,
  PId int DEFAULT NULL,
  DId int DEFAULT NULL,
  PRIMARY KEY (AssignId),
  KEY PId (PId),
  KEY DId (DId),
  CONSTRAINT assign_ibfk_1 FOREIGN KEY (PId) REFERENCES patient (PId),
  CONSTRAINT assign_ibfk_2 FOREIGN KEY (DId) REFERENCES doctor (DId)
);

 CREATE TABLE doctor (
  DId int NOT NULL,
  Dname varchar(30) DEFAULT NULL,
  Specialization varchar(30) DEFAULT NULL,
  LoginId varchar(10) DEFAULT NULL,
  HId int DEFAULT NULL,
  PRIMARY KEY (DId),
  KEY LoginId (LoginId),
  KEY HId (HId),
  CONSTRAINT doctor_ibfk_1 FOREIGN KEY (LoginId) REFERENCES login (LoginId),
  CONSTRAINT doctor_ibfk_2 FOREIGN KEY (HId) REFERENCES hospital (HId)
);

 CREATE TABLE homequarantined (
  HQId int NOT NULL,
  TName varchar(30) DEFAULT NULL,
  TId int DEFAULT '2',
  PRIMARY KEY (HQId),
  KEY TId (TId),
  CONSTRAINT homequarantined_ibfk_1 FOREIGN KEY (TId) REFERENCES treatment (TId)
);

 CREATE TABLE hospital (
  HId int NOT NULL,
  Hname varchar(20) DEFAULT NULL,
  City varchar(10) DEFAULT NULL,
  Area varchar(20) DEFAULT NULL,
  LoginId varchar(10) DEFAULT NULL,
  PRIMARY KEY (HId),
  KEY LoginId (LoginId),
  CONSTRAINT hospital_ibfk_1 FOREIGN KEY (LoginId) REFERENCES login (LoginId)
);

 CREATE TABLE inpatient (
  PId int NOT NULL,
  AdmissionDate date DEFAULT NULL,
  DischargeDate date DEFAULT NULL,
  PRIMARY KEY (PId)
);

 CREATE TABLE login (
  LoginId varchar(10) NOT NULL,
  Password varchar(10) DEFAULT NULL,
  PRIMARY KEY (LoginId)
);

CREATE TABLE outpatient (
  PId int NOT NULL,
  RegistrationDate date DEFAULT NULL,
  PRIMARY KEY (PId)
);

CREATE TABLE patient (
  PId int NOT NULL,
  PName varchar(30) DEFAULT NULL,
  Age int DEFAULT NULL,
  Gender varchar(5) DEFAULT NULL,
  Type varchar(10) DEFAULT NULL,
  LoginId varchar(10) DEFAULT NULL,
  HId int DEFAULT NULL,
  PRIMARY KEY (PId),
  KEY LoginId (LoginId),
  KEY HId (HId),
  CONSTRAINT patient_ibfk_1 FOREIGN KEY (LoginId) REFERENCES login (LoginId),
  CONSTRAINT patient_ibfk_2 FOREIGN KEY (HId) REFERENCES hospital (HId)
);

 CREATE TABLE public (
  PublicId int NOT NULL,
  LoginId varchar(10) DEFAULT NULL,
  PRIMARY KEY (PublicId),
  KEY LoginId (LoginId),
  CONSTRAINT public_ibfk_1 FOREIGN KEY (LoginId) REFERENCES login (LoginId)
);

CREATE TABLE receives (
  ReceiveId int NOT NULL,
  Description varchar(50) DEFAULT NULL,
  TreatId int DEFAULT NULL,
  PId int DEFAULT NULL,
  PRIMARY KEY (ReceiveId),
  KEY TreatId (TreatId),
  KEY PId (PId),
  CONSTRAINT receives_ibfk_1 FOREIGN KEY (TreatId) REFERENCES treats (TreatId),
  CONSTRAINT receives_ibfk_2 FOREIGN KEY (PId) REFERENCES patient (PId)
);

CREATE TABLE shows (
  ShowId int NOT NULL,
  Severity varchar(20) DEFAULT NULL,
  PId int DEFAULT NULL,
  SId int DEFAULT NULL,
  PRIMARY KEY (ShowId),
  KEY PId (PId),
  KEY SId (SId),
  CONSTRAINT shows_ibfk_1 FOREIGN KEY (PId) REFERENCES patient (PId),
  CONSTRAINT shows_ibfk_2 FOREIGN KEY (SId) REFERENCES symptoms (SId)
);

 CREATE TABLE symptoms (
  SId int NOT NULL,
  SName varchar(20) DEFAULT NULL,
  PRIMARY KEY (SId)
);

CREATE TABLE test (
  TestId int NOT NULL,
  Types varchar(20) DEFAULT NULL,
  Names varchar(20) DEFAULT NULL,
  PRIMARY KEY (TestId)
);

CREATE TABLE took (
  TookId int NOT NULL,
  Result varchar(10) DEFAULT NULL,
  Date date DEFAULT NULL,
  PId int DEFAULT NULL,
  TestId int DEFAULT NULL,
  PRIMARY KEY (TookId),
  KEY PId (PId),
  KEY TestId (TestId),
  CONSTRAINT took_ibfk_1 FOREIGN KEY (PId) REFERENCES patient (PId),
  CONSTRAINT took_ibfk_2 FOREIGN KEY (TestId) REFERENCES test (TestId)
);

CREATE TABLE treatment (
  TId int NOT NULL,
  TName varchar(20) DEFAULT NULL,
  PRIMARY KEY (TId)
);

CREATE TABLE treats (
  TreatId int NOT NULL,
  SId int DEFAULT NULL,
  HQId int DEFAULT NULL,
  HOId int DEFAULT NULL,
  PRIMARY KEY (TreatId),
  KEY HQId (HQId),
  KEY HOId (HOId),
  CONSTRAINT treats_ibfk_1 FOREIGN KEY (HQId) REFERENCES homequarantined (HQId),
  CONSTRAINT treats_ibfk_2 FOREIGN KEY (HOId) REFERENCES hospitalized (HOId)
);

CREATE TABLE treceives (
  TreatId int NOT NULL,
  TId int DEFAULT NULL,
  PRIMARY KEY (TreatId),
  KEY TId (TId),
  CONSTRAINT treceives_ibfk_1 FOREIGN KEY (TId) REFERENCES treatment (TId)
);

 CREATE TABLE update_login (
  action varchar(10) DEFAULT NULL,
  loginid varchar(10) DEFAULT NULL,
  old_password varchar(10) DEFAULT NULL,
  new_password varchar(10) DEFAULT NULL
);

 CREATE TABLE update_login_info (
  action varchar(10) DEFAULT NULL,
  loginid varchar(10) DEFAULT NULL,
  password varchar(10) DEFAULT NULL,
  deleted_time timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
