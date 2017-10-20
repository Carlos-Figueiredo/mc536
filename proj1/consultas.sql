-- Retorna o nome do produto, o prêmio e o ano do prêmio em ordem alfabética de nome.
-- Para cada nome, ordena os prêmios de acordo com os anos.
-- !!!!!!!!!!!REFAZER!!!!!!!!!!
SELECT Produto.Nome, Premio.Nome_Premio, Premio.Ano FROM Produto
	JOIN Produto_has_Premio
		ON Produto_has_Premio.Produto_Cod_barras = Produto.Cod_barras
	JOIN Premio
		ON Produto_has_Premio.Premio_Id = Premio.Id
	ORDER BY Produto.Nome, Premio.Ano;




-- Lista de países que compram mais caloria (em ordem decrescente da quantidade de caloria comprada)
SELECT Paises_Vendidos.Pais_nomePais, SUM(Produto.Calorias) AS cal_total FROM Produto
	JOIN Paises_Vendidos
	ON Paises_Vendidos.Produto_Cod_barras = Produto.Cod_barras
	GROUP BY Paises_Vendidos.Pais_nomePais
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