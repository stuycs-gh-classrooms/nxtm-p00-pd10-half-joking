class OrbNode extends Orb {

  OrbNode next;
  OrbNode previous;
  boolean gravityPresent;

  OrbNode() {
    next = previous = null;
    gravityPresent = false;
  }//default constructor
  
  OrbNode(float x, float y, float s, float m) {
    super(x, y, s, m);
    next = previous = null;
    gravityPresent = false;
  }//constructor

  void display() {
    super.display();
    if (gravityPresent) {
      stroke(0,255,0); // green when gravity is active
      noFill();
      ellipse(center.x, center.y, 50, 50); // gravity area
    }//next spring
  }//drawSpring

  void applySprings(int springLength, float springK) {
    if (next != null) {
      PVector sforce = getSpring(next, springLength, springK);
      applyForce(sforce);
    }
    if (previous != null) {
      PVector sforce = getSpring(previous, springLength, springK);
      applyForce(sforce);
    }
  }///applySprings
}//OrbNode
