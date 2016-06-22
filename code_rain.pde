int textsize, cycle;
color pink = color(255,51,153);
color green = color(51,255,51);
col[] start;
void setup(){
  size(800,600);
  textsize = 10;
  textSize(textsize);
  cycle = 0;
  start = new col[width/textsize];
  //dictate max length of charachters and starting time
  for (int i = 0; i < start.length; i++){
    start[i] = new col(i);
  }
}
void draw(){
  cycle += 1; 
  background(0);
  for (int j = 0; j<start.length; j++){
      start[j].disp();
  }
}

class elm{
  elm(){
    
  }
}

class stream{
  int startTime, numChar, currHead, currTail, col, count;
  char[] chars;
  stream(int st, int nc, int c){
    this.startTime = st;
    this.numChar = nc;
    this.col = c;
    this.currHead = 0;
    this.currTail = currHead - numChar*textsize;
    this.chars = new char[this.numChar];
    this.count = -1;
    for (int i = 0; i < chars.length; i++){
      chars[i] = 'o';
    }
  }
  void disp(color c){
    this.currHead += textsize;
    this.currTail += textsize;
    this.count ++;
    int start = 0;
    int end = height;
    if (currTail>start){
      start = this.currTail;
    }
    if (this.currHead<end){
      end = this.currHead;
    }
    fill(c);
    for (int i = start; i < end; i+= textsize){
      text(chars[0],this.col,i);
    }
  }
  void reset(int st, int nc){
    this.startTime = st;
    this.numChar = nc;
    this.currHead = 0;
    this.currTail = this.currHead - this.numChar*textsize;
  }
}

class col{
  int num;
  stream s1;
  col(int n){
    this.num = n;
    s1 = new stream((int)random(100.0),(int)random(300.0),this.num*textsize+textsize);
  }
  void disp(){
    if (cycle > s1.startTime && s1.currTail < height){
      s1.disp(green);
    } 
    else if (s1.currTail >= height){
      s1.reset(cycle + (int)random(300),(int)random(300.0));
    }
  }
}