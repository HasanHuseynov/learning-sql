create table authors
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(128),
    surname    VARCHAR(128),
    email      VARCHAR(64),
    created_at TIMESTAMP DEFAULT NOW()
);
create table posts
(
    id         SERIAL PRIMARY KEY,
    title      VARCHAR(128),
    created_at TIMESTAMP,
    update_at  TIMESTAMP
);
alter table authors
    add column about VARCHAR(256),
    add column nick  VARCHAR(32);


CREATE TABLE authors_posts
(
    author_id INT NOT NULL,
    post_id   INT NOT NULL,
    PRIMARY KEY (author_id, post_id),
    FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE
);

CREATE TABLE subscribers
(
    id    SERIAL PRIMARY KEY,
    email VARCHAR(256)
);
ALTER TABLE authors
    ADD CONSTRAINT unique_nick_email UNIQUE (nick, email);

CREATE TABLE tags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP
);

ALTER TABLE posts
    ADD COLUMN image_url VARCHAR(128);
CREATE TABLE subscriber_tags
(
    tag_id        INT NOT NULL,
    subscriber_id INT NOT NULL,
    PRIMARY KEY (tag_id, subscriber_id),
    FOREIGN KEY (subscriber_id) REFERENCES tags (id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES subscribers (id) ON DELETE CASCADE
);



CREATE INDEX idx_tags_tag ON tags (id);

ALTER TABLE authors
    ADD COLUMN github    VARCHAR(128),
    ADD COLUMN update_at TIMESTAMP;

CREATE VIEW authors_posts_view AS
SELECT authors.nick     AS author_nick,
       posts.title      AS post_title,
       posts.created_at AS post_created_at
FROM authors
         JOIN
     authors_posts ON authors.id = authors_posts.author_id
         JOIN
     posts ON authors_posts.post_id = posts.id;



ALTER TABLE subscribers
    ADD CONSTRAINT not_null_emall UNIQUE (email);


CREATE TABLE users
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(128)
);
CREATE TABLE addresses
(
    id      SERIAL PRIMARY KEY,
    user_id INT,
    city    VARCHAR(64),
    country VARCHAR(64),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE customers
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(128),
    surname VARCHAR(128)
);

CREATE TABLE cards
(
    id          SERIAL PRIMARY KEY,
    customer_id INT,
    number      VARCHAR(16),
    pin_code    VARCHAR(4),
    FOREIGN KEY (customer_id) REFERENCES customers (id)

);