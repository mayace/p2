void actualizarG4(JSONObject body){
  
  JSONArray ida = body.getJSONArray("ida");
  JSONArray vuelta = body.getJSONArray("vuelta");
  
  float[] data = new float[ida.size()];
  float[] data2 = new float[vuelta.size()];
  
  for (int i = 0; i < ida.size(); i++) {
    JSONObject item = ida.getJSONObject(i); 
    data[i] =(float)item.getInt("tida");
  }
  
   for (int i = 0; i < vuelta.size(); i++) {
    JSONObject item = vuelta.getJSONObject(i); 
    data2[i] =(float)item.getInt("tregreso");
  }
  
  chart4.setData("ida",data);
  chart4.setData("vuelta",data2);
}


Group crearG4v2(String id, int x, int y, int w,int h,float[] data,float[] data2){
  
  Group g1 = cp5.addGroup(id)
                .setLabel("Tiempos de ida y vuelta")
                .setSize(w,h)
                .setPosition(x,y)
                .setBackgroundColor(color(255,100))
                ;
                
int padding = 20;

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(w - 2* padding, h - 2*padding)
     .setRange(0, 20)
     .setView(Chart.LINE) 
     .setGroup(g1)
     ;
     
     
  c.addDataSet("ida");
  c.setData("ida", data);
  
  c.addDataSet("vuelta");
  c.setData("vuelta", data2);
  
  c.getDataSet("ida").setColors(#2a6592);
  c.getDataSet("vuelta").setColors(#8ec3eb);
  
  chart4= c;
  return g1;
}
