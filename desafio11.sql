CREATE VIEW cancoes_premium AS
SELECT
    c.nome_cancao AS `nome`,
    COUNT(hist.usuario_id) AS `reproducoes`
FROM
    SpotifyClone.Canções AS c
        INNER JOIN
    SpotifyClone.Histórico_Reprodução AS hist ON hist.cancoes_id = c.cancoes_id
        INNER JOIN
    SpotifyClone.Usuários AS us ON us.usuario_id = hist.usuario_id
        INNER JOIN
    SpotifyClone.Planos AS p ON p.plano_id = us.plano_id
WHERE
    p.plano_id IN (2 , 3)
GROUP BY `nome`
ORDER BY `nome` ASC;
