CREATE TABLE Genders(
  Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255),
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)

)
ENGINE =  INNODB;



CREATE TABLE OrderStatus(
Id int NOT NULL AUTO_INCREMENT,
Name varchar(255),
Created DATETIME,
Updated DATETIME,
PRIMARY KEY (Id)
)ENGINE = INNODB;

CREATE TABLE Roles(
  Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255),
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)

)ENGINE = INNODB;


CREATE TABLE Outlets(
  Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255),
  Address TEXT,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)

)ENGINE = INNODB;

CREATE TABLE Factories(
  Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255),
  Address TEXT,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)

)ENGINE = INNODB;

CREATE TABLE Logins(
  Id int NOT NULL AUTO_INCREMENT,
  Username varchar(255) NOT NULL UNIQUE,
  Password varchar(255),
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)
)ENGINE = INNODB;


CREATE TABLE Users(
  Id int NOT NULL AUTO_INCREMENT,
  FirstName varchar(255),
  LastName varchar(255),
  Email varchar(255) NOT NULL UNIQUE,
  Sex int NOT NULL,
  Phonenumber varchar(255) NOT NULL UNIQUE,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id),
  FOREIGN KEY (Sex) REFERENCES Genders(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
)ENGINE = INNODB;


CREATE TABLE UserRoles(
  Id int NOT NULL AUTO_INCREMENT,
  RoleId int NOT NULL,
  UserId int NOT NULL,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id),
  FOREIGN KEY (RoleId) REFERENCES Roles(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (UserId) REFERENCES Users(Id)
)ENGINE = INNODB;





CREATE TABLE Payments(
  Id int NOT NULL AUTO_INCREMENT,
  CustomerId int NOT NULL,
  OrderId int NOT NULL,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id)
  FOREIGN KEY (CustomerId) REFERENCES Users(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (OrderId) REFERENCES Orders(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,

)ENGINE = INNODB;


CREATE TABLE Exspenses(
Id int NOT NULL AUTO_INCREMENT,
Name varchar(255),
Created DATETIME,
Updated DATETIME,
PRIMARY KEY (Id)
)ENGINE = INNODB;


CREATE TABLE Books(
Id int NOT NULL AUTO_INCREMENT,
Name varchar(255),
Debit tinyint(1)  ,
Credit tinyint(1),
OwnerId int NOT NULL,
Created DATETIME,
Updated DATETIME,
PRIMARY KEY (Id),
FOREIGN KEY (OwnerId) REFERENCES Users(Id)
ON DELETE SET NULL
ON UPDATE CASCADE,
)ENGINE = INNODB;


CREATE TABLE OutletUsers(
Id int NOT NULL AUTO_INCREMENT,
OutletId int NOT NULL,
UserId int NOT NULL,
Created DATETIME,
Updated DATETIME,
PRIMARY KEY (Id),
FOREIGN KEY (UserId) REFERENCES Users(Id)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (OutletId) REFERENCES Outlets(Id)
ON DELETE SET NULL
ON UPDATE CASCADE

)ENGINE = INNODB;




CREATE TABLE Orders(
  Id int NOT NULL AUTO_INCREMENT,
  Recived DATE,
  RecivedBy int NOT NULL,
  CustomerId int NOT NULL,
  CompletionDate DATE,
  Status int NOT NULL,
  Amount DECIMAL,
  Description TEXT,
  PickupLocation varchar(255),
  OutletId int NOT NULL,
  FactoryId int NOT NULL,
  Created DATETIME,
  Updated DATETIME,
  PRIMARY KEY (Id),
  FOREIGN KEY (RecivedBy) REFERENCES Users(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (CustomerId) REFERENCES Users(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (Status) REFERENCES OrderStatus(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (OutletId) REFERENCES Outlets(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
  FOREIGN KEY (FactoryId) REFERENCES Factories(Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE
)ENGINE = INNODB;