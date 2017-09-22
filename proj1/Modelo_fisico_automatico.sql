SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db_ra169767` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_ra169767` ;

-- -----------------------------------------------------
-- Table `db_ra169767`.`Fabricante`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Fabricante` (
  `idFabricante` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idFabricante`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto` (
  `Cod_barras` VARCHAR(12) NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `idFabricante` INT NOT NULL ,
  `Calorias` VARCHAR(45) NULL ,
  `Sódio` VARCHAR(45) NULL ,
  `Fibras alimentares` VARCHAR(45) NULL ,
  `Acúcares` VARCHAR(45) NULL ,
  `Proteínas` VARCHAR(45) NULL ,
  `Gorduras Totais` VARCHAR(45) NULL ,
  `Quantidade` VARCHAR(45) NULL ,
  PRIMARY KEY (`Cod_barras`) ,
  INDEX `fk_Produto_Fabricante1_idx` (`idFabricante` ASC) ,
  CONSTRAINT `fk_Produto_Fabricante1`
    FOREIGN KEY (`idFabricante` )
    REFERENCES `db_ra169767`.`Fabricante` (`idFabricante` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Nome_Categoria` VARCHAR(45) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Ingrediente` (
  `idIngrediente` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `Alérgeno` TINYINT(1) NULL ,
  PRIMARY KEY (`idIngrediente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Pais` (
  `nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`nomePais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Paises_Vendidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Paises_Vendidos` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Pais_nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Pais_nomePais`) ,
  INDEX `fk_Produto_has_País onde se vende_País onde se vende1_idx` (`Pais_nomePais` ASC) ,
  INDEX `fk_Produto_has_País onde se vende_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_País onde se vende_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_País onde se vende_País onde se vende1`
    FOREIGN KEY (`Pais_nomePais` )
    REFERENCES `db_ra169767`.`Pais` (`nomePais` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Ingrediente` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Ingrediente_idIngrediente` INT NOT NULL ,
  `Porcentagem` INT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Ingrediente_idIngrediente`) ,
  INDEX `fk_Produto_has_Ingrediente_Ingrediente1_idx` (`Ingrediente_idIngrediente` ASC) ,
  INDEX `fk_Produto_has_Ingrediente_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Ingrediente_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Ingrediente_Ingrediente1`
    FOREIGN KEY (`Ingrediente_idIngrediente` )
    REFERENCES `db_ra169767`.`Ingrediente` (`idIngrediente` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Paises_Fabricados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Paises_Fabricados` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Pais_nomePais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Pais_nomePais`) ,
  INDEX `fk_Local_fabricado_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Pais_fabricado_has_Produto_Pais_vendido1_idx` (`Pais_nomePais` ASC) ,
  CONSTRAINT `fk_Local_fabricado_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pais_fabricado_has_Produto_Pais_vendido1`
    FOREIGN KEY (`Pais_nomePais` )
    REFERENCES `db_ra169767`.`Pais` (`nomePais` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Embalagem` (
  `Nome_embalagem` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Nome_embalagem`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Categoria_has_Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria_has_Produto` (
  `Categoria_idCategoria` INT NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Categoria_idCategoria`, `Produto_Cod_barras`) ,
  INDEX `fk_Categoria_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Categoria_has_Produto_Categoria1_idx` (`Categoria_idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Produto_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `db_ra169767`.`Categoria` (`idCategoria` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Categoria_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Embalagem` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Embalagem_Nome_embalagem` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Embalagem_Nome_embalagem`) ,
  INDEX `fk_Produto_has_Embalagem_Embalagem1_idx` (`Embalagem_Nome_embalagem` ASC) ,
  INDEX `fk_Produto_has_Embalagem_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Embalagem_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Embalagem_Embalagem1`
    FOREIGN KEY (`Embalagem_Nome_embalagem` )
    REFERENCES `db_ra169767`.`Embalagem` (`Nome_embalagem` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Premio` (
  `Nome_Premio` VARCHAR(200) NOT NULL ,
  `Ano` INT NULL ,
  PRIMARY KEY (`Nome_Premio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Premio` (
  `Premio_Nome_Premio` VARCHAR(200) NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Premio_Nome_Premio`, `Produto_Cod_barras`) ,
  INDEX `fk_Premio_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Premio_has_Produto_Premio1_idx` (`Premio_Nome_Premio` ASC) ,
  CONSTRAINT `fk_Premio_has_Produto_Premio1`
    FOREIGN KEY (`Premio_Nome_Premio` )
    REFERENCES `db_ra169767`.`Premio` (`Nome_Premio` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Premio_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Caracteristica` (
  `Nome_Caracteristica` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`Nome_Caracteristica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Caracteristica` (
  `Caracteristica_Nome_Caracteristica` VARCHAR(100) NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Caracteristica_Nome_Caracteristica`, `Produto_Cod_barras`) ,
  INDEX `fk_Produto_has_Caracteristica_Caracteristica1_idx` (`Caracteristica_Nome_Caracteristica` ASC) ,
  INDEX `fk_Produto_has_Caracteristica_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Caracteristica_Prod`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Caracteristica_Carac`
    FOREIGN KEY (`Caracteristica_Nome_Caracteristica` )
    REFERENCES `db_ra169767`.`Caracteristica` (`Nome_Caracteristica` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `db_ra169767` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
