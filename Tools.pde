void actualizarLabelsY(int medidas,int rangeAbs,int padding, int vh){
      float spaceY = vh / (medidas - 1);
     for(int i = 0; i < medidas; i++){
       float val = rangeAbs * ((medidas - 1) - i) / (medidas - 1);
       cp5.addTextlabel("labely" + i)
         .setPosition(0,  padding + spaceY * i)
         .setText(String.valueOf((int)val))
         .setGroup(g1)
        ;
      }
}
