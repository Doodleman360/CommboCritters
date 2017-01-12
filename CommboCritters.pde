ArrayList<Critter> CList = new ArrayList<Critter>();
String[] data;

void setup() {
  size(450, 450);
  background(0);
  stroke(255);
  textAlign(CENTER, TOP);
  frameRate(1);

  data = loadStrings("Data.txt");
  for (String i : data) {
    CList.add(new Critter(split(i, ',')));
    //println(i);
  }
}
int i = 0;
void draw() {
  background(0);
  int y = 0;
  int x = 0;
  for (Critter tempC : CList) {
    image(tempC.img, x, y);
    x+=50;
    if (x > width-50) {
      y+=50;
      x = 0;
    }
  }
}

void mousePressed() {
  int x = mouseX/(width/9);
  int y = mouseY/(height/9);
  println("\nname: " + CList.get(x + (y*9)).name + "\nstars: " + CList.get(x + (y*9)).stars + "\nattack: " + CList.get(x + (y*9)).attack + "\nhealth: " + CList.get(x + (y*9)).health);
}