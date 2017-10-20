SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db_alimentos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_alimentos` ;

-- -----------------------------------------------------
-- Table `db_alimentos`.`Fabricante`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Fabricante` (
  `idFabricante` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idFabricante`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Produto` (
  `Cod_barras` VARCHAR(12) NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `idFabricante` INT NOT NULL ,
  `Calorias` INT NULL ,
  `Sodio` INT NULL ,
  `Fibras alimentares` INT NULL ,
  `Acucares` INT NULL ,
  `Proteinas` INT NULL ,
  `Gorduras Totais` INT NULL ,
  `Quantidade` INT NULL ,
  PRIMARY KEY (`Cod_barras`) ,
  INDEX `fk_Produto_Fabricante1_idx` (`idFabricante` ASC) ,
  CONSTRAINT `fk_Produto_Fabricante1`
    FOREIGN KEY (`idFabricante` )
    REFERENCES `db_alimentos`.`Fabricante` (`idFabricante` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Nome_Categoria` VARCHAR(45) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Ingrediente` (
  `idIngrediente` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `Alergeno` TINYINT(1) NULL ,
  PRIMARY KEY (`idIngrediente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Pais` (
  `nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`nomePais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Paises_Vendidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Paises_Vendidos` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Pais_nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Pais_nomePais`) ,
  INDEX `fk_Produto_has_País onde se vende_País onde se vende1_idx` (`Pais_nomePais` ASC) ,
  INDEX `fk_Produto_has_País onde se vende_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_País onde se vende_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_País onde se vende_País onde se vende1`
    FOREIGN KEY (`Pais_nomePais` )
    REFERENCES `db_alimentos`.`Pais` (`nomePais` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Produto_has_Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Produto_has_Ingrediente` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Ingrediente_idIngrediente` INT NOT NULL ,
  `Porcentagem` INT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Ingrediente_idIngrediente`) ,
  INDEX `fk_Produto_has_Ingrediente_Ingrediente1_idx` (`Ingrediente_idIngrediente` ASC) ,
  INDEX `fk_Produto_has_Ingrediente_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Ingrediente_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Ingrediente_Ingrediente1`
    FOREIGN KEY (`Ingrediente_idIngrediente` )
    REFERENCES `db_alimentos`.`Ingrediente` (`idIngrediente` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Paises_Fabricados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Paises_Fabricados` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Pais_nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Pais_nomePais`) ,
  INDEX `fk_Local_fabricado_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Pais_fabricado_has_Produto_Pais_vendido1_idx` (`Pais_nomePais` ASC) ,
  CONSTRAINT `fk_Local_fabricado_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pais_fabricado_has_Produto_Pais_vendido1`
    FOREIGN KEY (`Pais_nomePais` )
    REFERENCES `db_alimentos`.`Pais` (`nomePais` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Embalagem` (
  `Nome_embalagem` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Nome_embalagem`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Categoria_has_Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Categoria_has_Produto` (
  `Categoria_idCategoria` INT NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Categoria_idCategoria`, `Produto_Cod_barras`) ,
  INDEX `fk_Categoria_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Categoria_has_Produto_Categoria1_idx` (`Categoria_idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Produto_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `db_alimentos`.`Categoria` (`idCategoria` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Categoria_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Produto_has_Embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Produto_has_Embalagem` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Embalagem_Nome_embalagem` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Embalagem_Nome_embalagem`) ,
  INDEX `fk_Produto_has_Embalagem_Embalagem1_idx` (`Embalagem_Nome_embalagem` ASC) ,
  INDEX `fk_Produto_has_Embalagem_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Embalagem_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Embalagem_Embalagem1`
    FOREIGN KEY (`Embalagem_Nome_embalagem` )
    REFERENCES `db_alimentos`.`Embalagem` (`Nome_embalagem` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Premio` (
  `Nome_Premio` VARCHAR(200) NULL ,
  `Ano` INT NULL ,
  `Id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Produto_has_Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Produto_has_Premio` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Id` INT NOT NULL ,
  `Premio_Id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Id`) ,
  INDEX `fk_Premio_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Produto_has_Premio_Premio1_idx` (`Premio_Id` ASC) ,
  CONSTRAINT `fk_Premio_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Premio_Premio1`
    FOREIGN KEY (`Premio_Id` )
    REFERENCES `db_alimentos`.`Premio` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Caracteristica` (
  `Nome_Caracteristica` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Nome_Caracteristica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_alimentos`.`Produto_has_Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_alimentos`.`Produto_has_Caracteristica` (
  `Caracteristica_Nome_Caracteristica` VARCHAR(100) NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Caracteristica_Nome_Caracteristica`, `Produto_Cod_barras`) ,
  INDEX `fk_Produto_has_Caracteristica_Caracteristica1_idx` (`Caracteristica_Nome_Caracteristica` ASC) ,
  INDEX `fk_Produto_has_Caracteristica_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Caracteristica_Prod`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_alimentos`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Caracteristica_Carac`
    FOREIGN KEY (`Caracteristica_Nome_Caracteristica` )
    REFERENCES `db_alimentos`.`Caracteristica` (`Nome_Caracteristica` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `db_alimentos` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

