#include <SoftwareSerial.h>
#include <SPI.h>
#include <Ethernet.h>
#include <Arduino.h>
//#include <string>
//#include <map.h>
#include <string.h>
//#include <string>
// Enter a MAC address for your controller below.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
byte mac[] = {
    0x90, 0xA2, 0xDA, 0x0F, 0x3A, 0xDC};
// if you don't want to use DNS (and reduce your sketch size)
// use the numeric IP instead of the name for the server:
// IPAddress server(74,125,232,128);  // numeric IP for Google (no DNS)
IPAddress server(192, 168, 77, 254); // name address for Google (using DNS)

// Set the static IP address to use if the DHCP fails to assign
IPAddress ip(10, 0, 0, 10);

// Initialize the Ethernet client library
// with the IP address and port of the server
// that you want to connect to (port 80 is default for HTTP):
EthernetClient client;
String payload;
String key;
String value;
unsigned long lastTimePushed = millis();
unsigned long pushDelay = 300000;  //300000 milli seconds = 5 minute
void setup()
{
  Serial.begin(9600);
  Serial.println("Serial Ready");
  delay(100);

  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0)
  {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    // try to congifure using IP address instead of DHCP:
    Ethernet.begin(mac, ip);
    Serial.print("server is at ");
    Serial.println(Ethernet.localIP());
    // Check for Ethernet hardware present
    if (Ethernet.hardwareStatus() == EthernetNoHardware)
    {
      Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
      while (true)
      {
        delay(1); // do nothing, no point running without Ethernet hardware
      }
    }
    if (Ethernet.linkStatus() == LinkOFF)
    {
      Serial.println("Ethernet cable is not connected.");
    }
  }
  else
  {
    Serial.println("Ethernet Connected using DHCP");
    Serial.print("server is at ");
    Serial.println(Ethernet.localIP());
  }
  // give the Ethernet shield a second to initialize:
  delay(1000);
}

void loop()
{
  unsigned long timeNow = millis();
if (timeNow - lastTimePushed > pushDelay){
  lastTimePushed = timeNow;

 // output the value of each analog input pin
  for (int analogChannel = 0; analogChannel < 6; analogChannel++)
  {

    int sensorReading = analogRead(analogChannel);
//     key = std::to_string(analogChannel);
//     value = std::to_string(sensorReading);
//    payload = "sensor:" + key + " value:" + value;
 payload = String("sensor:") + analogChannel + String("value:") + sensorReading;
    if (client.connect(server, 80))
    {
      Serial.println("API Server connected");
      // Make a HTTP request:
      // client.print("GET /rec.php HTTP/1.1\n");
//      client.print("GET /sensor_backend/raw_dump.php?data_a=");
      String link = "GET /sensor_backend/raw_dump.php?data_a=";
        String api_link = link + payload;
        Serial.println(api_link);
      client.print(api_link);
      client.println(" HTTP/1.1");
      client.println("Host: 192.168.77.254");
      client.println("Connection: close");
      client.println();
    }
    else
    {
      // kf you didn't get a connection to the server:
      Serial.println("API server connection failed");
    }

    delay(1000);
  }

}
 
  
}
