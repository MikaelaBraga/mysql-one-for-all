DELIMITER $$

CREATE PROCEDURE albuns_do_artista(nome_artista VARCHAR(20))
BEGIN
SELECT art.nome_artista AS `artista` FROM SpotifyClone.Artistas AS art
INNER JOIN SpotifyClone.Álbuns AS alb ON alb.artista_id = art.artista_id
WHERE art.nome_artista = nome_artista;
END $$

DELIMITER ;
