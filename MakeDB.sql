CREATE TABLE IF NOT EXISTS Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(90) NOT NULL,
    presentacion MEDIUMTEXT NOT NULL,
    imgURL VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS BoostrapBG (
    id INT PRIMARY KEY AUTO_INCREMENT,
    clase VARCHAR(15) NOT NULL
);


CREATE TABLE IF NOT EXISTS RedesSociales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    socialURL VARCHAR(255) NOT NULL,
    
    usuarioFK INT NOT NULL,
    FOREIGN KEY (usuarioFK) REFERENCES Usuarios(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS Educacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    institucion VARCHAR(90) NOT NULL,
    titulo VARCHAR(125) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE,
    tituloURL VARCHAR(255),
    
    usuarioFK INT NOT NULL,
    FOREIGN KEY (usuarioFK) REFERENCES Usuarios(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Habilidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    porcentaje INT(6) NOT NULL,

    usuarioFK INT NOT NULL,
    boostrapFK INT,

    FOREIGN KEY (usuarioFK) REFERENCES Usuarios(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (boostrapFK) REFERENCES BoostrapBG(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Proyectos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    imgURL VARCHAR(255) NOT NULL,
    proyectoURL VARCHAR(255) NOT NULL,
    nombre VARCHAR(90) NOT NULL,
    descripcion VARCHAR(125) NOT NULL,

    usuarioFK INT NOT NULL,
    FOREIGN KEY (usuarioFK) REFERENCES Usuarios(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);




INSERT INTO Usuarios(nombre, presentacion, imgURL) VALUES
("Franco Angeletti", " Estudiante de la Escuela Secundaria Técnica N°4 (con orientación electro-mecánica), actualmente, cursando el último año de la carrera. Al concluir con mi formación secundaria, pienso seguir estudiando una carrera de grado (Ing. en Sistemas) y, si me es posible, trabajar a la vez.\n Mis hobbies son; la tornería (en mi taller personal), ir al gimnasio y la programación (desde full-stack hasta programador de micro-controladores).", "https://i.ibb.co/2nR319g/franco.jpg");

INSERT INTO BoostrapBG(clase) Values 
  ("primary"),
  ("secondary"),
  ("success"),
  ("danger"),
  ("info"),
  ("light"),
  ("warning"),
  ("dark");



INSERT INTO RedesSociales(nombre, socialURL, usuarioFK) VALUES
  ("Twitter", "https://twitter.com/FranAn91947409", 1),
  ("Discord", "https://discord.gg/RYy9PFuaCh", 1),
  ("Instagram", "https://www.instagram.com/frannangele/", 1),
  ("GitHub", "https://github.com/FNA2003", 1);
  
INSERT INTO Educacion(institucion, titulo, fechaInicio, fechaFin, tituloURL, usuarioFK) VALUES
  ("Secundaria Técnica N°4 (Zárate)", "Técnico Electro-mecánico", "2016-01-01", null, null, 1),
  ("Argentina Programa (#Se Programar)", "Programador minnor", "2021-01-01", "2022-01-01", "https://drive.google.com/file/d/1dclSk9aaelPNq2Jeb8dTNwsKKEjRK_He/view?usp=share_link", 1),
  ("HardvardX Course (CS50's Web Programming Course)", "Web programmer with python and JavaScript", "2021-01-01", "2022-01-01", "https://courses.edx.org/certificates/34003022674d41428a821bcc0bfe2ee7", 1),
  ("HardvardX Course (CS50's Computer Science Course)", "Computer science programmer", "2020-01-01", "2021-01-01", "https://courses.edx.org/certificates/af93016df87c43558449947b8f8579df", 1);
  
INSERT INTO Habilidades(nombre,porcentaje,usuarioFK,boostrapFK) VALUES
  ("Cooperador", 50, 1, 3),
  ("Pro-activo", 80, 1, 7),
  ("Comprometido", 100, 1, 1),
  ("Iniciador", 25, 1, 4),
  ("Predispuesto", 50, 1, 5),
  ("Responsable", 100, 1, 2);
  
INSERT INTO Proyectos(imgURL,proyectoURL,nombre,descripcion,usuarioFK) VALUES
  ("https://i.ibb.co/JBCNQj7/documentation.png", "https://codepen.io/P4nuch0/full/wvrLKVE", "Documentación", "Una página minimalista de la documentación de JavaScript", 1),
  ("https://i.ibb.co/XZFFBzd/portfolio.png", "https://codepen.io/P4nuch0/full/wvrLbZz", "Portfolio", "Una primera versión de un portfolio", 1),
  ("https://i.ibb.co/mvQdQsT/tribute.png", "https://codepen.io/P4nuch0/full/KKXEBaj", "Tributo", "Una página donde podemos explorar información del salvador de las Américas, Jose de San Martin", 1),
  ("https://i.ibb.co/LgrQ54w/e-commerce.png", "https://codepen.io/P4nuch0/full/poWmPJP", "E-commerce", "Una página estática donde podremos ver el template de e-commerce", 1);