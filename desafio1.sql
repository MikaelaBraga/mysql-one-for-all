DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE Planos (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_assinado VARCHAR(20) UNIQUE NOT NULL,
    valor_plano DECIMAL(3 , 2 ) NOT NULL
)  engine = InnoDB;

INSERT INTO Planos(plano_assinado, valor_plano)
VALUES ('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99);

CREATE TABLE Usuários (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(20) UNIQUE NOT NULL,
    idade_usuario INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES Planos (plano_id)
)  engine = InnoDB;

INSERT INTO Usuários(nome_usuario, idade_usuario, plano_id)
VALUES ('Thati', 23, 1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);

CREATE TABLE Artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(20) UNIQUE NOT NULL
)  engine = InnoDB;

INSERT INTO Artistas(nome_artista)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

CREATE TABLE Álbuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(30) UNIQUE NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artistas (artista_id)
)  engine = InnoDB;

INSERT INTO Álbuns(nome_album, artista_id)
VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);

CREATE TABLE Canções (
    cancoes_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(40) UNIQUE NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES Álbuns (album_id)
)  engine = InnoDB;

INSERT INTO Canções(nome_cancao, album_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ('Sweetie, Let/\s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey, Let/\s Be Silly', 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

CREATE TABLE Histórico_Reprodução (
    usuario_id INT NOT NULL,
    cancoes_id INT NOT NULL,
    FOREIGN KEY (usuario_id)
        REFERENCES Usuários (usuario_id),
    FOREIGN KEY (cancoes_id)
        REFERENCES Canções (cancoes_id)
)  engine = InnoDB;

INSERT INTO Histórico_Reprodução(usuario_id, cancoes_id)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),
    (3, 4),
    (3, 16),
    (3, 6),
    (4, 3),
    (4, 18),
    (4, 11);

CREATE TABLE Seguidores_Artistas (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artistas (artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuários (usuario_id)
)  engine = InnoDB;

INSERT INTO Seguidores_Artistas(usuario_id, artista_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);
