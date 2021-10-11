CREATE VIEW historico_reproducao_usuarios AS
SELECT 
	u.nome_usuario AS `usuario`, c.nome_cancao AS `nome`
FROM
	SpotifyClone.Usuários AS u
		INNER JOIN
	SpotifyClone.Histórico_Reprodução AS hr ON hr.usuario_id = u.usuario_id
		INNER JOIN
	SpotifyClone.Canções AS c ON c.cancoes_id = hr.cancoes_id
ORDER BY u.nome_usuario, c.nome_cancao ASC;
