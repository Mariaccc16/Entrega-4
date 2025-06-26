// Nombre: María Camila Serrato //<>//
// Código: 202410329
// En lugar de mostrar el tiempo con relojes o números, esta visualización lo representa con bolitas que se
// van acumulando. Cada línea representa una unidad de tiempo: segundos, minutos, horas, días, meses y años.
// Las letras iniciales ayudan a ubicarse (cuales corresponden a cuales)

void setup() {
  size(600, 700);
  noStroke();
}

void draw() {
  background(0);

  // Inicializar variables/ Obtener los datos del sistema

  int s = second();
  int m = minute();
  int h = hour();
  int d = day();
  int mth = month();
  int año = year() % 100; // año actual dividido 100 -> residuo = numBolitas de año. (En vez de 2025 bolitas son 25)

  // Posición horizontal desde donde empiezan las letras

  float baseX = (width - 200) / 2;

  strokeWeight(6);

  // Letras hechas con líneas simples

  // S
  stroke(120, 180, 220, 255);
  line(baseX, 80, baseX + 20, 80);
  line(baseX, 80, baseX, 100);
  line(baseX, 100, baseX + 20, 100);
  line(baseX + 20, 100, baseX + 20, 120);
  line(baseX, 120, baseX + 20, 120);

  // M
  stroke(130, 170, 130, 255);
  line(baseX, 180, baseX, 220);
  line(baseX, 180, baseX + 10, 200);
  line(baseX + 10, 200, baseX + 20, 180);
  line(baseX + 20, 180, baseX + 20, 220);

  // H
  stroke(160, 160, 190, 255);
  line(baseX, 280, baseX, 320);
  line(baseX + 20, 280, baseX + 20, 320);
  line(baseX, 300, baseX + 20, 300);

  // D
  stroke(220, 200, 120, 255);
  line(baseX, 380, baseX, 420);
  line(baseX, 380, baseX + 20, 385);
  line(baseX + 20, 385, baseX + 20, 415);
  line(baseX + 20, 415, baseX, 420);

  // E -> mes
  stroke(190, 140, 100, 255);
  line(baseX + 20, 480, baseX, 480);
  line(baseX, 480, baseX, 520);
  line(baseX, 500, baseX + 15, 500);
  line(baseX, 520, baseX + 20, 520);

  // A
  stroke(200, 200, 200, 255);
  line(baseX, 620, baseX + 10, 580);
  line(baseX + 10, 580, baseX + 20, 620);
  line(baseX + 5, 605, baseX + 15, 605);

  noStroke();

  // Bolitas
  // cantidad en este caso equivale a el valor de las variables (s,m,h,d,mth,año)
  // dibujarTiempo(cantidad, posX, posY, color);

  dibujarTiempo   (s, baseX + 100, 80, color(120, 180, 220));
  dibujarTiempo   (m, baseX + 100, 180, color(130, 170, 130));
  dibujarTiempo   (h, baseX + 100, 290, color(160, 160, 190));
  dibujarTiempo   (d, baseX + 100, 390, color(220, 200, 120));
  dibujarTiempo   (mth, baseX + 100, 500, color(190, 140, 100));
  dibujarTiempo   (año, baseX + 100, 590, color(200));
}

// Dibuja las bolitas acumuladas según cantidad

void dibujarTiempo(int cantidad, float x, float y, color c) {

  int cols = 15; // columnas por fila

  // cantidad = (se define como el número correspondiente de s, m, …)

  // i empieza en 0, y mientras sea menor que la cantidad (s, m, h, etc.), se repite sumando 1 cada vez (i++)

  for (int i = 0; i < cantidad; i++) {
    float bolitaX = x + (i % cols) * 8; // "8" separa las bolitas horizontalmente
    float bolitaY = y + (i / cols) * 10; // "10" separa las bolitas verticalmetne

    // c reponde al color de cada dibuajrtiempo
    fill(c);
    ellipse(bolitaX, bolitaY, 6, 6);
  }
}
