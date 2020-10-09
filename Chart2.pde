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
  
  chart2.setRange(0,max + max * 0.25);
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

   Chart c = cp5.addChart(id + ".chart2")
     .setPosition(padding, padding)
     .setSize(w - 2* padding, h - 2*padding)
     .setRange(0, 10)
     .setView(Chart.BAR_CENTERED) 
     .setGroup(g1)
     ;
     
     
  c.addDataSet("data");
  c.setData("data", data);
  
  chart2 = c;
  
  return g1;
}
