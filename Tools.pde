
void xLabelsToGroup(Group g, int pasos, int vw, int vh, int padding){
     float spaceX = vw / (pasos - 1);
     for(int i = 0; i < pasos; i++){
       cp5.addTextlabel(g.getName() + "_x_" + i)
         .setPosition(padding + i * spaceX ,  padding + vh)
         .setText(String.valueOf(i))
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
