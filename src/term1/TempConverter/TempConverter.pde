// Matilda Burnett | Temp Converter | 23 Sept. 2024

void setup() {
  size(400,200);
}

void draw() {
  //Title Info
  background(123);
  text("Temperature Conversion: by Matilda Burnett",width/2,40);
  
  // Line Setup
  line(0,150,width,150);
  
  // Tic Marks
  for(int i=0; i<width + 1; i+=50) {
    line(i,155,i,145);
    textAlign(CENTER);
    text(i-200,i,165);
  }
  
  // Conversion Message
  text("Cel: " + farToCel(mouseX - 200), width/2, height/2);
  text ("Far: " + celToFar(farToCel(mouseX - 200)), width/2, 90);

}

// Fahrenheit Conversion
float farToCel(float tempFar) {
  //formula to calc cel conv
  tempFar = (tempFar - 32) * (5.0/9.0);
  return tempFar;
}

// Celsius Conversion
float celToFar(float tempCel) {
  //formula to calc far conv
  tempCel = (tempCel * (9.0/5.0)) + 32;
  return tempCel;
}
