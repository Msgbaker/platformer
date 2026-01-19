class FGameObject extends FBox {
  int lives;
  FGameObject() {
    super(gridsize,gridsize);
  }
  FGameObject(int hp){
    super(gridsize,gridsize);
    lives=hp; 
  }
  //FGameObject(int f) {
  //  super(gridsize, gridsize);
  //  frames=f;
  //}
  void act() {
  }
  boolean isTouching(String name) {
    ArrayList<FContact> contact=getContacts();
    for (int i=0; i<contact.size(); i++) {
      FContact c=contact.get(i);
      if (c.contains(name)) return true;
    }
    return false;
  }
}
