CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.nome_cancao AS `cancao`,
        COUNT(hr.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.Canções AS c
            INNER JOIN
        SpotifyClone.Histórico_Reprodução AS hr ON hr.cancoes_id = c.cancoes_id
    GROUP BY c.cancoes_id
    ORDER BY COUNT(hr.usuario_id) DESC , c.nome_cancao ASC
    LIMIT 2;
