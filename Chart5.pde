void actualizarG5(JSONArray body){
  
  float[] data = new float[body.size()];
  float[] data2 = new float[body.size()];
  
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i); 
    data[i] =(float)item.getInt("promedioida");
    data2[i] =(float)item.getInt("promediovuelta");
  }
  
  chart5.setData("ida",data);
  chart5.setData("vuelta",data2);
}


Group crearG5v2(String id, int x, int y, int w,int h,float[] data,float[] data2){
  
  Group g1 = cp5.addGroup(id)
                .setLabel("Tiempos promedio de ida y vuelta")
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
     
     
  c.addDataSet("ida");
  c.setData("ida", data);
  
  c.addDataSet("vuelta");
  c.setData("vuelta", data2);
  
  c.getDataSet("ida").setColors(#2a6592);
  c.getDataSet("vuelta").setColors(#8ec3eb);
  
  chart5= c;
  return g1;
}
