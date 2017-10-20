
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
    
-- Carrega informações no banco de dados.

LOAD DATA INFILE 'produto.csv'
	INTO TABLE Produto
    IGNORE 1 LINES (Cod_barras, Nome, idFabricante, Calorias_100g, Sodio_100g, FibrasAlimentares_100g, Acucares_100g, Proteinas_100g, GordurasTotais_100g, Quantidade, Un_Quantidade);
LOAD DATA INFILE 'paises_vendidos.csv'
	INTO TABLE Paises_Vendidos 
    IGNORE 1 LINES (Produto_Cod_barras, idPais);
LOAD DATA INFILE 'paises_fabricados.csv'
	INTO TABLE Paises_Fabricados 
    IGNORE 1 LINES (Produto_Cod_barras, idPais);
LOAD DATA INFILE 'paises.csv'
	INTO TABLE Paises 
    IGNORE 1 LINES (idPais, Nome);
LOAD DATA INFILE 'fabricante.csv'
	INTO TABLE Fabricante 
    IGNORE 1 LINES (idFabricante, Nome);
LOAD DATA INFILE 'categoria_has_produto.csv'
	INTO TABLE Categoria_has_Produto 
    IGNORE 1 LINES (idCategoria, Produto_Cod_barras);
LOAD DATA INFILE 'categoria.csv'
	INTO TABLE Categoria 
    IGNORE 1 LINES (idCategoria, Nome);
LOAD DATA INFILE 'produto_has_ingrediente.csv'
	INTO TABLE Produto_has_Ingrediente 
    IGNORE 1 LINES (Produto_Cod_barras, idIngrediente);
LOAD DATA INFILE 'ingrediente.csv'
	INTO TABLE Ingrediente 
    IGNORE 1 LINES (idIngrediente, Nome);
LOAD DATA INFILE 'produto_has_caracterisca.csv'
	INTO TABLE Produto_has_Caracteristica
    IGNORE 1 LINES (idCaracteristica, Produto_Cod_barras);
LOAD DATA INFILE 'caracteristica.csv'
	INTO TABLE Caracteristica 
    IGNORE 1 LINES (idCaracteristica, Nome);
LOAD DATA INFILE 'produto_has_embalagem.csv'
	INTO TABLE Produto_has_Embalagem 
    IGNORE 1 LINES (Produto_Cod_barras, idEmbalagem);
LOAD DATA INFILE 'embalagem.csv'
	INTO TABLE Embalagem 
    IGNORE 1 LINES (idEmbalagem, Nome);

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
SELECT Count(Produto_p.Proteinas_100g) AS Num_Produtos, Categoria.Nome as Categoria
FROM (  SELECT 
	Proteinas_100g,
	Cod_barras
	FROM Produto
	WHERE Proteinas >= 20
	) Produto_p
INNER JOIN Categoria_has_Produto
	on Produto_p.Cod_barras = Categoria_has_Produto.Produto_Cod_barras
INNER JOIN Categoria
	ON Categoria_has_Produto.idCategoria = Categoria.idCategoria
GROUP BY Categoria_has_Produto.idCategoria;

