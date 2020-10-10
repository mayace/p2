void actualizarG1v2(JSONArray body){
  
  float[] data = new float[24];

  float max = 0;
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i);
    int hora = Integer.parseInt(item.getString("hora").split(":")[0]);
    float val = item.getFloat("peso");
    data[hora] =val;
    
    if(max < data[hora]){
      data[hora] = data[hora];
    }
  }
  
  chart1.setRange(0, max + max * 0.1);
  chart1.setData("data", data);
}

void actualizarG1(JSONArray body){
  
  float[] data = new float[body.size()];

  
  for (int i = 0; i < body.size(); i++) {
    JSONObject item = body.getJSONObject(i);
    data[i] =item.getFloat("peso");
  }
  
  chart1.setData("data", data);
}
Group crearG1v2(String id,int x, int y, int w,int h,float[] data){
 
  Group g1 = cp5.addGroup(id)
                .setLabel("Peso de paquetes por dia")
                .setSize(w,h)
                .setPosition(x,y)
                .setBackgroundColor(color(255,100))
                ;
                
  int padding = 20;
  int vw = w - 2 * padding;
  int vh = h - 2 * padding;
  float rangeMin = 0;
  float rangeMax = 600;
  float rangeAbs = rangeMax - rangeMin;
  
   Chart c = cp5.addChart(id + ".chart1")
     .setPosition(padding, padding)
     .setSize(vw, vh)
     .setRange(rangeMin, rangeMax)
     .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
     .setGroup(g1)
     ;
     
  xLabelsToGroup(g1,24,vw,vh,padding,DAY_HOURS,0);
  yLabelsToGroup(g1,8,vw,vh,padding,(int)rangeAbs);
    
  c.addDataSet("data");
  c.setData("data", data);
  
  chart1 = c;
  
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
