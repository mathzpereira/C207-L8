-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escola` (
  `idEscola` INT NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscola`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idDiretor`, `Escola_idEscola`),
  CONSTRAINT `fk_Diretor_Escola`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `mydb`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escritor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escritor` (
  `idEscritor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscritor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `idLivro` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `Livrocol` VARCHAR(45) NULL,
  `Escritor_idEscritor` INT NOT NULL,
  PRIMARY KEY (`idLivro`, `Escritor_idEscritor`),
  CONSTRAINT `fk_Livro_Escritor1`
    FOREIGN KEY (`Escritor_idEscritor`)
    REFERENCES `mydb`.`Escritor` (`idEscritor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
