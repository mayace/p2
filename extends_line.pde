import java.util.Iterator;

public class Chart2 extends Chart{

  
  public Chart2( ControlP5 theControlP5 , String theName ) {
    super(theControlP5,theName);
  }
  
  public class ChartViewLine2 extends Chart.ChartViewLine {
    
  //public Chart setView( int theType ) {
  //  switch ( theType ) {
  //  case ( PIE ):
  //    setView( new ChartViewPie( ) );
  //    break;
  //  case ( LINE ):
  //    setView( new ChartViewLine( ) );
  //    break;
  //  case ( BAR ):
  //    setView( new ChartViewBar( ) );
  //    break;
  //  case ( BAR_CENTERED ):
  //    setView( new ChartViewBarCentered( ) );
  //    break;
  //  case ( AREA ):
  //    setView( new ChartViewArea( ) );
  //    break;
  //  default:
  //    System.out.println( "Sorry, this ChartView does not exist" );
  //    break;
  //  }
  //  return (Chart)this;
  //}
  
  
  public void display( PGraphics theGraphics , Chart theController ) {

      theGraphics.pushStyle( );
      theGraphics.fill( getColor( ).getBackground( ) );
      theGraphics.rect( 0 , 0 , getWidth( ) , getHeight( ) );
      theGraphics.noFill( );
      Iterator< String > it = getDataSet( ).keySet( ).iterator( );
      String index = null;
      while ( it.hasNext( ) ) {
        index = it.next( );
        theGraphics.stroke( getDataSet( index ).getColor( 0 ) );
        theGraphics.strokeWeight( getDataSet( index ).getStrokeWeight( ) );

        theGraphics.beginShape( );
        float res = ( ( float ) getWidth( ) ) / ( getDataSet( index ).size( ) - 1 );
        for ( int i = 0 ; i < getDataSet( index ).size( ) ; i++ ) {
          float hh = PApplet.map( getDataSet( index ).get( i ).getValue( ) , _myMin , _myMax , getHeight( ) , 0 );
          theGraphics.vertex( i * res , PApplet.min( getHeight( ) , PApplet.max( 0 , hh ) ) );
        }
        theGraphics.endShape( );
      }
      theGraphics.noStroke( );
      theGraphics.popStyle( );
      getCaptionLabel( ).draw( theGraphics , 0 , 0 , theController );
      println("hoho");
    }
  }
  
  
}

class LineChart extends Controller<LineChart> {

  int current = 0xffff0000;

  float a = 128;
  
  float na;
  
  int y;
  int[] range= {0,200};
  
  int[][] datos = {{1,35},{2,100},{3,123},{1,354},{2,100},{3,12},{1,60},{2,100},{3,120},{1,35},{2,10},{3,120}};
  
  // use the convenience constructor of super class Controller
  // MyButton will automatically registered and move to the 
  // default controlP5 tab.
  
  LineChart(ControlP5 cp5, String theName) {
    super(cp5, theName);
    
    // replace the default view with a custom view.
    setView(new ControllerView() {
      public void display(PGraphics p, Object b) {
        int padding = 40;
        
        p.fill(#ffffff);
        p.rect(0, 0, getWidth(), getHeight());
        
        //p.rect(padding, padding, getWidth()-2*padding, getHeight()-padding*2);
        
        int vw= getWidth() - 2 * padding;
        int vh= getHeight() - 2 * padding;
        int x0=padding,y0= padding;
        
        //int yspace = vh/(range[1] - range[0]);
        int xspace = vw / datos.length;
        int widthLine = 1;
        
        int prex= x0;
        int prey= y0 + vh;
        
        
        p.fill(0);
        textSize(10);
        //strokeWeight(widthLine);//
        stroke(0);
        
        p.rect(x0,y0, widthLine,vh);
        p.rect(x0,y0 + vh, vw,widthLine);
        for(int i= 0;i<datos.length;i++){
          int[] item = datos[i];
          int vx = padding + xspace +  i * xspace ;
          int vy = padding + vh - item[1];
          
          //point
          p.circle(vx,vy,2*widthLine);
          //line
          
          p.line(prex,prey,vx,vy);
          prex = vx;
          prey= vy;
          //y label
          text(item[1], padding - 20, 4 + vy);
          p.rect(padding, vy, 10 , widthLine);
          //x label
          p.rect(vx, padding + vh, widthLine , 10);
          text(i+1, vx, 24 + padding + vh);
        }
        
        
      }
    }
    );
  }

  // override various input methods for mouse input control
  //void onEnter() {
  //  cursor(HAND);
  //  println("enter");
  //  a = 255;
  //}
  
  //void onScroll(int n) {
  //  println("scrolling");
  //  y -= n;
  //  y = constrain(y,0,getHeight()-10);
  //}
  
  //void onPress() {
  //  println("press");
  //  current = 0xffffff00;
  //}
  
  //void onClick() {
  //  Pointer p1 = getPointer();
  //  println("clicked at "+p1.x()+", "+p1.y());
  //  current = 0xffffff00;
  //  setValue(y);
  //}

  //void onRelease() {
  //  println("release");
  //  current = 0xffffffff;
  //}
  
  //void onMove() {
  //  println("moving "+this+" "+_myControlWindow.getMouseOverList());
  //}

  //void onDrag() {
  //  current = 0xff0000ff;
  //  Pointer p1 = getPointer();
  //  float dif = dist(p1.px(),p1.py(),p1.x(),p1.y());
  //  println("dragging at "+p1.x()+", "+p1.y()+" "+dif);
  //}
  
  //void onReleaseOutside() {
  //  onLeave();
  //}

  //void onLeave() {
  //  println("leave");
  //  cursor(ARROW);
  //  a = 128;
  //}
}
