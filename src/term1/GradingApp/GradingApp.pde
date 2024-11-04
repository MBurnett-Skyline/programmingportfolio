// Matilda Burnett | Grading App | 13 Sept. 2024

void setup() {
size(400,150);
background(130);
}

void draw() {
  //Title Info
  background(130);
  textAlign(CENTER);
  fill(102,66,0);
  text("Grades: by Matilda Burnett",width/2,40);
  
  //Reference Line
  strokeWeight(2);
  stroke(102,66,0);
  line(0,100,width,100);
  
  //Tic Marks
  for(int i=0; i<width; i+=50) {
    line(i,95,i,105);
    text((float)i/width*4,i,115);
  }
  
  //Marker
  ellipse(mouseX,100,4,4);
  textSize(10);
  text((float)mouseX/width*4,mouseX,90);
  
  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A.",width/2,135);
  } else if (tgrade >= 3.0) {
    text ("Assign letter grade A-.",width/2,135);
  } else if (tgrade >= 2.84) {
    text ("Assign letter grade B+.",width/2,135);
  } else if (tgrade >= 2.67) {
    text ("Assign letter grade B.",width/2,135);
  } else if (tgrade >= 2.5) {
    text ("Assign letter grade B-.",width/2,135);
  } else if (tgrade >= 2.34) {
    text ("Assign letter grade C+.",width/2,135);
  } else if (tgrade >= 2.17) {
    text ("Assign letter grade C.",width/2,135);
  } else if (tgrade >= 2.0) {
    text ("Assign letter grade C-.",width/2,135);
  } else if (tgrade >= 1.66) {
    text ("Assign letter grade D+.",width/2,135);
  } else if (tgrade >= 1.33) {
    text ("Assign letter grade D.",width/2,135);
  } else if (tgrade >= 1.00) {
    text ("Assign letter grade D-.",width/2,135);
  } else {
    text ("Assign letter grade F.",width/2,135);
  }
}
