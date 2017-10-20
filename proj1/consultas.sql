-- Lista de produtos, onde são fabricados e onde são vendidos, ordenados por onde são vendidos.
SELECT Produto.nome, a.nome as Paises_Vendidos, b.nome as Paises_Fabricados
    FROM Produto
    JOIN Paises_Vendidos
    ON Produto.Cod_barras = Paises_Vendidos.Produto_Cod_barras
    JOIN Pais a
    ON Paises_Vendidos.idPais = a.idPais
    JOIN Paises_Fabricados
    ON Produto.Cod_barras = Paises_Fabricados.Produto_Cod_barras
    JOIN Pais b
    ON Paises_Fabricados.idPais = b.idPais
    ORDER BY Paises_Vendidos;

-- Lista de países que compram mais caloria (em ordem decrescente da quantidade de caloria comprada)
SELECT Pais.nome, SUM(Produto.Calorias_100g) AS cal_total FROM Produto
	JOIN Paises_Vendidos
	ON Paises_Vendidos.Produto_Cod_barras = Produto.Cod_barras
	JOIN Pais
	ON Paises_Vendidos.idPais = Pais.idPais
	GROUP BY Pais.nome
	ORDER BY cal_total DESC;


-- Resulta em uma tabela com os paises e a média da quantidade (em g ou ml) comprada por eles, ordenada de forma decrescente.
SELECT AVG(Produto.Quantidade), Paises_Vendidos.Pais_nomePais
FROM Produto
INNER JOIN Paises_Vendidos
	on Produto.Cod_barras = Paises_Vendidos.Produto_Cod_barras
GROUP BY Paises_Vendidos.Pais_nomePais
ORDER BY AVG(Produto.Quantidade) DESC;

-- Para todo fabricante, dá o número de produtos que ele possui
SELECT Fabricante.nome, COUNT(Produto.Cod_barras) as num_produto FROM Fabricante
    LEFT OUTER JOIN Produto
    ON Produto.IdFabricante = Fabricante.IdFabricante
    GROUP BY Fabricante.IdFabricante;

-- Dá o nome da categoria e o número de produtos com proteínas maior do que 20 para cada categoria.
SELECT Count(Produto_p.Proteinas) AS Num_Produtos, Categoria.Nome as Categoria
FROM (  SELECT 
	Proteinas,
	Cod_barras
	FROM Produto
	WHERE Proteinas >= 20
	) Produto_p
INNER JOIN Categoria_has_Produto
	on Produto_p.Cod_barras = Categoria_has_Produto.Produto_Cod_barras
INNER JOIN Categoria
	ON Categoria_has_Produto.Categoria_idCategoria = Categoria.idCategoria
GROUP BY Categoria_has_Produto.Categoria_idCategoria;