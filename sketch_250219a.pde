//Composition Maker 2.0
//Name, date

//Variables
PImage[] images; // Array to store images
int totalImages = -1; // Total number of images in the directory

void setup() {
  //set window size
    size(1024, 800);
    //set background to random color
    background(random(255), random(255), random(255));
    
    LoadFiles();
}

void draw() {

  int randomNumber = ceil(random(4));
        
      fill(random(255), random(255), random(255), random(50, 100));
      rect (random(width), random(height), random(width/randomNumber),random(height/randomNumber)); 

        if (totalImages >0)
        {
          DisplayImage();
        }

      //lower number = slower composition creation
      frameRate(12); 
}

void mousePressed() {
      noLoop();
      saveFrame(timeStamp() + ".png");
}

void mouseReleased() {
  
      loop();
}

String timeStamp() {
      int d = day();    
      int m = month();  
      int y = year();   
      int s = second(); 
      int n = minute(); 
      int h = hour();    
      
     return String.valueOf(m) + "-" + String.valueOf(d)+ "-" + 
     String.valueOf(y)+ "_" + String.valueOf(h) + "." + String.valueOf(n) 
     + "." + String.valueOf(s);
    }

void LoadFiles()
{
      //Store file list in an array
    File[] files = listFiles("media/");
    
    //How many files are in the directory?
    totalImages = files.length; 
    
    // If there is at least one image
  if (totalImages >0)
  {
     images = new PImage[totalImages]; // Initialize array to store images
    
    
     for (int i = 0; i < totalImages; i++) {
       // Load the image using the full file path
      images[i] = loadImage(files[i].getPath()); 
    }
  }
}

void DisplayImage()
{
    //modify transparency level of image
    tint(random(255), random(255), random(255), ceil(random(100)+130));
    
    // Pick a random image to display
    int randomIndex = (int) random(totalImages);
    image(images[randomIndex], random(width), random(height)); 
}
