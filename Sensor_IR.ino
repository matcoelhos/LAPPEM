
// These constants won't change.  They're used to give names
// to the pins used:
const int S1 = 0;
const int S2 = 1;
int sensorValue = 0;
int IR_pin = 3;
int R_pin = 5;
int G_pin = 6;
int B_pin = 9;

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
  pinMode(IR_pin, OUTPUT); 
}

void loop() {
  // read the analog in value:
  
  sensorValue = (analogRead(S1) + analogRead(S2))/2;                  
  Serial.print(sensorValue);
  Serial.print("\t");
  
  analogWrite(IR_pin, 255);
  delay(100);
  sensorValue = (analogRead(S1) + analogRead(S2))/2; 
  Serial.print(sensorValue);
  Serial.print("\t");
  analogWrite(IR_pin, 0);
  delay(100);
  
  analogWrite(R_pin, 100);
  delay(100);
  sensorValue = (analogRead(S1) + analogRead(S2))/2;
  Serial.print(sensorValue);
  Serial.print("\t");
  analogWrite(R_pin, 0);
  delay(100);
  
  analogWrite(G_pin, 100);
  delay(100);
  sensorValue = (analogRead(S1) + analogRead(S2))/2;
  Serial.print(sensorValue);
  Serial.print("\t");
  analogWrite(G_pin, 0);
  delay(100);
  
  analogWrite(B_pin, 100);
  delay(100);
  sensorValue = (analogRead(S1) + analogRead(S2))/2;
  Serial.print(sensorValue);
  Serial.print("\t");
  analogWrite(B_pin, 0);
  delay(100);
  
  // print the results to the serial monitor:
  Serial.println();   

  // wait 2 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(100);                     
}
