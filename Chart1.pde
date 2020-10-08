Group crearG1v2(String id,int x, int y, int w,int h,float[] data){
 
  Group g1 = cp5.addGroup(id)
                .setLabel("Peso de paquetes por dia")
                .setSize(w,h)
                .setPosition(x,y)
                .setBackgroundColor(color(255,100))
                ;
                
int padding = 20;
   Chart c = cp5.addChart(id + ".chart1")
     .setPosition(padding, padding)
     .setSize(w - 2*padding, h -2*padding)
     .setRange(0, 20)
     .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
     .setGroup(g1)
     ;
     
     
  c.addDataSet("data");
  c.setData("data", data);
  
  return g1;
}

void crearG1(){
Group g1 = cp5.addGroup("g1")
                .setLabel("Peso de paquetes por dia")
                .setSize(600,200)
                .setPosition(20,120)
                .setBackgroundColor(color(255,100))
                ;
new LineChart(cp5, "b1").setPosition(0, 0).setSize(600, 200).moveTo(g1);
}
