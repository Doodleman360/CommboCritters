class Critter {
  int stars;
  String name = "vg_close";
  int health;
  int attack;
  PImage img;
  Critter(String[] data) {
    stars = int(data[0]);
    if (!data[1].equals("??")) {
      name = data[1];
    }
    health = int(data[2]);
    attack = int(data[3]);
    img = loadImage(this.name.toLowerCase() + ".png");
    //img.resize(50, 50);
  }
}