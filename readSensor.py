import serial
import sys

ser = serial.Serial('/dev/ttyUSB1')
print(ser.name)

logfile = open("result.txt", "w")

for x in xrange(0,101):
	line = ser.readline()
	print(str(x+1) + ': ')
	sys.stdout.write(line)
	if (x>0):
		logfile.write(line)

logfile.close()
ser.close()
