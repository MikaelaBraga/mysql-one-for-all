CREATE VIEW estastisticas_musicais AS
    SELECT 
        COUNT(cancoes_id) AS `cancoes`,
        (SELECT 
                COUNT(artista_id)
            FROM
                SpotifyClone.Artistas) AS `artistas`,
        (SELECT 
                COUNT(album_id)
            FROM
                SpotifyClone.Álbuns) AS `albuns`
    FROM
        SpotifyClone.Canções;
