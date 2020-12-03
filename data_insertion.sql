INSERT INTO Staff VALUES ('ST000', 'Daniel Allen', '3 Aspen Drive', 50000, '(278) 975-3610');
INSERT INTO Staff VALUES ('ST001', 'Lexi Evans', '999 Wintergreen Dr.', 80000, '(682) 960-0148');
INSERT INTO Staff VALUES ('ST002', 'Tom Campbell', '550 Hawthorne St.', 50000, '(841) 544-6055');
INSERT INTO Staff VALUES ('ST003', 'Clara Mathis', '330 Hillcrest St.', 40000, '(887) 268-9573');
INSERT INTO STaff VALUES ('ST004', 'Josh Mills', '92 S. Glenlake St.', 70000, '(663) 555-3712');

INSERT INTO Client VALUES ('CL000', 'Charlie Phillip', '7357 William St.', '(958) 272-4984');
INSERT INTO Client VALUES ('CL001', 'Redmond Company', '9503 Catherine Rd.', '(880) 616-0011');
INSERT INTO Client VALUES ('CL002', 'Jordan Cole', '8303 Nicolls Rd.', '(884) 753-3624');
INSERT INTO Client VALUES ('CL003', 'Reddify Co.', '60 Briarwood Rd.', '(445) 224-3663');
INSERT INTO Client VALUES ('CL004', 'Empress Apples', '8629 Acacia Ave.', '(277) 964-5666');

INSERT INTO Appointment VALUES('AP000', 'CL000', TIMESTAMP '2020-12-20 08:00:00', 120);
INSERT INTO Appointment VALUES('AP001', 'CL000', TIMESTAMP '2020-12-20  10:00:00', 180);
INSERT INTO Appointment VALUES ('AP002', 'CL001', TIMESTAMP '2021-01-02 16:00:00', 60);
INSERT INTO Appointment VALUES('AP003', 'CL003', TIMESTAMP '2020-12-22 09:00:00', 240);
INSERT INTO Appointment VALUES('AP004', 'CL003', TIMESTAMP '2021-01-04  12:00:00', 120);

INSERT INTO StaffBooking VALUES('AP000', 'ST000');
INSERT INTO StaffBooking VALUES('AP000', 'ST003');
INSERT INTO StaffBooking VALUES('AP001', 'ST001');
INSERT INTO StaffBooking VALUES('AP001', 'ST002');
INSERT INTO StaffBooking VALUES('AP001', 'ST003');
INSERT INTO StaffBooking VALUES('AP002', 'ST004');
INSERT INTO StaffBooking VALUES('AP003', 'ST000');
INSERT INTO StaffBooking VALUES('AP003', 'ST002');
INSERT INTO StaffBooking VALUES('AP003', 'ST003');
INSERT INTO StaffBooking VALUES('AP003', 'ST004');
INSERT INTO StaffBooking VALUES('AP004', 'ST000');
INSERT INTO StaffBooking VALUES('AP004', 'ST001');


INSERT INTO Equipment VALUES('EQ000', 'Mop', 'Used to clean tile floor', 10);
INSERT INTO Equipment VALUES('EQ001', 'Industrial Floor Cleaner', 'Needed to clean extremely dirty floors',	100);
INSERT INTO Equipment VALUES('EQ002', 'Vacuum',	'Used to clean carpet', 30);
INSERT INTO Equipment VALUES('EQ003', 'Carpet Extractor', 'Used to clean tough stains out of carpet', 90);
INSERT INTO Equipment VALUES('EQ004', 'Pressure Washer','Used to pressure wash', 70);

INSERT INTO EquipmentDeployment VALUES ('AP000', 'EQ001', 2);
INSERT INTO EquipmentDeployment VALUES ('AP000', 'EQ003', 1);
INSERT INTO EquipmentDeployment VALUES ('AP002', 'EQ002', 4);
INSERT INTO EquipmentDeployment VALUES ('AP003', 'EQ004', 1);
INSERT INTO EquipmentDeployment VALUES ('AP003', 'EQ003', 2);