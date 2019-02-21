// VARIÁVEIS FIXAS
float eInicialX, eInicialY; // FIXO - Espaçamento inicial em X e Y - Fixo.
float pComumXD, pComumXE, pComumYC, pComumYB; // FIXO - Pontos de encontro comum dos triangulos. X para obra Horizontal e Y para Vertical
int espaco = 42; // FIXO - Variável de espaçamento na obra vertical
float h, h2, l, l2; // FIXO - Módulos para referenciar os outros triangulos na obra Vertical
int cor;                        
color [] c  = new color [9]; //Vetor que armazena cores

// VARIÁVEIS QUE PODEM SER ALTERADAS
int paleta = 0; // 0 - Proposição emblematica V(PE), 1 - PE Vertical, 2 - PE X
int arranjo = 39; // Sem limite - O valor combina as cores da paleta escolhida de forma diferente.
int Triangulos = 6; // MAXIMO - 6 (VERTICAL APENAS) Variável para quantidades de triangulos desenhados na obra VERTICAL (MAX 7 DE CADA LADO)
boolean intercalarHorizontal = false; //(VERTICAL APENAS) // true or false. Intercala cores da obra com cor branca VERTICAL.
int reguladorAltura = 20, reguladorLargura = 20; //De preferencia os 2 com mesmo valor!
// 0 - A obra fica o mais fidedigno dos calculos mátemáticos. Acima de 0 há alterações nas alturas dos triangulos.
int orientacao = 0; //Obra vertical(0) ou horizontal(1)
boolean mostrar = true;


void setup (){
  noStroke();
  size (800,600);
  eInicialX = 300; 
  eInicialY = 300; 
  pComumXE= 300 - eInicialX;
  pComumXD = 300 + eInicialX;
  pComumYC = 300 - eInicialY;
  pComumYB = 300 + eInicialY;
  
  h = 300;
  h2= 300;
  l = 300;
  l2 = 300;
  //Iniciar a interatividade
  //Botões Horizontal - Vertical
  botoesOrientacao();
  //Botão de paleta
  botaoPaletas();
  //Manivela de arranjo
  knobArranjo();
  // Slider de quantidade de triângulos
  sliderTriangulos();
  //Switch Intercalar
  toggleI();
}


void draw (){
  
  

  
  randomSeed(arranjo); // Disposição das cores
  background(120,120,120); 
  fill(255,255,255);
  text("Por Iago Gomes",width-130,height-20);
  fill(135,206,250); // anterior 120,200,200
  ellipse(300,300,560,560); 
  paletaCores(paleta);
  for (int j=0; j <6; j++){
   fill(c[j]);
   rect(620+j*20,230,20,20,5);
  }
  
     switch(orientacao){
       case 0: // Vertical
         desenhaObraVertical();
       break;
       
       case 1: //Horizontal
         adicionaTriangulo(Triangulos);
       break; 
     };
      //gui();
      if (keyPressed == true)
        if (keyCode ==39)
          mostrar = false;
          
  
};






color escolhaCor (){
  //O programa escolhe uma das cores da obra armazenadas em um vetor;
    cor = c[int(random(0,6))];
   return cor;
}



void desenhaObraVertical(){
  color j = escolhaCor();
  //triangulo principal de cima
  fill(escolhaCor()); 
  triangle(pComumXE+reguladorLargura, 300,300,(h-h)+reguladorAltura, pComumXD-reguladorLargura,300);
  //triangulo principal de baixo
  fill(escolhaCor());
  triangle(pComumXE+reguladorLargura, 300,300,h2 + h2-reguladorAltura,pComumXD-reguladorLargura,300);
  
  //Triangulo 2 cima  
  fill(escolhaCor());
  triangle(pComumXE+reguladorLargura, 300,300,h -(0.866*h)+reguladorAltura, pComumXD-reguladorLargura,300);
  //Triangulo 3 cima
  fill(escolhaCor());
  triangle(pComumXE+reguladorLargura, 300,300,h -(0.6 * h)+reguladorAltura, pComumXD-reguladorLargura,300);
  // triangulo 4 cima
  fill(j);
  triangle(pComumXE+reguladorLargura, 300,300,h - (0.18 * h)/*+reguladorAltura*/, pComumXD-reguladorLargura,300);
  //triangulo 5 (Em baixo)
  triangle(pComumXE+reguladorLargura, 300,300,h2 +(0.31 * h2)-reguladorAltura, pComumXD-reguladorLargura,300);

}




void adicionaTriangulo(int qntTriangulo){
   
   for (int i = 0; i <= qntTriangulo; i++){
   if (i == 1){
     espaco = 24;
   }
   if (i > 1){
     espaco = 42;
   }
   //
    if (intercalarHorizontal){
     //Intercalar com branco
       if (i % 2 != 0){
         fill(226,224,203);
       }
    }else {
      //Programa escolhe uma cor
         fill(escolhaCor());
   }
   if (i == 0){
     //Cor fixa na borda
     fill(86,45,91);
   }
   if (i == qntTriangulo){
     fill(238,238,230); // Branco central contido na obra
   }
 
   //Triangulo direito
   triangle(l2,pComumYC+reguladorAltura, l2+l2 - espaco*i-reguladorLargura, 300, l2,pComumYB-reguladorAltura);
  
   if (i == qntTriangulo){
    //Preencher com branco central contido na obra 
     fill(238,238,230); 
   } else {
     //Programa escolha uma cor
     fill(escolhaCor());
   };
   
   if (i ==0){
     //Cor fixa na borda
     fill(60,47,137);
   };
   
    if (intercalarHorizontal){
     //Intercalar com branco
       if ((i % 2 == 0) && (i != qntTriangulo)){
         fill(226,224,203);
       }
    };
       
   //Triangulo esquerdo
   // l = widht/2
   triangle(l,pComumYC+reguladorAltura, l-l + espaco*i+reguladorLargura, 300, l,pComumYB- reguladorAltura);
 };
};

void paletaCores (int paleta){
  // A partir da variavel paleta é possivel escolher quais cores aparecerão na obra.
  switch (paleta){
   case 0:
        //Cores proposição Emblemática V
     c[0] = color(126,43,87); // Roxo
     c[1] = color(53,45,66);  //Azul escuro
     c[2] = color(130,76,102); // Rosa escuro
     c[3] = color(205,180,77); // Amarelo 
     c[4] = color(70,58,68);  //Cinza
     c[5] = c[1]; //Azul escuro
   break;
   
   case 1:
       
         //Cores Proposição emblemática vertical
       c[0] = color (84,151,196); // Azul (Antes Roxo)
       c[1] = color(154,92,93); // Vermelho bege
       c[2] = color (189,174,78); //Amarelo Queimado
       c[3] = color (1,160,75); // Verde
       c[4] = color (240,235,205); // Quase branco
       c[5] = color (133,142,197); // Violeta (Antes azul)
     break;
     
     case 2:
     
          //Cores Proposição emblemática X
       c[0] = color (67,63,75); // Cinza
       c[1] = color(2,84,131); //  Azul mais claro
       c[2] = color (40,41,48); //Cinza Escuro
       c[3] = color (58,60,127); // Azul escuro
       c[4] = color (19,24,34); // Preto
       c[5] = c[2]; // Violeta (Antes azul)
     break;
  };
};


/*void gui (){
   /// GUI ANTERIOR
  if (mostrar){
  textSize(20);
  fill(0);
  rect(430,50,120,25); // Quadrado
  String textoPaleta = "Paletas";
  fill(255);
  text(textoPaleta,450,70);
  rect(550,50,25,25); // Botão
  fill(0);
  text(">", 555,68);
  //Paleta
  paletaCores(paleta);
  for (int j=0; j <6; j++){
    fill(c[j]);
    rect(430+j*20,80,20,20,5);
  }
  
  // Trocar cores de lugar - Arranjo
  fill(0);
  rect(50,50,120,25);
  fill(255);
  text("Arranjo",70,70);
  //Quadrado botao
  rect(170,50,25,25);
  fill(0);
  text(">",175,68);
  
  // Intercalar
  if (orientacao == 1){
    fill(0);
    rect(50,500,120,25); // Quadrado
    fill(255);
    //rect(25,500,25,25); //Botão não
    rect(170,500,25,25); // Botão sim
    text(" Intercalar",60,520);
    fill(0);
    text(">",175,518);
  }
  
  //Orientação 
  String texto;
    if (orientacao == 0){
      texto = "  Vertical";
    }  else {
      texto = "Horizontal";
    }
  //Quadrado  
  fill(0);
  rect(50,550,120,25); 
  //Texto
  fill(255);
  text(texto, 55,570);
  //quadrado botao
  rect(170,550,25,25);
  fill(0);
  text(">",175,568);
  
  if (orientacao == 1){
    //rect(430,50,120,25); // Quadrado paletas
    fill(0);
    rect(430,500,120,25);
    fill(255);
    text("Triângulos", 440,520);
    rect(550,500,25,25); // Quadrado +
    rect(405,500,25,25); // Quadrado -
    //textos
    fill(0);
    text("+",555,520);
    text("-",412,520);
  }
  
  //Dimensão
  fill(0);
  rect(430,550,120,25);
  fill(255);
  text("Dimensão",440,568);
  rect(550,550,25,25); // Quadrado +
  rect(405,550,25,25); // Quadrado -
  fill(0);
  text("+",555,568);
  text("-",412,568);
  
  };
}; */
