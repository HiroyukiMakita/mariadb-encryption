CREATE DATABASE IF NOT EXISTS testdb;

CREATE TABLE IF NOT EXISTS testdb.`plain_table` (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME DEFAULT NULL
) ENGINE = InnoDB ENCRYPTED = NO;

INSERT INTO testdb.`plain_table` 
(text, created_at, updated_at) VALUES
("暗号化されないテーブルの値1", now(), NULL),
("暗号化されないテーブルの値2", now(), NULL),
("暗号化されないテーブルの値3", now(), NULL),
("暗号化されないテーブルの値4", now(), NULL),
("暗号化されないテーブルの値5", now(), NULL),
("plain_table test text6", now(), NULL),
("plain_table test text7", now(), NULL),
("plain_table test text8", now(), NULL),
("plain_table test text9", now(), NULL),
("plain_table test text10", now(), NULL);

CREATE TABLE IF NOT EXISTS testdb.`encryption_table` (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME DEFAULT NULL
) ENGINE = InnoDB ENCRYPTED = YES;

INSERT INTO testdb.`encryption_table` (text, created_at, updated_at)
VALUES ("暗号化されるテーブルの値1", now(), NULL),
       ("暗号化されるテーブルの値2", now(), NULL),
       ("暗号化されるテーブルの値3", now(), NULL),
       ("暗号化されるテーブルの値4", now(), NULL),
       ("暗号化されるテーブルの値5", now(), NULL),
       ("encryption_table test text6", now(), NULL),
       ("encryption_table test text7", now(), NULL),
       ("encryption_table test text8", now(), NULL),
       ("encryption_table test text9", now(), NULL),
       ("encryption_table test text10", now(), NULL);