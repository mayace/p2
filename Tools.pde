static final String[] MONTH_DAYS = {
"1","2","3","4","5","6","7","8","9","10"
,"11","12","13","14","15","16","17","18","19","20"
,"21","22","23","24","25","26","27","28","29","30","31"
};

static final String[] DAY_HOURS = {
"0","1","2","3","4","5","6","7","8","9","10"
,"11","12","13","14","15","16","17","18","19","20"
,"21","22","23"
};

void xLabelsToGroup(Group g, int pasos, int vw, int vh, int padding, float[] innerPadding, String[] values){
     float spaceX = (vw - innerPadding[1]) / (pasos - 1);
     
     for(int i = 0; i < pasos; i++){
       float leftPadding = padding + innerPadding[0];//(i == 0 ? innerPadding[0] : 0);  
       cp5.addTextlabel(g.getName() + "_x_" + i)
         .setPosition(leftPadding + i * spaceX ,  padding + vh)
         .setText(values[i])
         .setGroup(g)
        ;
      }
}

void yLabelsToGroup(Group g, int pasos, int vw, int vh, int padding, int rangeAbs){
    float spaceY = vh / (pasos - 1);
     for(int i = 0; i < pasos; i++){
       float val = rangeAbs * ((pasos - 1) - i) / (pasos - 1);
       cp5.addTextlabel(g.getName() + "_y_" + i)
         .setPosition(0,  padding + spaceY * i)
         .setText(String.valueOf((int)val))
         .setGroup(g)
        ;
      }
}


void actualizarLabelsY(int medidas,int rangeAbs,int padding, int vh){
      float spaceY = vh / (medidas - 1);
     for(int i = 0; i < medidas; i++){
       float val = rangeAbs * ((medidas - 1) - i) / (medidas - 1);
       cp5.addTextlabel("labely" + i)
         .setPosition(0,  padding + spaceY * i)
         .setText(String.valueOf((int)val))
         //.setGroup(g1)
        ;
      }
}
