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
boolean[] toggles = new boolean[4];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag"};

float highDrag = 0.3; // high drag coefficient
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

  if (toggles[DRAGF]) { // if 3 is pressed
    fill(#D8A3FC);
    rect(0, 0, width/2, height); // left half
    fill(#FCA3DC);
    rect(width/2, 0, width/2, height); // right half
    displayMode();
  }

  slinky.display();

  if (toggles[MOVING]) {

    slinky.applySprings(SPRING_LENGTH, SPRING_K);

    if (toggles[GRAVITY]) {
      slinky.applyGravity(earth, GRAVITY);
    }
    slinky.run(toggles[BOUNCE]);
    applyDrag();
  }//moving
}


void keyPressed() {
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == '1') {
    toggles[GRAVITY] = !toggles[GRAVITY];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];
  }
  if (key == '3') {
    toggles[DRAGF] = !toggles[DRAGF];
    toggles[GRAVITY] = false; // gravity is off when drag is active
  }
  //  if (key == '1') {
  //    slinky.populateWithGravity(NUM_ORBS);
  //  }
  if (key == '2') {
    slinky.applySprings(SPRING_LENGTH, SPRING_K);
  }
  // if (key == '3') {
  //   toggles[DRAGF] = !toggles[DRAGF];
  // }
  if (key == '4') {
    slinky.applyMagneticForce();
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
    } else {
      current.applyForce(current.getDragForce(lowDrag));
    }
    current = current.next;
  }
}
