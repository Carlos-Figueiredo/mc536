-- Lista de produtos, onde são fabricados e onde são vendidos, ordenados por onde são vendidos.
SELECT Produto.nome, a.nome as Paises_Vendidos, b.nome as Paises_Fabricados
    FROM Produto
    JOIN Produto_has_Locais_Vendidos
    ON Produto.Cod_barras = Produto_has_Locais_Vendidos.Produto_Cod_barras
    JOIN Locais_Vendidos a
    ON Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos = a.idLocais_Vendidos
    JOIN Produto_has_Locais_Fabricados
    ON Produto.Cod_barras = Produto_has_Locais_Fabricados.Produto_Cod_barras
    JOIN Locais_Fabricados b
    ON Produto_has_Locais_Fabricados.Locais_Fabricados_idLocais_Fabricados = b.idLocais_Fabricados
    ORDER BY Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos;
    

-- Lista de países que compram mais caloria (em ordem decrescente da quantidade de caloria comprada)
SELECT Locais_Vendidos.nome, SUM(Produto.Calorias_100g) AS cal_total FROM Produto
	JOIN Produto_has_Locais_Vendidos
	ON Produto_has_Locais_Vendidos.Produto_Cod_barras = Produto.Cod_barras
	JOIN Locais_Vendidos
	ON Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos = Locais_Vendidos.idLocais_Vendidos
	GROUP BY Locais_Vendidos.nome
	ORDER BY cal_total DESC;


-- Resulta em uma tabela com os paises e a média da quantidade (em g ou ml) comprada por eles, ordenada de forma decrescente.
SELECT AVG(pr.Quantidade), p.nome
FROM Produto pr
INNER JOIN Produto_has_Locais_Vendidos v
	ON pr.Cod_barras = v.Produto_Cod_barras
INNER JOIN Locais_Vendidos p
	ON v.Locais_Vendidos_idLocais_Vendidos = p.idLocais_Vendidos
GROUP BY p.nome
ORDER BY AVG(pr.Quantidade) DESC;


-- Para todo fabricante, dá o número de produtos que ele possui
SELECT Fabricante.nome, COUNT(Produto.Cod_barras) as num_produto FROM Fabricante
    LEFT OUTER JOIN Produto
    ON Produto.IdFabricante = Fabricante.IdFabricante
    GROUP BY Fabricante.IdFabricante;


-- Dá o nome da categoria e o número de produtos com proteínas maior do que 20 para cada categoria.
SELECT Count(Produto_p.Proteinas_100g) AS Num_Produtos, Categoria.Nome as Categoria
FROM (  SELECT 
	Proteinas_100g,
	Cod_barras
	FROM Produto
	WHERE Proteinas_100g >= 10
	) Produto_p
INNER JOIN Categoria_has_Produto
	on Produto_p.Cod_barras = Categoria_has_Produto.Produto_Cod_barras
INNER JOIN Categoria
	ON Categoria_has_Produto.idCategoria = Categoria.idCategoria
GROUP BY Categoria_has_Produto.idCategoria;