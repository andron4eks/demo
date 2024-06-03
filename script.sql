USE demo;

CREATE TABLE Requests (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Number VARCHAR(50) NOT NULL,
    DateAdded DATETIME NOT NULL,
    CarType VARCHAR(50) NOT NULL,
    CarModel VARCHAR(50) NOT NULL,
    ProblemDescription VARCHAR(200) NOT NULL,
    ClientFIO VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Status VARCHAR(50) NOT NULL
);

CREATE TABLE Mechanics (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FIO VARCHAR(100) NOT NULL,
    Login VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL
);

CREATE TABLE RequestMechanics (
    RequestId INT NOT NULL,
    MechanicId INT NOT NULL,
    PRIMARY KEY (RequestId, MechanicId),
    FOREIGN KEY (RequestId) REFERENCES Requests(Id),
    FOREIGN KEY (MechanicId) REFERENCES Mechanics(Id)
);

CREATE TABLE Comments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    RequestId INT NOT NULL,
    Text VARCHAR(200) NOT NULL,
    DateAdded DATETIME NOT NULL,
    FOREIGN KEY (RequestId) REFERENCES Requests(Id)
);

CREATE TABLE SpareParts (
    Id INT PRIMARY KEY IDENTITY(1,1),
    RequestId INT NOT NULL,
    PartName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    DateAdded DATETIME NOT NULL,
    FOREIGN KEY (RequestId) REFERENCES Requests(Id)
);