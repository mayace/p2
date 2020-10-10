void actualizarG3v2(JSONObject body){
  
  JSONArray ida = body.getJSONArray("ida");
  JSONArray vuelta = body.getJSONArray("vuelta");
  
  float[] data = new float[24];
  float[] data2 = new float[24];
  
  float max = 0;
  for (int i = 0; i < ida.size(); i++) {
    JSONObject item = ida.getJSONObject(i);
    int hora = Integer.parseInt(item.getString("hora").split(":")[0]);
    float val = (float)item.getInt("obstaculos");
    data[hora] += val;
    
    if(max < data[hora]){
      max = data[hora];
    }
  }
  
   for (int i = 0; i < vuelta.size(); i++) {
    JSONObject item = vuelta.getJSONObject(i); 
    int hora = Integer.parseInt(item.getString("hora").split(":")[0]);
    float val = (float)item.getInt("obstaculos");
    
    data2[hora] +=val;
    
    if(max < data2[hora]){
      max = data2[hora];
    }
  }
  
  Group g3 = cp5.get(Group.class,"g3");
  int vw = chart3.getWidth();
  int vh = chart3.getHeight();
  
  yLabelsUpdate(g3,8,vw,vh,20,(int)max);
  
  chart3.setRange(0,max);
  chart3.setData("ida",data);
  chart3.setData("vuelta",data2);
}


void actualizarG3(JSONObject body){
  
  JSONArray ida = body.getJSONArray("ida");
  JSONArray vuelta = body.getJSONArray("vuelta");
  
  float[] data = new float[ida.size()];
  float[] data2 = new float[vuelta.size()];
  
  for (int i = 0; i < ida.size(); i++) {
    JSONObject item = ida.getJSONObject(i); 
    data[i] =(float)item.getInt("obstaculos");
  }
  
   for (int i = 0; i < vuelta.size(); i++) {
    JSONObject item = vuelta.getJSONObject(i); 
    data2[i] =(float)item.getInt("obstaculos");
  }
  
  chart3.setData("ida",data);
  chart3.setData("vuelta",data2);
}


Group crearG3v2(String id, int x, int y, int w,int h,float[] data,float[] data2){
  
  Group g1 = cp5.addGroup(id)
                .setLabel("Obstaculos de ida y vuelta")
                .setSize(w,h)
                .setPosition(x,y)
                .setBackgroundColor(color(255,100))
                ;
                
  int padding = 20;
  int vw = w - 2 * padding;
  int vh = h - 2 * padding;
  float rangeMin = 0;
  float rangeMax = 10;
  float rangeAbs = rangeMax - rangeMin;

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(vw, vh)
     .setRange(rangeMin, rangeMax)
     .setView(Chart.BAR_CENTERED) 
     .setGroup(g1)
     ;
     
  xLabelsToGroup(g1,24,vw,vh,padding,new float[]{15,45},DAY_HOURS);
  yLabelsToGroup(g1,8,vw,vh,padding,(int)rangeAbs);
  
  c.addDataSet("ida");
  c.setData("ida", data);
  
  c.addDataSet("vuelta");
  c.setData("vuelta", data2);
  
  c.getDataSet("ida").setColors(#2a6592);
  c.getDataSet("vuelta").setColors(#8ec3eb);
  
  chart3= c;
  return g1;
}
