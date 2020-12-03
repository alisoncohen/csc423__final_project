CREATE TABLE Staff(
    staffNo varChar(5) NOT NULL, 
    name varChar(15) NOT NULL, 
    address varChar(30), 
    salary int NOT NULL, 
    telephoneNo varChar(15),
    PRIMARY KEY(staffNo)
);

CREATE TABLE Client(
    clientNo varChar(5) NOT NULL, 
    name varChar(15) NOT NULL,
    address varChar(30) NOT NULL, 
    telephoneNo varChar(15) NOT NULL,
    PRIMARY KEY(clientNo)
);

CREATE TABLE Appointment(
    appointmentNo varChar(5) NOT NULL, 
    clientNo varChar(5) NOT NULL,
    startsAt timestamp NOT NULL,
    duration int
        CONSTRAINT validDuration
        CHECK (duration >= 60),
    PRIMARY KEY(appointmentNo),
    FOREIGN KEY(clientNo) REFERENCES Client(clientNo) ON DELETE CASCADE
);

CREATE TABLE StaffBooking(
    appointmentNo varChar(5) NOT NULL,
    staffNo varChar(5) NOT NULL, 
    PRIMARY KEY(staffNo, appointmentNo),
    FOREIGN KEY(appointmentNo) REFERENCES Appointment(appointmentNo) ON DELETE CASCADE,
    FOREIGN KEY(staffNo) REFERENCES Staff(staffNo) ON DELETE SET NULL
);

CREATE TABLE Equipment(
    equipmentNo varchar(5) NOT NULL, 
    equipmentName varchar(15) NOT NULL, 
    description varchar(300), 
    cost int NOT NULL
        CONSTRAINT validCost
        CHECK(cost<=100 AND cost>=10),
    PRIMARY KEY(equipmentNo)
);

CREATE TABLE EquipmentDeployment(
    appointmentNo varChar(5) NOT NULL, 
    equipmentNo varChar(5) NOT NULL, 
    numberNeeded int
        CONSTRAINT validNumberNeeded
        CHECK(numberNeeded >=1),
    PRIMARY KEY(appointmentNo, equipmentNo),
    FOREIGN KEY(appointmentNo) REFERENCES appointment(appointmentNo) ON DELETE CASCADE,
    FOREIGN KEY(equipmentNo) REFERENCES Equipment(equipmentNo) ON DELETE CASCADE
);