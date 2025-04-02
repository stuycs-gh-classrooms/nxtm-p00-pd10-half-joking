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
    float fieldSize = max(magneticField * 10, bsize + 10); // magnetic field must be larger than the radius of the orb
    if (magneticField > 0) {
      stroke(#8FE6FC); // to show magnetic field
      noFill();
      ellipse(center.x, center.y, fieldSize, fieldSize); // gravity area
    }//next spring
  }

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
