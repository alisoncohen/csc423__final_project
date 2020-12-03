import cx_Oracle
import pandas as pd
import os

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "./instantclient_19_8")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu

def connect():
  connection = cx_Oracle.connect("alcocsc423", os.environ['CSC423_PWD'], "lawtech.law.miami.edu/CSC_423") 
  return connection

def print_table(cursor):
  # get column names from cursor
  columns = [c[0] for c in cursor.description]
  # fetch data
  data = cursor.fetchall()
  # bring data into a pandas dataframe for easy data transformation
  df = pd.DataFrame(data, columns = columns)
  print(df) # examine
  print(df.columns)
  # print(df['FIRST_NAME']) # example to extract a col  umn

# calculates a view of all of the appointments including the client name, client address, 
#start time/date and duration
def appointment_log(connection):
  cursor = connection.cursor()
  cursor.execute("""
    SELECT c.name, c.address, a.startsAt, a.duration
    FROM Client c, Appointment a
    WHERE c.clientNo = a.clientNo
    ORDER BY a.startsAt
    """)
  return cursor

# shows a view of the employee schedule including the staff name, start time/date, 
# and client name and address
def employee_schedule(connection):
  cursor = connection.cursor()
  cursor.execute("""
    SELECT s.name staffName,  a.startsAt, c.name clientName, c.address
    FROM Staff s, Appointment a, StaffBooking b, Client c
    WHERE s.staffNo = b.staffNo AND b.appointmentNo = a.appointmentNo AND c.clientNo = a.clientNo
    """)
  return cursor

# shows a view of the equipment schedule including the appointment number, client name, 
# start time/date and equipment name and cost
def equipment_schedule(connection):
  cursor = connection.cursor()
  cursor.execute("""
    SELECT a.appointmentNo, c.name clientName, a.startsAt, e.equipmentName, e.cost
    FROM Appointment a, Client c, Equipment e, EquipmentDeployment ed
    WHERE a.appointmentNo = ed.appointmentNo AND ed.equipmentNo = e.equipmentNo AND a.clientNo = c.clientNo

    """)
  return cursor

# calculates the number of bookings each employee is currently booked for
def num_bookings_per_employee(connection):
  cursor = connection.cursor()
  cursor.execute("""
    SELECT sb.staffNo, s.name, COUNT(*) AS numBookings
    FROM StaffBooking sb, staff s
    WHERE sb.staffNo = s.staffNo
    GROUP BY sb.staffNo, s.name
    """)
  return cursor


# calculates the appointment cost based upon $1/minute for the appointment duration 
# and a rate of 1/4 the market cost (stored in the equipment table as cost) of the 
# equipment used (if relevant)
def appointment_cost(connection):
  cursor = connection.cursor()
  cursor.execute("""
    SELECT a.appointmentNo, c.name clientName, 
      CASE WHEN SUM(e.cost) IS NULL
      THEN a.duration 
      ELSE a.duration + SUM(e.cost*ed.numberNeeded)/4 END
      AS appointmentCost
    FROM Client c 
      INNER JOIN Appointment a
      ON a.clientNo = c.clientNo
      LEFT JOIN EquipmentDeployment ed
      ON a.appointmentNo = ed.appointmentNo
      LEFT JOIN equipment e
      ON ed.equipmentNo = e.equipmentNo
    GROUP BY a.appointmentNo, c.name, a.duration
    """)
  return cursor

connection = connect()

print('\nAppointment Log\n')
print_table(appointment_log(connection))

print('\nEmployee Schedule\n')
print_table(employee_schedule(connection))

print('\nEquipment Schedule\n')
print_table(equipment_schedule(connection))

print('\nNumber of bookings Per Employee\n')
print_table(num_bookings_per_employee(connection))

print('\nAppointment Cost\n')
print_table(appointment_cost(connection))




