size(1536,2048);
background(255);
float sz=float(width)/100;
float xc=width/2;
float yc=height/2;
fill(0);
for(int i=0;i<8;i++)
for(int j=0;j<8;j++)
if((i+j)%2==1)
rect(xc-sz*40+i*10*sz,yc-sz*40+j*10*sz,sz*10,sz*10);
rect(xc-sz*41,yc-sz*41,sz,sz*82);
rect(xc-sz*41,yc-sz*41,sz*82,sz);
rect(xc+sz*40,yc-sz*41,sz,sz*82);
rect(xc-sz*41,yc+sz*40,sz*82,sz);
textSize(sz*5);
textAlign(CENTER,CENTER);
text("A",xc-sz*35,yc-sz*45);
text("B",xc-sz*25,yc-sz*45);
text("C",xc-sz*15,yc-sz*45);
text("D",xc-sz*5,yc-sz*45);
text("E",xc+sz*5,yc-sz*45);
text("F",xc+sz*15,yc-sz*45);
text("G",xc+sz*25,yc-sz*45);
text("H",xc+sz*35,yc-sz*45);
text("A",xc-sz*35,yc+sz*44);
text("B",xc-sz*25,yc+sz*44);
text("C",xc-sz*15,yc+sz*44);
text("D",xc-sz*5,yc+sz*44);
text("E",xc+sz*5,yc+sz*44);
text("F",xc+sz*15,yc+sz*44);
text("G",xc+sz*25,yc+sz*44);
text("H",xc+sz*35,yc+sz*44);
for(int i=0;i<8;i++){
text(i+1,xc-sz*44,yc-sz*36+i*sz*10);
text(i+1,xc+sz*44,yc-sz*36+i*sz*10);
}
saveFrame("1.png");
