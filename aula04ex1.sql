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
-- Table `mydb`.`Artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Artigo` (
  `idArtigo` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `dataApresentacao` DATE NOT NULL,
  PRIMARY KEY (`idArtigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituicao` (
  `idInstituicao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `idAutor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `Artigo_idArtigo` INT NOT NULL,
  `Instituicao_idInstituicao` INT NOT NULL,
  PRIMARY KEY (`idAutor`, `Artigo_idArtigo`, `Instituicao_idInstituicao`),
  CONSTRAINT `fk_Autor_Artigo`
    FOREIGN KEY (`Artigo_idArtigo`)
    REFERENCES `mydb`.`Artigo` (`idArtigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_Instituicao1`
    FOREIGN KEY (`Instituicao_idInstituicao`)
    REFERENCES `mydb`.`Instituicao` (`idInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Participante` (
  `idParticipante` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idParticipante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`assiste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`assiste` (
  `Participante_idParticipante` INT NOT NULL,
  `Artigo_idArtigo` INT NOT NULL,
  PRIMARY KEY (`Participante_idParticipante`, `Artigo_idArtigo`),
  CONSTRAINT `fk_Participante_has_Artigo_Participante1`
    FOREIGN KEY (`Participante_idParticipante`)
    REFERENCES `mydb`.`Participante` (`idParticipante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participante_has_Artigo_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo`)
    REFERENCES `mydb`.`Artigo` (`idArtigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TransferenciaBancaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TransferenciaBancaria` (
  `idTransferenciaBancaria` INT NOT NULL,
  `data` DATE NOT NULL,
  `Participante_idParticipante` INT NOT NULL,
  PRIMARY KEY (`idTransferenciaBancaria`, `Participante_idParticipante`),
  CONSTRAINT `fk_TransferenciaBancaria_Participante1`
    FOREIGN KEY (`Participante_idParticipante`)
    REFERENCES `mydb`.`Participante` (`idParticipante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
