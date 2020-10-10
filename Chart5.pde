void actualizarG5v2(JSONArray body){
  
  float[] data = new float[body.size()];
  float[] data2 = new float[body.size()];
  
  float max = 0;
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i); 
    data[i] =(float)item.getInt("promedioida");
    data2[i] =(float)item.getInt("promediovuelta");
    
    if(max < data[i]){
      max = data[i];
    }
    if(max < data2[i]){
      max = data2[i];
    }
  }
  
  Group g5 = cp5.get(Group.class,"g5");
  int vw = chart5.getWidth();
  int vh = chart5.getHeight();
  
  yLabelsUpdate(g5,8,vw,vh,20,(int)max);
  
  chart5.setRange(0,max);
  chart5.setData("ida",data);
  chart5.setData("vuelta",data2);
}

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
  int vw = w - 2 * padding;
  int vh = h - 2 * padding;
  float rangeMin = 0;
  float rangeMax = 10;
  float rangeAbs = rangeMax - rangeMin;

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(vw,vh)
     .setRange(rangeMin, rangeMax)
     .setView(Chart.BAR_CENTERED) 
     .setGroup(g1)
     ;
     
  xLabelsToGroup(g1,31,vw,vh,padding,new float[]{15,65},MONTH_DAYS);
  yLabelsToGroup(g1,8,vw,vh,padding,(int)rangeAbs);
  
  c.addDataSet("ida");
  c.setData("ida", data);
  
  c.addDataSet("vuelta");
  c.setData("vuelta", data2);
  
  c.getDataSet("ida").setColors(#2a6592);
  c.getDataSet("vuelta").setColors(#8ec3eb);
  
  chart5= c;
  return g1;
}
