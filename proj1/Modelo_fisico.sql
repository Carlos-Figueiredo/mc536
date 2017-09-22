/* CRIA ESQUEMA */
DROP DATABASE IF EXISTS db_ra169767;

CREATE DATABASE db_ra169767;

USE db_ra169767;

DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
	Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Nome VARCHAR(45),
	Fabricante VARCHAR(45) NOT NULL,
	Calorias VARCHAR(45),
	Sodio VARCHAR(45),
	Fibras_alimentares VARCHAR(45),
	Acucares VARCHAR(45),
	Proteinas VARCHAR(45),
	Gorduras_Totais VARCHAR(45),
	Quantidade VARCHAR(45)
);

DROP TABLE IF EXISTS Fabricante;

CREATE TABLE Fabricante (
	idFabricante INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(45) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
	Nome_Pais VARCHAR(45) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Paises_Vendidos;

CREATE TABLE Pais_Vendido (
	Produto_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Nome_Pais VARCHAR(45) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Paises_Fabricados;

CREATE TABLE Paises_Fabricados (
	Produto_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Nome_Pais VARCHAR(45) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
	idCategoria INT NOT NULL PRIMARY KEY,
	Nome_Categoria VARCHAR(12)
);

DROP TABLE IF EXISTS Produto_has_Categoria;

CREATE TABLE Produto_has_Categoria (
	Categoria_idCategoria INT NOT NULL PRIMARY KEY,
	Produto_Cod_barras	 VARCHAR(12) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Caracteristica;

CREATE TABLE Caracteristica (
	Nome_Caracteristica VARCHAR(100) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Produto_has_Caracteristica;

CREATE TABLE Produto_has_Caracteristica (
	Prod_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Caracteristica_Nome_Caracteristica VARCHAR(100) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Embalagem;

CREATE TABLE Embalagem (
	Nome_Embalagem VARCHAR(100) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Produto_has_Embalagem;

CREATE TABLE Embalagem (
	Produto_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Embalagem_Nome_Embalagem VARCHAR(100) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Premio;

CREATE TABLE Premio (
	Nome_Premio VARCHAR(200) NOT NULL PRIMARY KEY,
	Ano INT
);

DROP TABLE IF EXISTS Produto_has_Premio;

CREATE TABLE Produto_has_Premio (
	Produto_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Premio_Nome_Premio VARCHAR(200) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Ingrediente;

CREATE TABLE Ingrediente (
	idIngrediente INT NOT NULL PRIMARY KEY,
	Nome_Ingrediente VARCHAR(45),
	Alergeno BOOLEAN
);

DROP TABLE IF EXISTS Produto_has_Ingrediente;

CREATE TABLE Produto_has_Ingrediente (
	Produto_Cod_barras VARCHAR(12) NOT NULL PRIMARY KEY,
	Ingrediente_idIngrediente INT NOT NULL PRIMARY KEY,
	Porcentagem INT
);