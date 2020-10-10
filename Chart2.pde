void actualizarG2v2(JSONArray body){
  
  float[] data = new float[31];

  float max = 0;
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i);
    int dia = Integer.parseInt(item.getString("fecha").split("-")[2]);
   
    int indexDia = dia - 1;
    data[indexDia] += item.getFloat("paquetesentregados");
    
    if(max < data[indexDia]){
      max = data[indexDia];
    }
  }
  
  Group g2 = cp5.get(Group.class,"g2");
  int vw = chart2.getWidth();
  int vh = chart2.getHeight();
  
  yLabelsUpdate(g2,8,vw,vh,20,(int)max);
  
  chart2.setRange(0,max);
  chart2.setData("data", data);
}


void actualizarG2(JSONArray body){
  
  float[] data = new float[body.size()];
  
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i); 
    data[i] =(float)item.getInt("paquetesentregados");
  }
  
  chart2.setData("data",data);
}

Group crearG2v2(String id, int x, int y, int w,int h,float[] data){
  
  Group g1 = cp5.addGroup(id)
                .setLabel("Paquetes entregrados en un mes")
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

  
  xLabelsToGroup(g1,31,vw,vh,padding,new float[]{15,65},MONTH_DAYS);
  yLabelsToGroup(g1,8,vw,vh,padding,(int)rangeAbs);
     
  c.addDataSet("data");
  c.setData("data", data);
  
  chart2 = c;
  
  return g1;
}
