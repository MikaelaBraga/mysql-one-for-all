CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome_artista AS `artista`,
        COUNT(sa.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Artistas AS a
            INNER JOIN
        SpotifyClone.Seguidores_Artistas AS sa ON sa.artista_id = a.artista_id
    GROUP BY a.artista_id
    ORDER BY COUNT(sa.usuario_id) DESC , a.nome_artista ASC LIMIT 3;
