--
-- Файл сгенерирован с помощью SQLiteStudio v3.1.1 в Чт фев 27 13:24:48 2020
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: persons
CREATE TABLE persons (
    name_person TEXT        NOT NULL,
    code_person INTEGER     PRIMARY KEY
                            NOT NULL,
    pol         STRING (15),
    date_reg    DATE        NOT NULL,
    vozrast     INT,
    znak_zodiak STRING (8) 
);


-- Таблица: persons_answers
CREATE TABLE persons_answers (
    code_person        INTEGER REFERENCES persons (code_person) 
                               NOT NULL,
    n_test             INTEGER NOT NULL
                               REFERENCES tests (n_test),
    full_answer        BOOLEAN DEFAULT True
                               NOT NULL,
    name_table_answers TEXT    NOT NULL,
    link               TEXT    NOT NULL
);


-- Таблица: persons_corpus
CREATE TABLE persons_corpus (
    code_person INTEGER NOT NULL
                        REFERENCES persons (code_person),
    n_test      INTEGER NOT NULL,
    corpus      TEXT
);


-- Таблица: tests
CREATE TABLE tests (
    n_test          INTEGER PRIMARY KEY
                            NOT NULL,
    name_test       TEXT    NOT NULL
                            UNIQUE,
    name_table_test TEXT    NOT NULL
);

-- Таблица: table_answer_XXXXXX_Y
CREATE TABLE table_answer_XXXXXX_Y (
    n_stroka INTEGER,
    answer   TEXT
);


-- Таблица: test_Y
CREATE TABLE test_Y (
    n_stroka INTEGER PRIMARY KEY
                     NOT NULL,
    vopros   TEXT    NOT NULL
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
