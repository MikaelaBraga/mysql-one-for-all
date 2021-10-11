CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(p.valor_plano) AS `faturamento_minimo`,
        MAX(p.valor_plano) AS `faturamento_maximo`,
        ROUND(AVG(p.valor_plano), 2) AS `faturamento_medio`,
        SUM(p.valor_plano) AS `faturamento_total`
    FROM
        SpotifyClone.Planos AS p
            INNER JOIN
        SpotifyClone.Usuários AS u ON u.plano_id = p.plano_id;
