SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db_ra169767` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_ra169767` ;

-- -----------------------------------------------------
-- Table `db_ra169767`.`Fabricante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Fabricante` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Fabricante` (
  `idFabricante` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idFabricante`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto` (
  `Cod_barras` VARCHAR(12) NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `idFabricante` INT NOT NULL ,
  `Calorias_100g` INT NULL ,
  `Sodio_100g` DOUBLE NULL ,
  `FibrasAlimentares_100g` INT NULL ,
  `Acucares_100g` INT NULL ,
  `Proteinas_100g` INT NULL ,
  `GordurasTotais_100g` INT NULL ,
  `Quantidade` INT NULL ,
  `Un_Quantidade` VARCHAR(45) NULL ,
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
DROP TABLE IF EXISTS `db_ra169767`.`Categoria` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Nome` VARCHAR(150) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Ingrediente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Ingrediente` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Ingrediente` (
  `idIngrediente` INT NOT NULL ,
  `Nome` VARCHAR(150) NULL ,
  PRIMARY KEY (`idIngrediente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Ingrediente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Ingrediente` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Ingrediente` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idIngrediente` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `idIngrediente`) ,
  INDEX `fk_Produto_has_Ingrediente_Ingrediente1_idx` (`idIngrediente` ASC) ,
  INDEX `fk_Produto_has_Ingrediente_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Ingrediente_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Ingrediente_Ingrediente1`
    FOREIGN KEY (`idIngrediente` )
    REFERENCES `db_ra169767`.`Ingrediente` (`idIngrediente` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Embalagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Embalagem` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Embalagem` (
  `idEmbalagem` INT NOT NULL ,
  `Nome` VARCHAR(150) NULL ,
  PRIMARY KEY (`idEmbalagem`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Categoria_has_Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Categoria_has_Produto` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria_has_Produto` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idCategoria` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `idCategoria`) ,
  INDEX `fk_Categoria_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Categoria_has_Produto_Categoria1_idx` (`idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Produto_Categoria1`
    FOREIGN KEY (`idCategoria` )
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
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Embalagem` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Embalagem` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idEmbalagem` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `idEmbalagem`) ,
  INDEX `fk_Produto_has_Embalagem_Embalagem1_idx` (`idEmbalagem` ASC) ,
  INDEX `fk_Produto_has_Embalagem_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Embalagem_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Embalagem_Embalagem1`
    FOREIGN KEY (`idEmbalagem` )
    REFERENCES `db_ra169767`.`Embalagem` (`idEmbalagem` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Premio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Premio` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Premio` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Id` INT NOT NULL ,
  `Premio_Id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Id`) ,
  INDEX `fk_Premio_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Premio_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Caracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Caracteristica` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Caracteristica` (
  `idCaracteristica` INT NOT NULL ,
  `Nome` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`idCaracteristica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Caracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Caracteristica` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Caracteristica` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Caracteristica_idCaracteristica` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Caracteristica_idCaracteristica`) ,
  INDEX `fk_Produto_has_Caracteristica_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) ,
  INDEX `fk_Produto_has_Caracteristica_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Caracteristica_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Caracteristica_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica` )
    REFERENCES `db_ra169767`.`Caracteristica` (`idCaracteristica` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Locais_Vendidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Locais_Vendidos` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Locais_Vendidos` (
  `idLocais_Vendidos` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idLocais_Vendidos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Locais_Fabricados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Locais_Fabricados` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Locais_Fabricados` (
  `idLocais_Fabricados` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idLocais_Fabricados`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Locais_Vendidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Locais_Vendidos` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Locais_Vendidos` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Locais_Vendidos_idLocais_Vendidos` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Locais_Vendidos_idLocais_Vendidos`) ,
  INDEX `fk_Produto_has_Locais_Vendidos_Locais_Vendidos1_idx` (`Locais_Vendidos_idLocais_Vendidos` ASC) ,
  INDEX `fk_Produto_has_Locais_Vendidos_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Locais_Vendidos_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Locais_Vendidos_Locais_Vendidos1`
    FOREIGN KEY (`Locais_Vendidos_idLocais_Vendidos` )
    REFERENCES `db_ra169767`.`Locais_Vendidos` (`idLocais_Vendidos` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Locais_Fabricados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_ra169767`.`Produto_has_Locais_Fabricados` ;

CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Locais_Fabricados` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Locais_Fabricados_idLocais_Fabricados` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Locais_Fabricados_idLocais_Fabricados`) ,
  INDEX `fk_Produto_has_Locais_Fabricados_Locais_Fabricados1_idx` (`Locais_Fabricados_idLocais_Fabricados` ASC) ,
  INDEX `fk_Produto_has_Locais_Fabricados_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Locais_Fabricados_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Locais_Fabricados_Locais_Fabricados1`
    FOREIGN KEY (`Locais_Fabricados_idLocais_Fabricados` )
    REFERENCES `db_ra169767`.`Locais_Fabricados` (`idLocais_Fabricados` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `db_ra169767` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
