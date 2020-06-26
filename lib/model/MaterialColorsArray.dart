import 'dart:math';

class MaterialColorsArray{


static final red  = 0xffe51c23;
static final pink  = 0xffe91e63;
static final purple  = 0xff9c27b0;
static final deepRurple  = 0xff673ab7;
static final lightBlue  = 0xff03a9f4;
static final cyan  = 0xff00bcd4;
static final teal  = 0xff009688;
static final green  = 0xff259b24;
static final lightGreen  = 0xff8bc34a;
static final lime  = 0xffcddc39;
static final yellow  = 0xffffeb3b;
static final orange  = 0xffff9800;
static final deepOrange  = 0xffff5722;

static List<int> colors = [
0xffe51c23,
0xffe91e63,
0xff9c27b0,
0xff673ab7,
0xff03a9f4,
0xff00bcd4,
0xff009688,
0xff259b24,
0xff8bc34a,
0xffcddc39,
0xffffeb3b,
0xffff9800,
0xffff5722
];

static int getRandom(){
  var rng = new Random();
  int rnd = 0;
  for (var i = 0; i < 10; i++) {
    rnd = rng.nextInt(colors.length);
  }
  return colors[rnd];
}

}