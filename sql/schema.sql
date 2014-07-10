DROP DATABASE IF EXISTS `lab_digital`;
CREATE DATABASE `lab_digital` DEFAULT CHARSET utf8;

use `lab_digital`;

GRANT ALL
ON `lab_digital`.*
TO `lab_db_user`@localhost IDENTIFIED BY 'lab_db_user_password';

CREATE TABLE IF NOT EXISTS `images` (
   `id`         INT(11)    NOT NULL AUTO_INCREMENT,
   `is_resized` TINYINT(4) NOT NULL DEFAULT 0,
   PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `admin` (
   `id`       INT         NOT NULL AUTO_INCREMENT,
   `login`    VARCHAR(50) NOT NULL,
   `pass_md5` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `texts` (
   `id`   INT         NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(50) NOT NULL,
   `body` TEXT,
   PRIMARY KEY (`id`)
);

DELIMITER //

DROP TRIGGER IF EXISTS `update_admin`//
CREATE TRIGGER `update_admin` BEFORE UPDATE ON `admin`
FOR EACH ROW BEGIN
   IF new.pass_md5 != old.pass_md5 THEN
      SET new.pass_md5 = MD5(new.pass_md5);
   END IF;
END//

INSERT INTO `admin`(`login`, `pass_md5`) VALUES('admin', '21232f297a57a5a743894a0e4a801fc3');

INSERT INTO `texts`(`name`, `body`) VALUES('О нас', 'Текст, который раскрывает суть нашего бытия и роль в этом мире.');
INSERT INTO `texts`(`name`, `body`) VALUES('Проект 1', 'Самый лучший проект');
INSERT INTO `texts`(`name`, `body`) VALUES('Проект 2', 'Самый лучший проект');
INSERT INTO `texts`(`name`, `body`) VALUES('Проект 3', 'Самый лучший проект');
