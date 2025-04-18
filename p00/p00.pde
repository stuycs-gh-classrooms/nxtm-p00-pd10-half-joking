int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int MAGNETISM = 4;
int SPRING = 5;
int COLLISION = 6;
boolean[] toggles = new boolean[7];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "MagneticF", "SpringF", "Collision"};

float highDrag = 0.3; // high drag coefficient
float mediumDrag = 0.2; // medium drag coefficient
float lowDrag = 0.05; // low drag coefficient

FixedOrb earth;


OrbList slinky;

void setup() {
  size(600, 600);
  earth = new FixedOrb(width/2, height * 200, 1, 20000);
  slinky = new OrbList();
  slinky.populateWithGravity(NUM_ORBS);
}//setup

void draw() {
  background(255);
  displayMode(); // display the toggle states
  if (toggles[DRAGF]) { // if 3 is pressed
    fill(#A5F5FF);
    rect(0, 0, width, height / 3); // top section (high drag)
    fill(#A5FFBF);
    rect(0, height / 3, width, height / 3); // middle section (medium drag)
    fill (#EEFAA4);
    rect(0, 2 * height / 3, width, height / 3);
    displayMode(); // display the toggle states
  }
  displayMode(); // display the toggle states

  if (toggles[GRAVITY]) {
    slinky.applyGravity(earth, GRAVITY); // apply gravity to the orbs
  }
  if (toggles[MOVING]) {
    if (toggles[DRAGF]) {
      applyDrag();
    }

    if (toggles[GRAVITY]) {
      slinky.applyGravity(earth, GRAVITY);
    }
       if (toggles[MAGNETISM]) {
      slinky.applyMagneticForce();
      //println("Magnetism: ON");
    }
    if (toggles[SPRING]) {
        slinky.applySprings(SPRING_LENGTH, SPRING_K);
    }
    

    slinky.run(toggles[BOUNCE]);
  }
  slinky.display();
}


void keyPressed() {
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];
  }
  if (key == '1') {
    toggles[GRAVITY] = !toggles[GRAVITY];
    //toggles[DRAGF] = false;
    println("egg");
  }
  if (key == '2') {
    toggles[SPRING] = !toggles[SPRING];

    //slinky.applySpringForce();
  }
  
  if (key == '3') {
    toggles[DRAGF] = !toggles[DRAGF];
    //toggles[GRAVITY] = false; // gravity is off when drag is active
  }
  if (key == '4') {
    toggles[MAGNETISM] = !toggles[MAGNETISM];
    slinky.applyMagneticForce();
  }
   if (key == '5') {
    toggles[COLLISION] = !toggles[COLLISION];
    slinky.applyCollision();
  }
  if (key == 'r') {
    slinky = new OrbList();
  slinky.populateWithGravity(NUM_ORBS);
  }
}//keyPressed


void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}

void applyDrag() {
  OrbNode current = slinky.front;
  while (current != null) {
    if (current.center.x < width/2) {
      current.applyForce(current.getDragForce(highDrag)); // if orb is on the left side, apply high drag force
    } else if (current.center.y >= height / 3 && current.center.y < 2 * height / 3) {
      current.applyForce(current.getDragForce(mediumDrag));
    } else {
      current.applyForce(current.getDragForce(lowDrag));
    }
    current = current.next;
  }
}
