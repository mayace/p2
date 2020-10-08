Group crearG2v2(String id, int x, int y, int w,int h,float[] data){
  
  Group g1 = cp5.addGroup(id)
                .setLabel("Paquetes entregrados en un mes")
                .setSize(w,h)
                .setPosition(x,y)
                .setBackgroundColor(color(255,100))
                ;
                
int padding = 20;

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(w - 2* padding, h - 2*padding)
     .setRange(0, 20)
     .setView(Chart.BAR_CENTERED) 
     .setGroup(g1)
     ;
     
     
  c.addDataSet("data");
  c.setData("data", data);
  
  return g1;
}
