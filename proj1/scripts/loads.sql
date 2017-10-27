-- Carrega informações no banco de dados.
LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Fabricante.csv' INTO TABLE Fabricante
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idFabricante, Nome);


LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto.csv' INTO TABLE Produto
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Cod_barras, Nome, idFabricante, Calorias_100g, Sodio_100g, FibrasAlimentares_100g, Acucares_100g, Proteinas_100g, GordurasTotais_100g, Quantidade, Un_Quantidade);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Caracteristica.csv' INTO TABLE Caracteristica
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idCaracteristica, Nome);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Categoria.csv' INTO TABLE Categoria
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idCategoria, Nome);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Embalagem.csv' INTO TABLE Embalagem
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idEmbalagem, Nome);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Ingrediente.csv' INTO TABLE Ingrediente
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idIngrediente, Nome);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Locais_Fabricados.csv' INTO TABLE Locais_Fabricados
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idLocais_Fabricados, Nome);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Locais_Vendidos.csv' INTO TABLE Locais_Vendidos
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idLocais_Vendidos, Nome);


LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Categoria_has_Produto.csv' INTO TABLE Categoria_has_Produto
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, IdCategoria);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto_has_Caracteristica.csv' INTO TABLE Produto_has_Caracteristica
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, Caracteristica_IdCaracteristica);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto_has_Embalagem.csv' INTO TABLE Produto_has_Embalagem
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, IdEmbalagem);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto_has_Ingrediente.csv' INTO TABLE Produto_has_Ingrediente
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, IdIngrediente);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto_has_Locais_Fabricados.csv' INTO TABLE Produto_has_Locais_Fabricados
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, Locais_Fabricados_idLocais_Fabricados);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169767\\Documents\\prog\\mc536\\proj1\\classes\\Csvs\\Produto_has_Locais_Vendidos.csv' INTO TABLE Produto_has_Locais_Vendidos
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Produto_Cod_barras, Locais_Vendidos_idLocais_Vendidos);
-- --------------------------------------------------------------------------------------------------------
