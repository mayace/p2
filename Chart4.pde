void actualizarG4v2(JSONObject body){
  
  JSONArray ida = body.getJSONArray("ida");
  JSONArray vuelta = body.getJSONArray("vuelta");
  
  float[] data = new float[24];
  float[] data2 = new float[24];
  
  float max = 0;
  for (int i = 0; i < ida.size(); i++) {
    JSONObject item = ida.getJSONObject(i);
    int hora = Integer.parseInt(item.getString("hora").split(":")[0]);
    float val = (float)item.getInt("tida");
    data[hora] += val;
    
    if(max < data[hora]){
      max = data[hora];
    }
  }
  
   for (int i = 0; i < vuelta.size(); i++) {
    JSONObject item = vuelta.getJSONObject(i); 
    int hora = Integer.parseInt(item.getString("hora").split(":")[0]);
    float val = (float)item.getInt("tregreso");
    
    data2[hora] +=val;
    
    if(max < data2[hora]){
      max = data2[hora];
    }
  }
  
  Group g4 = cp5.get(Group.class,"g4");
  int vw = chart4.getWidth();
  int vh = chart4.getHeight();
  
  yLabelsUpdate(g4,8,vw,vh,20,(int)max);
  
  chart4.setRange(0,max);
  chart4.setData("ida",data);
  chart4.setData("vuelta",data2);
}

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
                
  int padding = 20; // esta padding tambien hay actualizar en la actualizacion y labels
  int vw = w - 2 * padding;
  int vh = h - 2 * padding;
  float rangeMin = 0;
  float rangeMax = 10;
  float rangeAbs = rangeMax - rangeMin;

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(vw, vh)
     .setRange(rangeMin, rangeMax)
     .setView(Chart.LINE) 
     .setGroup(g1)
     ;
     
     
  xLabelsToGroup(g1,24,vw,vh,padding,new float[]{0,0},DAY_HOURS);
  yLabelsToGroup(g1,8,vw,vh,padding,(int)rangeAbs);
     
  c.addDataSet("ida");
  c.setData("ida", data);
  
  c.addDataSet("vuelta");
  c.setData("vuelta", data2);
  
  c.getDataSet("ida").setColors(#2a6592);
  c.getDataSet("vuelta").setColors(#8ec3eb);
  
  chart4= c;
  return g1;
}
