void cc2(){
  cp5 = new ControlP5(this);
  Chart2 c = new Chart2(cp5,"333");
  
    c.setPosition(20, 50)
     .setSize(600, 400)
     .setRange(0, 20)
     .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
     .setStrokeWeight(1)
     .setColorCaptionLabel(#ffffff)
     ;
     
     float[] data ={10,4,3,5,78,3};

  c.addDataSet("incoming");
  c.setData("incoming", data);
}

void cc(){
GetRequest get = new GetRequest("https://api.thingspeak.com/channels/1117472/feeds.json");
  get.send(); // program will wait untill the request is completed
 
  JSONObject body = parseJSONObject(get.getContent());
  JSONArray feeds = body.getJSONArray("feeds");
  
  println("total:" + feeds.size());
  
  
  cp5 = new ControlP5(this);
  myChart = cp5.addChart("dataflow")
               .setPosition(20, 50)
               .setSize(600, 400)
               .setRange(0, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1)
               .setColorCaptionLabel(#ffffff)
               ;


float[] data ={10,4,3,5,78,3};

  myChart.addDataSet("incoming");
  myChart.setData("incoming", data);
  myChart.setColorValue(#ffffff);

    myChart.getData("incoming",1).setText("10");
    myChart.getData("incoming",1).setColor(#000000);
    myChart.getColor().setBackground(#ffffff);
    myChart.getColor().setValueLabel(#000000);
    myChart.getColor().setForeground(#000000);
     myChart.getColor().setCaptionLabel(#000000);
     
     
     myChart.setColorLabel(#000000) ;
myChart.setColorValue(#000000) ;
myChart.setColorValueLabel(#000000) ;
}
