///////////////////////////////////////////////////// //<>// //<>//
//
// Visualiseur d'Art Polygonal
// DM2 "UED 131 - Programmation impérative" 2020-2021
// NOM         : DIAO
// Prénom      : Mouhamed Mountaga
// N° étudiant : 20205542
//
// Collaboration avec : 
//
/////////////////////////////////////////////////////

//
// les variables globales
//
String nom, fileChoiced;
int largeur, hauteur, compteurFaces, compteurAretes, compteurSommets ;
boolean verif;
//
//

void setup() {
  size(800, 800);
  background(255);
  textSize(20);
  fill(255, 0, 0);
  text("veuillez appuyer sur la touche o pour sélectionner un fichier", 100, height/2);

}

//
// boucle de rendu
//
void draw() {
  if (verif == true) {
    background(255);
    litFichier(fileChoiced);
    afficheInfo();
    textSize(13);
    text("Appuyer sur A si vous voulez modifier la taille des arêtes", 0, height-110);
    text("Appuyer sur E si vous voulez faire une mise en échelle", 0, height-90);
    text("Appuyer sur O si vous voulez ouvrir un autre fichier", 0, height-70);  
    text("Appuyer sur R si vous voulez appliquer une rotation", 0, height-50);
    text("Appuyer sur S si vous voulez sauvegarder l'image", 0, height-30);
    text("Appuyer sur T si vous voulez modifier la taille des sommets", 0, height-10);
  }
  verif = false;
  //On remet à zéro ces variables pour éviter l'accumulation de leurs valeurs 
  largeur = 0;
  compteurAretes = 0;
  compteurSommets = 0;
  compteurFaces = 0;
  hauteur = 0;
}
//
// Gère l'interaction clavier
// --------------------------
/* 'o' : charge une image
   's' : sauvegarde l'image*/
//

void keyTyped() {
  //mise à jour du fond d'écran  pour afficher du text
  background(255);
  if (key == 'o' || key == 'O') {
    //text qui s'affiche après que l'utilisateur ait appuyer sur 'o' ou 'O', la couleur du text ainsi que sa taille
    textSize(20);
    fill(255, 0, 0);
    text("Sélection du fichier en cours...", 250, height/2);
    selectInput("séléctionnez le fichier à afficher", "fichierSelectionne");
    //Sauvegarde de l'image une fois que l'utilisateur appuie sur 's' ou 'S'
  } else if ( key == 's' || key == 'S') { 
    //Image à sauvegarder
    litFichier(fileChoiced);
    afficheInfo();
    //text qui notifie la réussite de la sauvegarde et donne l'instruction à suivre pour sélectionner un autre fichier à ouvrir
    save("test.arp");
    textSize(20);
    //fill(255, 0, 0);
    text("Image Sauvegarder avec succès!", 200, height-30);
    text("Appuyer sur 'O' si vous voulez ouvrir un autre fichier", 200, height-5);
  }
  else{
    //Text qui s'affiche à l'écran lorsque l'utilisateur appuie sur une mauvaise touche
    textSize(20);
    fill(255, 0, 0);
    text("veuillez appuyer sur la touche 'O' pour sélectionner un fichier",100, height/2);
  }
}

//
// Sélectionne l'image à afficher
// ------------------------------
// selection : le fichier renvoyé par la boîte de dialogue d'ouverture du fichier
//
void fichierSelectionne(File selection) {
  verif = true; 
  if (selection != null) 
    fileChoiced = selection.getAbsolutePath();
}


//
// Lit l'entete du fichier
// -----------------------
// fichier : le fichier d'entrée
//
void litEntete(BufferedReader fichier) {
  try {
    String s0 = fichier.readLine();
    String s1 = fichier.readLine();
    nom = s1;
    String s2 = fichier.readLine();
    largeur = int (s2);
    String s3 = fichier.readLine();
    hauteur = int (s3);
    String s4 = fichier.readLine();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}


//
// Affiche le sommet
// -----------------
/* x, y : les coordonnées (x,y) du sommet
tab1 : tableau contenant l'ensemble des sommets à afficher
tab1[0][i] : couleur des sommets
tab1[1][i] : taille des sommets
*/

void afficheSommet(int [][] tab1) {
  for (int i = 0; i< 500; i++) {
    stroke(tab1[0][i]);
    strokeWeight(tab1[1][i]);
    int x = tab1[2][i];
    int y = tab1[3][i];
    point(x, y);
  }
}

//
// Lit les caractéristiques d'un sommet et affiche le sommet
// ---------------------------------------------------------
// fichier : le fichier d'entrée
//tabSommet : tableau stockant l'ensemble de sommets lu
void litSommet(BufferedReader fichier) {
  try {
    // lit le sommet
    String s1 = fichier.readLine();
    int val1 = unhex(s1);
    color couleur  = color(val1);
    String s2 = fichier.readLine();
    int taille = int (s2);
    String s3 = fichier.readLine();
    int x = int (s3);
    String s4 = fichier.readLine();
    int y = int(s4);
    int [][] tabSommet = new int [4][500];
    for (int i = 0; i< 500; i++) {
      tabSommet[0][i] = couleur;
      tabSommet[1][i] = taille;
      tabSommet[2][i] = x;
      tabSommet[3][i] = y;
    }
    //affiche les sommets 
    afficheSommet(tabSommet);
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}


//
// Affiche l'arête
// ---------------
// x1, y1 : les coordonnées (x1,y1) d'une extrémité du segment 
// x2, y2 : les coordonnées (x2,y2) de l'autre extrémité du segment 
// tab[1][j] : la taille du segment
// tab[0][j] : la couleur du segment
//

void afficheArete(int [][] tab) {
  for (int j = 0; j<500; j++) {
    stroke(tab[0][j]);
    strokeWeight(tab[1][j]);
    //tracé de l'arête avec respectivement les coordonnées x1, y1, x2, y2
    line(tab[2][j], tab[3][j], tab[4][j], tab[5][j]);
  }
}


//
// Lit les caractéristiques d'une arête et affiche l'arête
// -------------------------------------------------------
// fichier : le fichier d'entrée
//
void litArete(BufferedReader fichier) {
  try {
    // lit l'arête
    String s1 = fichier.readLine();
    int val2 = unhex(s1);
    color couleur  = color(val2);
    String s2 = fichier.readLine();
    int epaisseur = int (s2);
    String s3 = fichier.readLine();
    int x1 = int (s3);
    String s4 = fichier.readLine();
    int y1 = int(s4);
    String s5 = fichier.readLine();
    int x2 = int (s5);
    String s6 = fichier.readLine();
    int y2 = int(s6);

    //tableaux permettent de stocker en mémoire l'ensemble des arêtes
    int [][] tabArete = new int [6][500];
    for (int i =0; i< 500; i++) {
      tabArete[0][i] = couleur;
      tabArete[1][i] = epaisseur;
      tabArete[2][i] = x1;
      tabArete[3][i] = y1;
      tabArete[4][i] = x2;
      tabArete[5][i] = y2;
    }
    afficheArete(tabArete);
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}


//
// Lit les caractéristiques d'une face et affiche la face
// ------------------------------------------------------

/*void afficheFace(int [][] tab3) {  
 fill(tab3[0][compteurFaces]);
 int test = 2;
 beginShape();  
 vertex(tab3[2][compteurFaces], tab3[3][compteurFaces]);
 for (int j = 0; j<tab3[1][compteurFaces]; j+=2) { 
 vertex(tab3[test][compteurFaces], tab3[test+1][compteurFaces]);
 test+=2;
 }
 vertex(tab3[2][compteurFaces], tab3[3][compteurFaces]);
 endShape();
 }
*/
 
// fichier : le fichier d'entrée
/*Fonction permettant de lire et d'afficher les faces
fichier : le fichier d'entrée
*/
void litEtAfficheFace(BufferedReader fichier) {
  try {
    String f1 = fichier.readLine();
    int val3 = unhex(f1);
    color couleur  = color(val3);
    String f2 = fichier.readLine();
    int nbrPoint = int (f2);
    String f3 = fichier.readLine();
    String f4 = fichier.readLine();
    int x1 = int(f3);
    int y1 = int(f4);
    //couleur des faces
    fill(couleur);
    //début du tracé des polygones
    beginShape();
    vertex(x1, y1);
    for (int i = 1; i<nbrPoint; i++) {
      String f5 = fichier.readLine();
      String f6 = fichier.readLine();
      int x = int(f5);
      int y = int(f6);
      vertex(x, y);
    }
    vertex(x1, y1);
    //fin du tracé
    endShape();
     /*String line1 = fichier.readLine();
     int val3 = unhex(line1);
     color couleur  = color(val3);
     String nbreSommet = fichier.readLine();
     int [][] tabFace = new int [22][500];
     tabFace[0][compteurFaces] = couleur;
     tabFace[1][compteurFaces] = int(nbreSommet);
     for (int j =2; j< tabFace[1][0]; j+=2) {
     String x = fichier.readLine();
     String y = fichier.readLine();
     tabFace[j][compteurFaces] = int(x);
     tabFace[j+1][compteurFaces] = int(y);
     }
     afficheFace(tabFace);
    }*/

  }

  catch (IOException e) {
    e.printStackTrace();
  }
}


//
// dessine le cartouche d'information
//Permet d'affiche les infos contenu dans les différents fichiers ouverts 
void afficheInfo() {
  if (nom.equals("flamant2")||nom.equals("flamant3")) { 
    if (nom.equals("flamant2"))
      noFill();
    rect(540, 0, 300, 160);
    fill(0);
    textSize(20);
    text("Nom : ", 550, 25);
    text(nom, 615, 25);
    text("Largeur : ", 550, 50);
    text(largeur, 640, 50);
    text("Hauteur : ", 550, 75);
    text(hauteur, 645, 75);
    text("Nombre de faces : ", 550, 100);
    text(compteurFaces, 730, 100);
    text("Nombre de sommets : ", 550, 125);
    text(compteurSommets, 770, 125);
    text("Nombre d'arêtes : ", 550, 150);
    text(compteurAretes, 725, 150);

  } 
  else {
    rect(0, 0, 300, 155);
    fill(0);
    textSize(20);
    text("Nom : ", 5, 25);
    text(nom, 75, 25);
    text("Largeur : ", 5, 50);
    text(largeur, 98, 50);
    text("Hauteur : ", 5, 75);
    text(hauteur, 98, 75);
    text("Nombre de faces : ", 5, 100);
    text(compteurFaces, 185, 100);
    text("Nombre de sommets : ", 5, 125);
    text(compteurSommets, 225, 125);
    text("Nombre d'arêtes : ", 5, 150);
    text(compteurAretes, 180, 150);
    
  }

}
//
// lit le fichier sélectionné
// --------------------------
// fichier : le nom du fichoier à lire
//
void litFichier(String fichier) {
  // ouverture du fichier
  BufferedReader input = createReader(fichier);
  //lecture de l'entete du fichier 
  litEntete(input);
  try {
    // lecture du fichier
    //lecture de la balise ouvrante du fichier 
    String s = input.readLine();
    //boucle permettant de lire le fichier en entier
    while (s != null) {
      //condition permettant de vérifier si il faut lire une arête, un sommet ou une face
      if (s.equals("<sommet>")) {
        litSommet(input);
        compteurSommets +=1;
      } else if ((s.equals("<arete>"))) { 
        litArete(input);
        compteurAretes +=1;
      } else if ((s.equals("<face>"))) { 
        litEtAfficheFace(input);
        compteurFaces +=1;
      }
      s = input.readLine();
    }
    //fermeture du fichier
    input.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
