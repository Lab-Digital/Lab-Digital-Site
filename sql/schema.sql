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
   `id`               INT          NOT NULL AUTO_INCREMENT,
   `url`              VARCHAR(150) DEFAULT NULL,
   `name`             VARCHAR(100) NOT NULL,
   `head`             VARCHAR(150) NOT NULL,
   `body`             TEXT,
   `photo_id`         INT          DEFAULT NULL,
   `meta_title`       VARCHAR(130)  NOT NULL,
   `meta_keywords`    TEXT,
   `meta_description` TEXT,
   PRIMARY KEY (`id`),
   UNIQUE KEY(`url`),
   FOREIGN KEY (`photo_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `service` (
   `id`               INT          NOT NULL AUTO_INCREMENT,
   `url`              VARCHAR(150) NOT NULL,
   `head`             VARCHAR(150) NOT NULL,
   `body`             TEXT,
   `avatar_id`        INT          DEFAULT NULL,
   `photo_id`         INT          DEFAULT NULL,
   `description`      TEXT         NOT NULL,
   `meta_title`       VARCHAR(130) NOT NULL,
   `meta_keywords`    TEXT,
   `meta_description` TEXT,
   PRIMARY KEY (`id`),
   UNIQUE KEY(`url`),
   FOREIGN KEY (`photo_id`)  REFERENCES `images` (`id`) ON DELETE SET NULL,
   FOREIGN KEY (`avatar_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `news` (
   `id`               INT          NOT NULL AUTO_INCREMENT,
   `url`              VARCHAR(150) NOT NULL,
   `head`             VARCHAR(150) NOT NULL,
   `body`             TEXT         NOT NULL,
   `description`      TEXT         NOT NULL,
   `photo_id`         INT          DEFAULT NULL,
   `meta_title`       VARCHAR(130) NOT NULL,
   `meta_keywords`    TEXT,
   `meta_description` TEXT,
   `publication_date` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY(`url`),
   FOREIGN KEY (`photo_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `news_images` (
   `id`       INT NOT NULL AUTO_INCREMENT,
   `news_id`  INT NOT NULL,
   `photo_id` INT NOT NULL,
   PRIMARY KEY (`id`),
   FOREIGN KEY (`news_id`)  REFERENCES `news`   (`id`) ON DELETE CASCADE,
   FOREIGN KEY (`photo_id`) REFERENCES `images` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `index_meta` (
   `id`           INT          NOT NULL AUTO_INCREMENT,
   `title`        VARCHAR(130) NOT NULL,
   `keywords`     TEXT,
   `description`  TEXT,
   PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `slider` (
   `id`   INT          NOT NULL AUTO_INCREMENT,
   `head` VARCHAR(123) NOT NULL,
   `body` VARCHAR(120) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `proposal` (
   `id`    INT          NOT NULL AUTO_INCREMENT,
   `name`  VARCHAR(180) NOT NULL,
   `email` VARCHAR(180) NOT NULL,
   `phone` VARCHAR(32)  NOT NULL,
   `task`  TEXT         NOT NULL,
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

INSERT INTO `texts`(`meta_title`, `url`, `name`, `head` , `body`) VALUES('', null, 'О нас', 'Наша команда', 'Текст, который раскрывает суть нашего бытия и роль в этом мире.');
INSERT INTO `texts`(`meta_title`, `url`, `name`, `head` , `body`) VALUES('Lab Digital - Проекты - Ночь распродаж', 'noch-rasprodazh', 'Проект 1', 'Ночь распродаж' , '"Малый ГУМ: акция «Ночь распродаж»
«Ночь распродаж» - один из наиболее популярных во всем мире приемов проведения акций в торговых центрах.
27 декабря 2013 года рекламное агентство L.A.B. – Present организовало подобное мероприятие и для нашего постоянного клиента – первого молодежного Торгово-Развлекательного Центра Малый ГУМ.
Проведению акции предшествовала обширная рекламная кампания. Были задействованы щиты 3х6, интернет-СМИ, видеореклама, фасады самого торгового центра.
Апофеоз рекламной кампании пришелся на 27 декабря: в этот день интерьеры Малого ГУМа превратились в настоящее цирковое представление: фаерщики, живые витрины, сказочные персонажи.
Подарки, конкурсы, масштабная развлекательная программа и даже мини-фестиваль современной музыки превратили «Ночь распродаж» не просто в маркетинговую акцию, а мероприятие общегородского значения.
Результат акции превзошел самые смелые ожидания. Во многие бутики выстраивались огромные очереди, их владельцам приходилось срочно завозить новый товар в виду невероятного спроса!
Мы гордимся этим проектом. И он наглядно доказывает, что хорошая реклама работает и днем, и ночью! "  ');
INSERT INTO `texts`(`meta_title`, `url`, `name`, `head` , `body`) VALUES('Lab Digital - Проекты - Falck', 'falck', 'Проект 2', 'Falck' , '"«Фальк Медикал Владивосток»: вывод бренда на рынок
В начале 2014 года на рынке медицинских услуг Владивостока произошло знаковое событие: в городе открылась первая европейская клиника компании Falck.
Falck – это огромный медицинский холдинг из Дании, который в настоящее время работает во многих странах мира.
Руководство холдинга приняло решение о выходе на российский рынок, открыв свою первую частную клинику во Владивостоке.
Специалисты нашего агентства оказали консультационную поддержку компании на всех этапах открытия, дали свои рекомендации по выбору рекламных инструментов и общей стратегии продвижения.
Силами нашего агентства был создан корпоративный сайт компании, а также организовано размещение рекламы на щитах 3х6 и нестандартных рекламных конструкциях.
Особенностью этого проекта стало то, что с момента начала обсуждения рекламной кампании и до ее запуска переговоры зачастую велись на английском языке.
Однако это не стало помехой для наших специалистов. Напротив, мы получили неоценимый опыт общения с иностранными заказчиками, и являемся одним из немногих рекламных агентств Дальнего Востока, сотрудники которого имеют опыт продвижения международных брендов! "');
INSERT INTO `texts`(`meta_title`, `url`, `name`, `head` , `body`) VALUES('Lab Digital - Проекты - Эстафета олимпийского огня', 'estafeta', 'Проект 3', 'Эстафета олимпийского огня' , '"«Ингосстрах»: организация эстафеты олимпийского огня
Есть такие проекты, которыми наше агентство особенно гордится. Безусловно, к ним относится и участие в организации эстафеты Олимпийского огня в преддверии Зимних Олимпийских игр в Сочи в феврале 2014 года.
По заказу компании «Ингосстрах» совместно с Alem International Management рекламное агентство L.A.B. – Present организовало эстафету Олимпийского огня в Дальневосточном Федеральном Округе с 15 по 24 ноября 2013 года.
Были охвачены следующие города: Владивосток, Хабаровск, Биробиджан, Благовещенск, Чита, Улан-Удэ, Иркутск.
Специалистами нашего агентства был организован целый ряд мероприятий:
- Встреча гостей, в том числе, факелоносцев, их сопровождение, решение организационных вопросов;
- Аренда оборудования, обеспечение необходимыми расходными материалами;
- Заказ и брендирование автотранспорта, в том числе, для автомобилей кортежа эстафеты.
В оперативные сроки нам удалось решить все необходимые вопросы, обеспечив проведение всех мероприятий на олимпийской высоте! "');

INSERT INTO `index_meta`(`title`, `keywords`, `description`) VALUES('Lab Digital - Главная', '', '');

INSERT INTO `slider`(`head`, `body`) VALUES
   ('Контексная реклама', 'Поможет покупателям прийти именно к вам'),
   ('Посадочная страница', 'Расскажет о продукте и убедит стать вашим покупателем'),
   ('Поисковая оптимизация', 'Поднимет вас над конкурентами и сделает заметным');