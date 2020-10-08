import http.requests.*;
import controlP5.*;


ControlP5 cp5;

Chart myChart,chart1,chart2,chart3,chart4,chart5;
public void setup() 
{
  size(800,600);
   cp5= new ControlP5(this);
   
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("yyyy")
     .setPosition(20,20)
     .setSize(200,40)
     .setFont(font)
     .setText("2020")
     ;
     
     cp5.addTextfield("MM")
     .setPosition(220,20)
     .setSize(200,40)
     .setFont(font)
     .setText("09")
     ;
     cp5.addTextfield("dd")
     .setPosition(420,20)
     .setSize(200,40)
     .setFont(font)
     .setText("20")
     ;
   
    cp5.addBang("Enviar")
     .setPosition(620,20)
     .setSize(100,40)
     .setFont(font)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
     
     textFont(font);
     
     float[] data= {10,4,3,5,78,3};
     float[] data2= {5,55,8,45,6,0};
     int w = 700;
     int h = 200;
     int x0 = 20;
     int y0 = 120;
     int spacey= 40;
     
  
    cp5.addAccordion("acc1")
                 .setPosition(x0,y0)
                 .setWidth(w)
                 .setCollapseMode(Accordion.MULTI)
                 .addItem(crearG1v2("g1",0,0,w,h,data))
                 .addItem(crearG2v2("g2",0,0,w,h,data))
                 .addItem(crearG3v2("g3",0,0,w,h,data,data2))
                 .addItem(crearG2v2("g4",0,0,w,h,data))
                 .addItem(crearG2v2("g5",0,0,w,h,data))
                 ;
}



public void Enviar() {
  String yyyy = cp5.get(Textfield.class,"yyyy").getText();
  String MM = cp5.get(Textfield.class,"MM").getText();
  String dd = cp5.get(Textfield.class,"dd").getText();
  
  
String start = yyyy + "-" + MM + "-" + dd + "%2000:00:00";
String end = yyyy + "-" + MM + "-" + dd + "%2011:59:59";
  
  String url1= "https://api.thingspeak.com/channels/1117472/feeds.json?start="+ start+ "&end="+end;
  GetRequest get = new GetRequest(url1);
  get.send(); // program will wait untill the request is completed
  
  
 //println(url1);
  JSONObject body = parseJSONObject(get.getContent());
  JSONArray feeds = body.getJSONArray("feeds");
  
  println("total:" + feeds.size());//
  
}

void draw(){
  background(0);
}
