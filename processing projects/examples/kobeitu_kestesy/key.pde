class button
  {
    button(int ID, String Text, float PosX, float PosY)
    {
      id=ID;
      text=Text;
      posX=PosX;
      posY=PosY;
    }
    
    void draw()
    {
      buttonDraw(posX, posY, text);
    }
    int id;
    String text;
    float posX, posY;
    
    void touch()
    {
      if(mouseX>xc-(sz*48)+posX*sz*33 && mouseX < xc-(sz*48)+posX*sz*33+sz*30 && mouseY >yc+sz*2+posY*yc/4.1 && mouseY < yc+sz*2+posY*yc/4.1+yc/4.4)       
      {
          contData=id;
      }
    }
  }
  
  void buttonDraw(float x, float y, String t)
  {
    fill(#A900CB);
    stroke(#7C00FF);
    strokeWeight(sz);
    textSize(sz*15);
    rect(xc-(sz*48)+x*sz*33,yc+sz*2+y*yc/4.1,sz*30,yc/4.4);
    fill(255);
    text(t, xc-(sz*48)+x*sz*33+sz*15,yc+y*yc/4.1+yc/8);
  }
  
  void buttonsDraw()
  {
    k1.draw();
    k2.draw();
    k3.draw();
    k4.draw();
    k5.draw();
    k6.draw();
    k7.draw();
    k8.draw();
    k9.draw();
    k0.draw();
    backSpace.draw();
    enter.draw();
  }
  
  void mousePressed()
  {
    k1.touch();
    k2.touch();
    k3.touch();
    k4.touch();
    k5.touch();
    k6.touch();
    k7.touch();
    k8.touch();
    k9.touch();
    k0.touch();
    backSpace.touch();
    enter.touch();
    if(contData>-1)
    {
      if(contData<10)
      {
        if(input*10+contData<=90)
        {
        input = input*10+contData;
        }
        
        restart=restart*10+contData;
      }
      else if(contData==10)
      {
        input=(input-input%10)/10;
        restart=0;
      }
      else if(contData==11 && input>0)
      {
        neww=true;
        if(next<200)
        {
          if(rd1*rd2==input)
          {
            tfl[next]=true;
          }
          else
          {
            tfl[next]=false;
          } 
          next++;
          saveData();
        }
        input=0;
      }
    }
    if(restart==124537869)
    {
      restart=0;
      next=0;
      saveData();
      neww=true;
      input=0;
    }
    contData =-1; 
  }
 
  button k1=new button(1,"1",0,0);
  button k2=new button(2,"2",1,0);
  button k3=new button(3,"3",2,0);
  button k4=new button(4,"4",0,1);
  button k5=new button(5,"5",1,1);
  button k6=new button(6,"6",2,1);
  button k7=new button(7,"7",0,2);
  button k8=new button(8,"8",1,2);
  button k9=new button(9,"9",2,2);
  button k0=new button(0,"0",1,3);
  button backSpace=new button(10,"<",0,3);
  button enter=new button(11,"OK",2,3);