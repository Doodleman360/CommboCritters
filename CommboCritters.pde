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

  //int[] max = new int[4];

  //for (String i : dataList) {
  //  String[] t = split(i, ',');

  //  for (int j = 0; j < t.length; j++) {
  //    if (t[j].length() > max[j]) {
  //      max[j] = t[j].length();
  //    }
  //  }
  //}

  //int Ttot = 0;

  //for (int i = 0; i < max.length; i++) {
  //  Ttot += max[i];
  //  line(Ttot*7, 0, Ttot*7, height);
  //}

  //println(max);

  //for (String i : dataList) {
  //  String[] t = split(i, ',');

  //  Ttot = 0;
  //  for (int j = 0; j < t.length; j++) {
  //    Ttot += max[j];
  //    //println(Ttot);
  //    //println((Ttot*7) - max[j]);
  //    text(t[j], (Ttot*7) - max[j], dataList.indexOf(i)*15);
  //  }
  //  line(0, dataList.indexOf(i)*15+15, width, dataList.indexOf(i)*15+15);
  //}
  //image(imageTest,0,0);
  //noLoop();
}

void mousePressed() {
  int x = mouseX/(width/9);
  int y = mouseY/(height/9);
  println(CList.get(x + (y*9)).name);
}