ArrayList<Critter> CList = new ArrayList<Critter>();
String[] data;
/*
 -1 = all
 # = data page
 */
int mode = -1;

void setup() {
  size(450, 450);
  background(0);
  stroke(255);
  textAlign(CENTER, TOP);

  data = loadStrings("Data.txt");
  for (String i : data) {
    String[] SData = split(i, ',');
    CList.add(new Critter(SData));
  }
  for (int i = 0; i > data.length; i++) {
    String[] SData = split(data[i], ',');
    for (int j = 4; j > SData.length; j++) {
      println("adding a combo to " + CList.get(i).name + "\nThe combo is " + split(SData[j], '+')[0] + " and " + split(SData[j], '+')[1]);
      Critter[] CArray = new Critter[2];
      for (Critter c : CList) {
        if (c.name.equals(split(SData[j], '+')[0])) {
          CArray[0] = c;
        }
        if (c.name.equals(split(SData[j], '+')[1])) {
          CArray[1] = c;
        }
      }

      CList.get(i).addCritterToCombo(CArray);
    }
  }
}

void draw() {
  if (mode == -1) {
    drawAll();
  } else {
    drawData();
  }
}

void mousePressed() {
  if (mode == -1) {
    int x = mouseX/(width/9);
    int y = mouseY/(height/9);
    println("\nname: " + CList.get(x + (y*9)).name + "\nstars: " + CList.get(x + (y*9)).stars + "\nattack: " + CList.get(x + (y*9)).attack + "\nhealth: " + CList.get(x + (y*9)).health);
    println(CList.get(x + (y*9)).combo.isEmpty());
    mode = (x + (y*9));
  } else {
    if (mouseX < 30 && mouseY < 30) {
      mode = -1;
    }
  }
}

void drawAll() {
  imageMode(CORNER);
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

void drawData() {
  background(0);
  PImage back = loadImage("buttonback.png");
  back.resize(30, 30);
  image(back, 0, 0);
  PImage img = CList.get(mode).img.copy();
  image(img, width/2-(img.width/2), 0);
  text("name: " + CList.get(mode).name, width/2, 50);
  text("stars: " + CList.get(mode).stars, width/2, 65);
  text("attack: " + CList.get(mode).attack, width/2, 80);
  text("health: " + CList.get(mode).health, width/2, 95);
  text("combos: ", width/2, 110);
  for (Critter[] tempC : CList.get(mode).combo) {
    image(tempC[0].img, width/2, 130);
  }
}