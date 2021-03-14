float x, y;
boolean moveBegins = false;
void setup(){
  size (600,425);
  frameRate(60);
  x = width/2;
  y = height/2;
}
float xdirection = 1.0, ydirection = 1.0; //VARIABLES GLOBALES
void draw(){
  background(200,0,0);
  float speedx = 3.0, speedy= 3.0;
  circle(x,y, 50);
  if(moveBegins == true){
    x = x +(speedx* xdirection);
    y = y +(speedy* ydirection);     
    if (x > width-25 || x < 25)
      xdirection *= -1;
    if (y > height-25 || y < 25)
      ydirection *= -1;
  }
  
}
   
void mousePressed(){
  moveBegins = true;
  float x_move = mouseX, y_move = mouseY; //VALORES DE LA COORDENADA DEL MOUSE
  float valory = 1, valorx = 1; //VALORES A UTILIZAR PARA EL EL ANGULO DE LA PENDIENTE
  if(y_move > y) //SI ES QUE LA COORDENADA DE Y DEL MOUSE ES MAYOR QUE DONDE SE ENCUENTRA LA POSICION, ENTONCES LA PELOTA TENDRÁ QUE VIAJAR HACIA -Y
    valory = -1;
  if(x_move < x)//LO MISMO SUCEDE CON X
    valorx = -1;
  if((x_move < x && y_move > y) || (x_move > x && y_move < y)){ //SI CUMPLE CON ESTOS DOS ENTONCES VA A DAR UNA INDETERMINACION EN LA DIVISION
    direcciones(valorx, valory, atan((y_move-y)/(x_move-x))); //CALCULAMOS EL VALOR DEL ANGULO CON LA FORMULA ANGULO=ATAN(PENDIENTE)
  }
  else{//SINO CUMPLE, ENTONCES HAY QUE REAJUSTAR LOS VALORES EN LA FORMULA PARA DETERMINAR EL ANGULO CORRESPONDIENTE
    direcciones(valorx, valory, -atan((y-y_move)/(x-x_move)));//CALCULAMOS EL VALOR DEL ANGULO CON LA FORMULA ANGULO=ATAN(PENDIENTE)
  }
}
void direcciones(float cos1, float sin1, float angle){//DETERMINAMOS EL "VECTOR" DE NUESTRO ANGULO CON LA IDENTRIDAD TRIGONOMETICA ATAN= COS/SIN; COS1= X, SIN= Y
    xdirection = cos1*cos(angle);
    ydirection = sin1*sin(angle);
}
void mouseReleased(){
  loop();
}
