void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();

  histEvent(150, 200, "ENIAC", "1945 | Designed by John Mauchly and J. Presper Eckert | University of Pennsylvania \n First programmable, electric, general purpose digital computer. \n Originally designed to calculate artillery firing tables for the United States Army's Ballistic Research Laboratory. \n First program was a study of the feasibility of the thermonuclear weapon.", true);
  histEvent(225, 300, "SSEM", "1948 | Designed by Frederic C. Williams, Tom Kilburn and Geoff Tootill | University of Manchester \n Also known as 'The Manchester Baby'. First electronic stored-program computer. \n Designed as a testbed for the Williams tube, the first truly random-access memory.", false);
  histEvent(300, 200, "Ferranti Mark 1", "1951 | Designed by Ferranti | University of Manchester \n First commercial computer. Based on the Manchester Mark 1 with the intent of general improvements. \n The Manchester Mark 1 was based on SSEM with the intent of general improvements, \n so it provides a similar, but substantially improved memory fuction as the SSEM.", true);
  histEvent(375, 300, "Gamma 3", "1952 | Designed by Compagnie des Machines Bull | Europe \n First computer produced in more than 1,000 units. \n Included innovative features for its time, such as a dual-mode, software switchable, BCD and binary ALU, \n as well as a hardwired floating-point library for scientific computing.", false);
  histEvent(450, 200, "IBM 650", "1954 | Designed by IBM (Interntional Business Machines Corporation) | Commercially produced across the world \n Most popular computer of the 1950s due to its improved memory, cheaper price, and smaller size.", true);
  histEvent(525, 300, "CADET", "1955 | Designed by the electronics division of the Atomic Energy Research Establishment at Harwell | ", false);
  histEvent(600, 200, "Button7", "Detail7", true);
  histEvent(675, 300, "Button8", "Detail8", false);
}

void drawRef() {

  // Timeline Format
  strokeWeight(3);
  stroke(255);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 90, 260);
  text("1960", 810, 260);

  // Title
  fill(255);
  textSize(35);
  textAlign(CENTER, CENTER);
  text("History Computer Systems", width/2, 60);
  textSize(25);
  text("by Mat Burnett", width/2, 90);
}

void histEvent(int x, int y, String title, String detail, boolean top) {

  // Information neeeded for entry description: Year, Creator, Location, Purpose
  //String detail

  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }

  rectMode(CENTER);
  fill(60, 39, 7);
  rect(x, y, 140, 20, 10);
  fill(255);
  textSize(20);
  text(title, x, y);
  textSize(14);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
