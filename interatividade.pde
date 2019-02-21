int wheelL;
int wheelA;

/*void mousePressed (){
  //INTERFACE ANTERIOR
   // Muda as cores e fixe-as ao pressionar o mouse;
   
    if ((mouseX >= 170) && (mouseX <= 195)){
      if ((mouseY >= 50) && (mouseY <= 75)){
         arranjo +=1;
         
      };
   };
   
   // Botão vertical horizontal
   
   if ((mouseX >= 170) && (mouseX <= 195)){
      if ((mouseY >= 550) && (mouseY <= 575)){
         if (orientacao == 0){
           orientacao = 1;
         } else {
           orientacao = 0;
         };
      };
   };
   //rect(550,50,25,25);
   if ((mouseX >= 550) && (mouseX <=575)){
    if ((mouseY >=50) && (mouseY <= 75)){
       if (paleta < 3){
         paleta +=1;
        
       }
       else{
         paleta = 0;
         
       }
    }
    
  }
  
   if ((mouseX >= 500) && (mouseX <=525)){
    if ((mouseY >=550) && (mouseY <= 575)){
    };
  };
  //rect(560,500,25,25); // Quadrado direito
  //rect(415,500,25,25);
   if ((mouseX >= 560) && (mouseX <=585)){
    if ((mouseY >=500) && (mouseY <= 525)){
      if(qntTriangulo < 6){
        qntTriangulo += 1;
      } else{
        qntTriangulo = 6;
      };
    };
  };
  
  if ((mouseX >= 415) && (mouseX <=440)){
    if ((mouseY >=500) && (mouseY <= 525)){
      if(qntTriangulo > 0){
        qntTriangulo -= 1;
      } else {
        qntTriangulo = 0;
      }
    }
  }
  
   if ((mouseX >= 500) && (mouseX <=575)){
    if ((mouseY >=550) && (mouseY <= 575)){
      if (reguladorLargura > 20){
      reguladorAltura -=2;
      reguladorLargura -=2;
      } else {
        reguladorAltura = 20;
        reguladorLargura = 20;
      };
      
      println("Altura "+reguladorAltura);
       println("Largura "+reguladorLargura);
    }
  }
  
   if ((mouseX >= 405) && (mouseX <=440)){
    if ((mouseY >=550) && (mouseY <= 575)){
     
        reguladorAltura +=2;
        reguladorLargura +=2;
      
       
    }
  }
  
  if ((mouseX >= 170) && (mouseX <=195)){
    if ((mouseY >=500) && (mouseY <= 525)){
      if (intercalarHorizontal == false) 
        intercalarHorizontal = true;
      else
        intercalarHorizontal = false;
    }
  }
  
} */
void mouseWheel(MouseEvent event){
    wheelL= event.getCount();
    wheelA = event.getCount();
     if (reguladorLargura > 20) {
        reguladorLargura += wheelL;
        reguladorAltura += wheelA;
        } else {
          reguladorAltura = 20;
          reguladorLargura = 20;
        };
    reguladorLargura += wheelL*2;
    reguladorAltura += wheelA*2;
    println(wheelL);
    println(wheelA);
}

import controlP5.*;

ControlP5 setOrientacaoH,
          setOrientacaoV,
          setPaleta,
          sliderT,
          knobArranjo,
          toggleIntercalar;

 void Horizontal() {
  orientacao = 1;
  sliderT.show();
  toggleIntercalar.show();
}

 void Vertical() {
  orientacao = 0; 
  sliderT.hide();
  toggleIntercalar.hide();
};

public void hide(){
}

public void show(){
} 



void Arranjo (int valor){
  arranjo = valor;
}

void Intercalar (boolean status){
 if (status == false){
   intercalarHorizontal = true;
 } else {
   intercalarHorizontal = false;
 }
}

void Paletas(){
   //Paleta
  paleta +=1;
  if (paleta > 2){
    paleta = 0;
  };
  paletaCores(paleta);
};

void botoesOrientacao (){
  setOrientacaoH = new ControlP5(this);
  setOrientacaoV = new ControlP5(this);
  //Botão Horizontal
  setOrientacaoH.addButton("Horizontal")
    .setValue(1)
    .setPosition(600,300)
    .setSize(75,20);
    //.setColorBackground(color(135,206,250));
  //Botão Horizontal
  setOrientacaoV.addButton("Vertical")
    .setValue(0)
    .setPosition(676,300)
    .setSize(75,20);
    //.setColorBackground(color(135,206,250));
}

void botaoPaletas (){
  setPaleta = new ControlP5(this);
     
  //Button setPaleta
  setPaleta.addButton("Paletas")
    .setValue(0)
    .setPosition(640,200)
    .setSize(80,20);
}

void knobArranjo(){
  knobArranjo = new ControlP5(this);
  
   //Knob Arranjo de cores
  knobArranjo.addKnob("Arranjo")
    .setRange(0,999)
    .setValue(39)
    .setPosition(625,50)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
    //.setColorBackground(color(135,206,250));
};

void sliderTriangulos(){
 sliderT = new ControlP5(this);
  
 //Slider Quantidade de triangulos Horizontais;
 sliderT.addSlider("Triangulos")
     .setPosition(600,400)
     .setWidth(150)
     .setHeight(20)
     .setRange(0,6) // values can range from big to small as well
     .setValue(0)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE);
     sliderT.hide();
}

void toggleI(){
 toggleIntercalar  = new ControlP5(this);
 //Toggle intercalar
 toggleIntercalar.addToggle("Intercalar")
     .setPosition(600,350)
     .setSize(150,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH);
     toggleIntercalar.hide();
}