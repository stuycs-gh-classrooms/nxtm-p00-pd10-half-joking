class OrbList {

  OrbNode front;

  OrbList() {
    front = null;
  }//constructor

  void addFront(OrbNode o) {
    o.next = front;
    if (front != null) {
      front.previous = o;
    }
    front = o;
  }//addFront

  void populateWithGravity(int n) {
    front = null; // clear the list
    for (int i=0; i<n; i++) {
      OrbNode o = new OrbNode();
      if (random(1) > 0.5) { // decides whether the orb has gravity
        o.gravityPresent = true;
      }
      addFront(o);
    }
  }//populate

  void display() {
    OrbNode current = front;
    while (current != null) {
      current.display();
      current = current.next; // display the next node
    }
  }//display

  void applySprings(int springLength, float springK) {
    OrbNode current = front;
    while (current != null) {
      current.applySprings (springLength, springK);
      current = current.next; // apply to the next node
    }
  }//applySprings

  void applyGravity(Orb other, float G) {
    OrbNode current = front;
    while (current != null) {
      PVector gravityForce = current.getGravity(other, G); // gravitational force applied on one orb by another orb
      current.applyForce(gravityForce);
      current = current.next;
    }
  }//applySprings

  void run(boolean bounce) {
    OrbNode current = front;
    while (current != null) {
      current.move(bounce); // move the orb (bounce if necessary)
      current = current.next; // move the next orb
    }
  }//applySprings

  void applyDragForce() {
    OrbNode current = front;
    while (current != null) {
      if (current.center.x < width / 2) {
        current.applyForce(current.getDragForce(0.2)); // high drag force on the left
      } else {
        current.applyForce(current.getDragForce(0.05)); // low drag force on the right
      }
      current = current.next;
    }
  }

  void applyMagneticForce() {
    OrbNode current = front;
    OrbNode other = front;
    while (current != null) {
      while (other != null) {
        if (current != other) {
          current.applyMagneticForce(other);//orb nodes inherits function from orb class
        }
        other = other.next;
      }
      current = current.next;
    }
  }

  /*===========================
   removeFront()
   
   Remove the element at the front of the list, i.e.
   after this method is run, the former second element
   should now be the first (and so on).
   =========================*/
  void removeFront() {
    if (front != null) {
      front = front.next;
      if (front != null) {
        front.previous = null;
      }
    }
  }//removeFront
}
