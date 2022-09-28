class bool
{
  bool(int ID, String Text, color SC, color FC, color TC)
  {
    id=ID;
    text=Text;
    sc=SC;
    fc=FC;
    tc=TC;
  }
  
  void set(float X, float Y, float SX, float SY, float ST)
  {
    x=X;
    y=Y;
    sx=SX;
    sy=SY;
    st=ST;
  }
  
  void draw()
  {
    bDraw(x, y, sx, sy, text, sc, fc, tc, st, id, tAni);
  }

  void touch()
  {
    if (mouseX>x-sx/2 && mouseX<x+sx/2 && mouseY>y-sy/2 && mouseY<y+sy/2)
    {
      touchID=id;
      if (!paniOn)
        tAni=touchAni;
    }
  }

  private int    id,   tAni;
  private String text;
  private float  x,    y;      //pos   - x,y
  private float  sx,   sy,   st;//size  - x,y,text
  private color  sc,   fc,   tc;//color - stroke fill text
};

void bDraw(float x, float y, float sx, float sy, String text, color sc, color fc, color tc, float st, int id, int tAni)
{
  strokeWeight (sz/3);
  pg.setSeed   (id+pani+tAni);
  fill         (fc);
  stroke       (sc);
  pg.rect      (x-sx/2, y-sy/2, sx, sy);
  textAlign    (CENTER, CENTER);
  fill         (tc);
  textSize     (st);
  text         (text, x+sin(pani+tAni*id)*sz/4, y+cos(pani-tAni*id)*sz/4);
}
