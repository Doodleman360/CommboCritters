class Critter {
  int stars;
  String name = "vg_close";
  int health;
  int attack;
  PImage img;
  ArrayList<Critter[]> combo = new ArrayList<Critter[]>();
  
  Critter(String[] data) {
    stars = int(data[0]);
    if (!data[1].equals("??")) {
      name = data[1];
    }
    health = int(data[2]);
    attack = int(data[3]);
    img = loadImage(this.name.toLowerCase() + ".png");
    if(name.equals("vg_close"))
    img.resize(42, 42);
  }
  
  void addCritterToCombo(Critter[] CC) {
    combo.add(CC);
  }
}