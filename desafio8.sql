DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.Usuários
    FOR EACH ROW
    BEGIN
    DELETE FROM SpotifyClone.Seguidores_Artistas
    WHERE OLD.usuario_id = SpotifyClone.Seguidores_Artistas.usuario_id;
DELETE FROM SpotifyClone.Histórico_Reprodução 
WHERE
    OLD.usuario_id = SpotifyClone.Histórico_Reprodução.usuario_id;
  END $$

DELIMITER ;
