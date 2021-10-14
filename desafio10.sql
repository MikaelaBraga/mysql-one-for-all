USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(userId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantMusic INT;
SELECT COUNT(*)
FROM SpotifyClone.Histórico_Reprodução AS h
INNER JOIN SpotifyClone.Usuários AS us ON us.usuario_id = h.usuario_id
WHERE us.usuario_id = userId INTO quantMusic;
RETURN quantMusic;
END $$

DELIMITER ;
