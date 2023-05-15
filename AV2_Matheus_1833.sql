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
-- Table `mydb`.`Estrela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estrela` (
  `idEstrela` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `massa` INT NOT NULL,
  `tamanho` INT NOT NULL,
  `luminosidade` DOUBLE NOT NULL,
  `galaxia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstrela`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Planeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planeta` (
  `idPlaneta` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `massa` INT NOT NULL,
  `tamanho` INT NOT NULL,
  `habitavel` VARCHAR(1) NOT NULL,
  `Estrela_idEstrela` INT NOT NULL,
  PRIMARY KEY (`idPlaneta`),
  CONSTRAINT `fk_Planeta_Estrela`
    FOREIGN KEY (`Estrela_idEstrela`)
    REFERENCES `mydb`.`Estrela` (`idEstrela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nave` (
  `idNave` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `quantidadeDeTripulantes` INT NOT NULL,
  `quantidadeDePassageiros` INT NOT NULL,
  PRIMARY KEY (`idNave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mapa` (
  `idMapa` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `escala` DOUBLE NOT NULL,
  `orientacao` VARCHAR(45) NOT NULL,
  `quantidadeDeObstaculos` INT NULL,
  PRIMARY KEY (`idMapa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Viagem` (
  `Planeta_idPlaneta` INT NOT NULL,
  `Nave_idNave` INT NOT NULL,
  `tempoDeDuracao` VARCHAR(45) NOT NULL,
  `distancia` INT NOT NULL,
  `Mapa_idMapa` INT NOT NULL,
  PRIMARY KEY (`Planeta_idPlaneta`, `Nave_idNave`),
  CONSTRAINT `fk_Planeta_has_Nave_Planeta1`
    FOREIGN KEY (`Planeta_idPlaneta`)
    REFERENCES `mydb`.`Planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planeta_has_Nave_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viagem_Mapa1`
    FOREIGN KEY (`Mapa_idMapa`)
    REFERENCES `mydb`.`Mapa` (`idMapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passageiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passageiro` (
  `idPassageiro` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `profissao` VARCHAR(45) NULL,
  `Nave_idNave` INT NOT NULL,
  PRIMARY KEY (`idPassageiro`),
  CONSTRAINT `fk_Passageiro_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tripulante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tripulante` (
  `idTripulante` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `especializacao` VARCHAR(45) NOT NULL,
  `supervisor` VARCHAR(45) NOT NULL,
  `Nave_idNave` INT NOT NULL,
  PRIMARY KEY (`idTripulante`),
  CONSTRAINT `fk_Tripulante_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
