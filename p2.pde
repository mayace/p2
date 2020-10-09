import http.requests.*;
import controlP5.*;


ControlP5 cp5;

Chart myChart,chart1,chart2,chart3,chart4,chart5;
public void setup() 
{
  size(1200,800);
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
     int w = 1024;
     int h = 200;
     int x0 = 20;
     int y0 = 120;
     int spacey= 40;
     
  
    cp5.addAccordion("acc1")
                 .setPosition(x0,y0)
                 .setWidth(w)
                 .setCollapseMode(Accordion.MULTI)
                 .addItem(crearG1v2("g1",0,0,w,h,data))
                 .addItem(crearG2v2("g2",0,0,w,h,new float[]{1,2,3,4,5}))
                 .addItem(crearG3v2("g3",0,0,w,h,data,data2))
                 .addItem(crearG4v2("g4",0,0,w,h,data,data2))
                 .addItem(crearG5v2("g5",0,0,w,h,data,data2))
                 ;
}



public void Enviar() {
  String yyyy = cp5.get(Textfield.class,"yyyy").getText();
  String MM = cp5.get(Textfield.class,"MM").getText();
  String dd = cp5.get(Textfield.class,"dd").getText();
  
  
String start = yyyy + "-" + MM + "-" + dd;

  
  String url1= "https://api.taskycodes.com/verpesospordia?fecha=" + start;
  GetRequest get = new GetRequest(url1);
  get.send(); // program will wait untill the request is completed
  
  JSONArray body1 = parseJSONArray(get.getContent());
  
  actualizarG1(body1);
  
  String url2= "https://api.taskycodes.com/verpaquetespormes?fecha=" + start;
  GetRequest get2 = new GetRequest(url2);
  get2.send(); // program will wait untill the request is completed
  
  JSONArray body2 = parseJSONArray(get2.getContent());
  
  actualizarG2v2(body2);
  
  String url3= "https://api.taskycodes.com/verobstaculosidayvuelta?fecha=" + start;
  GetRequest get3 = new GetRequest(url3);
  get3.send(); // program will wait untill the request is completed
  
  JSONObject body3 = parseJSONObject(get3.getContent());
  
  actualizarG3v2(body3);
  
  String url4= "https://api.taskycodes.com/vertiemposdeidayvuelta?fecha=" + start;
  GetRequest get4 = new GetRequest(url4);
  get4.send(); // program will wait untill the request is completed
  
  JSONObject body4 = parseJSONObject(get4.getContent());
  
  actualizarG4v2(body4);
  
  String url5= "https://api.taskycodes.com/vertiempospromediospordia?fecha=" + start;
  GetRequest get5 = new GetRequest(url5);
  get5.send(); // program will wait untill the request is completed
  
  JSONArray body5 = parseJSONArray(get5.getContent());
  
  actualizarG5(body5);
 
}

void draw(){
  background(0);
}
