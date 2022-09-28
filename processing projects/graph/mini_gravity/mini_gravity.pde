//----------------------------------------------------------
PVector location , velocity , acceleration , force ;     // Vectors for the 1st body
PVector location2, velocity2, acceleration2, force2; // Vectors for the 2nd body
//-----------------------------------------------------------
PVector AB, AB2; // Vector from the centre of the 1st body to the 2nd one and  backwards.
float m1 = 10; // Mass of the 1st body
float m2 = 7500; // Mass of the 2nd body
final float G = 1; // Gravitational constant
PGraphics pg1; // Canvas for drawing trajectories
float R = 50; // Radious of the 1st body
float r = 50; // Radious of the 2nd body
 
 
//-----------------------------------------------------------
void setup()
{
size(displayWidth,displayHeight);
smooth(8);
location2 = new PVector(0,0);   // Initial location of the 2nd body
velocity2 = new PVector(0,0);    // Its initial velocity
acceleration2 = new PVector(0.0,0.0); // Its initial acceleration
//----------------------------------------------------------
location = new PVector(-300,-390); // Initial location of the 1st body
velocity = new PVector(0,3.8); // Its initial velocity
acceleration = new PVector(0,0); // Its initial acceleration
pg1 = createGraphics(1920, 1080);
}
//-----------------------------------------------------------
void draw()
{
translate(displayWidth/2,displayHeight/2);
background(51,51,51);
 
//-----------------------------------------------------------
AB = PVector.sub(location2,location);
AB2 =PVector.sub(location,location2);
AB = AB.normalize(AB); // Vector AB's length becomes 1
AB2 = AB2.normalize(AB2);
float F = (G*m1*m2)/(sq(dist(location.x,location.y,location2.x,location2.y))); // Module of gravitational force
force = AB.mult(F);
force2 = AB2.mult(F);
acceleration = acceleration.add(force.div(m1)); // Changing acceleration by the force
 
acceleration2 = acceleration2.add(force2.div(m2));
//-----------------------------------------------------------
fill(173,101,95);
circle(location.x,location.y,r); // Drawing the 1st body
 
velocity = velocity.add(acceleration);
location = location.add(velocity);
//-----------------------------------------------------------
fill(255, 207, 72);
circle(location2.x,location2.y,R); // Drawing the 2nd body
 
velocity2 = velocity2.add(acceleration2);
location2 = location2.add(velocity2);
//-----------------------------------------------------------
acceleration = acceleration.mult(0);
acceleration2 = acceleration2.mult(0);
//-----------------------------------------------------------
 
pg1.beginDraw();
                                                                         //
  pg1.stroke(255);                                                       //
  pg1.strokeWeight(2.5);                                                 //                                               
  pg1.point(location.x+displayWidth/2,location.y+displayHeight/2);       // Drawing trajectories
  pg1.stroke(255,256,0);                                                 //
  pg1.point(location2.x+displayWidth/2,location2.y+displayHeight/2);     //
  pg1.endDraw();                                                         //
  image(pg1, -displayWidth/2,-displayHeight/2);                          //
 
if(dist(location.x,location.y,location2.x,location2.y)<=(R+r)/2){   // Destroying objects if they collides
location.x = 1000000000;
location.y = 1000000000;
location2.x = -1000000000;
location2.y = -1000000000;
 
}
 
//saveFrame("Frame####.png");  //Delete "//" if you want to record an animation
 
 
}
//-----------------------------------------------------------
