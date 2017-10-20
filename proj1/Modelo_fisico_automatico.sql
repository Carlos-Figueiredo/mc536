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
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Ingrediente` (
  `idIngrediente` INT NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idIngrediente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Pais` (
  `nome` VARCHAR(45) NOT NULL ,
  `idPais` INT NOT NULL ,
  PRIMARY KEY (`idPais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Paises_Vendidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Paises_Vendidos` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idPais` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `idPais`) ,
  INDEX `fk_Produto_has_País onde se vende_País onde se vende1_idx` (`idPais` ASC) ,
  INDEX `fk_Produto_has_País onde se vende_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_País onde se vende_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_País onde se vende_País onde se vende1`
    FOREIGN KEY (`idPais` )
    REFERENCES `db_ra169767`.`Pais` (`nome` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Ingrediente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Ingrediente` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idIngrediente` INT NOT NULL ,
  `Porcentagem` INT NULL ,
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
-- Table `db_ra169767`.`Paises_Fabricados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Paises_Fabricados` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `idPais` INT NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `idPais`) ,
  INDEX `fk_Local_fabricado_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Pais_fabricado_has_Produto_Pais_vendido1_idx` (`idPais` ASC) ,
  CONSTRAINT `fk_Local_fabricado_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pais_fabricado_has_Produto_Pais_vendido1`
    FOREIGN KEY (`idPais` )
    REFERENCES `db_ra169767`.`Pais` (`nome` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Embalagem` (
  `idEmbalagem` INT NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idEmbalagem`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Categoria_has_Produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Categoria_has_Produto` (
  `idCategoria` INT NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idCategoria`, `Produto_Cod_barras`) ,
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
-- Table `db_ra169767`.`Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Premio` (
  `Nome_Premio` VARCHAR(200) NULL ,
  `Ano` INT NULL ,
  `Id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Premio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Premio` (
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  `Id` INT NOT NULL ,
  `Premio_Id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Produto_Cod_barras`, `Id`) ,
  INDEX `fk_Premio_has_Produto_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  INDEX `fk_Produto_has_Premio_Premio1_idx` (`Premio_Id` ASC) ,
  CONSTRAINT `fk_Premio_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Premio_Premio1`
    FOREIGN KEY (`Premio_Id` )
    REFERENCES `db_ra169767`.`Premio` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Caracteristica` (
  `nome` VARCHAR(100) NOT NULL ,
  `idCaracteristica` INT NOT NULL ,
  PRIMARY KEY (`idCaracteristica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Produto_has_Caracteristica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Produto_has_Caracteristica` (
  `idCaracteristica` INT NOT NULL ,
  `Produto_Cod_barras` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idCaracteristica`, `Produto_Cod_barras`) ,
  INDEX `fk_Produto_has_Caracteristica_Caracteristica1_idx` (`idCaracteristica` ASC) ,
  INDEX `fk_Produto_has_Caracteristica_Produto1_idx` (`Produto_Cod_barras` ASC) ,
  CONSTRAINT `fk_Produto_has_Caracteristica_Prod`
    FOREIGN KEY (`Produto_Cod_barras` )
    REFERENCES `db_ra169767`.`Produto` (`Cod_barras` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Caracteristica_Carac`
    FOREIGN KEY (`idCaracteristica` )
    REFERENCES `db_ra169767`.`Caracteristica` (`nome` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Alergeno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Alergeno` (
  `idAlergeno` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idAlergeno`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ra169767`.`Alergeno_has_Alergeno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_ra169767`.`Alergeno_has_Alergeno` (
  `Alergeno_idAlergeno` INT NOT NULL ,
  `Alergeno_idAlergeno1` INT NOT NULL ,
  PRIMARY KEY (`Alergeno_idAlergeno`, `Alergeno_idAlergeno1`) ,
  INDEX `fk_Alergeno_has_Alergeno_Alergeno2_idx` (`Alergeno_idAlergeno1` ASC) ,
  INDEX `fk_Alergeno_has_Alergeno_Alergeno1_idx` (`Alergeno_idAlergeno` ASC) ,
  CONSTRAINT `fk_Alergeno_has_Alergeno_Alergeno1`
    FOREIGN KEY (`Alergeno_idAlergeno` )
    REFERENCES `db_ra169767`.`Alergeno` (`idAlergeno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alergeno_has_Alergeno_Alergeno2`
    FOREIGN KEY (`Alergeno_idAlergeno1` )
    REFERENCES `db_ra169767`.`Alergeno` (`idAlergeno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `db_ra169767` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
