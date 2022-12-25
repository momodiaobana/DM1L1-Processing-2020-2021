size(400, 400);
background(237, 228, 237);
fill(240, 34, 34);
triangle(295, 110, 168, 3, 31, 110);
fill(18, 10, 10);
textSize(15);
text("Bienvenue \nWelcome \nBenvenido ", 64, 293, 263, 140);
noFill();
rect(50, 110, 224, 128);//Premier étage
stroke(0);
fill(112, 58, 58);
rect(73, 192, 52, 81);//porte prmier étage
noFill();
rect(171, 136, 80, 40);//fenêtre grand cadre 
rect(171, 136, 40, 20);//fenêtre petit cadre
rect(211, 156, 40, 20);//fenêtre petit cadre
rect(50, 238, 224, 36);// Balcon
rect(50, 274, 224, 100);//rez de chaussé
fill(163, 111, 111);
rect(274, 295, 92,79);// Garage
fill(112, 58, 58);
rect(200, 293, 52, 81);//porte d'entrée
noFill();
fill(255, 0, 0); // couleur des barres
noStroke();
rect(65, 239, 8, 36);// barre balcon 1 
rect(96, 239, 8, 36);// barre balcon 2 
rect(127, 239, 8, 36);// barre balcon 3 
rect(154, 239, 8, 36);// barre balcon 4 
rect(185, 239, 8, 36);// barre balcon 5 
rect(219, 239, 8, 36);// barre balcon 6 
rect(247, 239, 8, 36);// barre balcon 7 
stroke(0);
line(251, 74, 251, 9);// Ligne du toit à côté de la cheminé
fill(240, 34, 34);
triangle(406, 257, 252, 11, 365, 254);// Pente du toit
noFill();
rect(366, 255, 32, 118);
ellipse(317, 246, 69, 82);//fenêtre2 grand cadre 
line(282, 251, 351, 251);//Fenêtre 2 ligne horizontale
line(316, 285, 316, 205);//Fenêtre 2 ligne verticale
fill(194, 128, 120);//Couleurs des troncs d'arbres
rect(14, 339, 12, 58);// tronc d'abre 1 devant la maison
rect(14, 169, 12, 58);// tronc d'arbre 2 vers la piscine
rect(356, 65, 12, 58);// tronc d'arbre 3 à l'arrière
noStroke();
fill(44, 186, 56);//Couleur des feuilles des arbres
arc(30, 334, 20, 43, radians(-296), radians(115));// Partie droite arbre 1 
arc(11, 334, 20, 43, radians(-487), radians(-59));// Partie gauche arbre 1
arc(20, 311, 20, 43, radians(-378), radians(3));// Partie supérieur arbe 1
arc(30, 164, 20, 43, radians(-343), radians(115));// Partie droite arbre 2
arc(11, 164, 20, 43, radians(-430), radians(-59));// Partie gauche arbre 2
arc(20, 143, 20, 43, radians(-382), radians(3));// Partie supérieur arbre 2
arc(371, 59, 20, 43, radians(-245), radians(115));// Partie droite arbre 3
arc(353, 60, 20, 43, radians(-432), radians(-59));// Partie gauche arbre 3
arc(361, 37, 20, 43, radians(-370), radians(3));// Partie supérieur arbre 31
fill(34, 150, 30);//Couleur du jardin
noStroke();
rect(-5, 375, 415, 67);// Verdure de la devanture (le jardin)
fill(0, 213, 255);//eau de la piscine 
quad(11, 90, 98, 48, 85, 0, 5, 30);// La piscine
fill(255, 27, 97);//Couleur de la cheminé
rect(216, 26, 16, 44);// La cheminé
fill(179, 114, 114);// couleur de la fumée
ellipse(226, 9, 15,-10);// 
ellipse(218, 9, 15,-10);
ellipse(224, 15, 15,-10);
fill(255, 255, 0);
ellipse(300, 25, 50, 50);//Le Soleil
noFill();
stroke(0);
arc(82, 321, 50, 86, radians(109), radians(335));// Partie gauche du coeur
arc(129, 321, 50, 86, radians(206), radians(420));// Partie droite du coeur
line(367, 295, 274, 295);// pancard de la piscine
line(114, 35, 114, 16);// pied du pancard
rect(96, 5, 40, 10);
fill(0);
strokeWeight(0);
textSize(10);
text("PISCINE", 98, 5, 60, 25);
stroke(242, 234, 238);
strokeWeight(10);
point(252, 341);//Poignée de la porte d'entrée
point(124, 235);// Poignée de la porte à l'étage
save("GMEDM1_DIAO_Mouhamed_Mountaga.png");
