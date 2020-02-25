#include <Keypad.h>

const byte ROWS = 8;
const byte COLS = 4;


char hexaKeys[ROWS][COLS] = {
  {'P', 'L', 'H', 'D'},
  {'O', 'K', 'G', 'C'},
  {'N', 'J', 'F', 'B'},
  {'M', 'I', 'E', 'A'},
  {'m', 'i', 'e', 'a'},
  {'n', 'j', 'f', 'b'},
  {'o', 'k', 'g', 'c'},
  {'p', 'l', 'h', 'd'},
};

byte rowPins[ROWS] = {13, 12, 11, 10, 9, 8, 7, 6};
byte colPins[COLS] = {2, 3, 4, 5};



Keypad customKeypad = Keypad(makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS);

void setup() {
  Serial.begin(9600);
  customKeypad.setHoldTime(100);

  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);

  //  pinMode(2, INPUT);
  //  pinMode(3, INPUT);
  //  pinMode(4, INPUT);
  //  pinMode(5, INPUT);
  //    pinMode(6, INPUT);
  //    pinMode(7, INPUT);
  //    pinMode(8, INPUT);
  //    pinMode(9, INPUT);
  //    pinMode(10, INPUT);
  //    pinMode(11, INPUT);
  //    pinMode(12, INPUT);
  //    pinMode(13, INPUT);
}

void loop() {
  char customKey = customKeypad.getKey();

  if (customKey) {
    Serial.println(customKey);
  }
}
