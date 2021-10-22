CREATE VIEW perfil_artistas AS
SELECT 
    a.nome_artista AS `artista`,
    abm.nome_album AS `album`,
    COUNT(sa.usuario_id) AS `seguidores`
FROM
    SpotifyClone.Artistas AS a
        INNER JOIN
    SpotifyClone.Álbuns AS abm ON abm.artista_id = a.artista_id
        INNER JOIN
    SpotifyClone.Seguidores_Artistas AS sa ON sa.artista_id = a.artista_id
GROUP BY a.artista_id , abm.album_id
ORDER BY COUNT(sa.usuario_id) DESC , a.nome_artista ASC, abm.nome_album ASC;
