create table authors(
    author_id SERIAL primary key,
    name varchar(50),
    surname varchar(50),
    email varchar(20),
    created_at timestamp default NOW()
);
create table posts(
    post_id SERIAL primary key,
    title varchar(255),
    created_at timestamp,
    update_at timestamp
);
alter table authors add column about varchar(255), add column nick varchar(20);


CREATE TABLE author_posts (
    author_id INT NOT NULL,
    post_id INT NOT NULL,
    PRIMARY KEY (author_id, post_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE
);

CREATE TABLE subscribers(
    id SERIAL PRIMARY KEY,
    email VARCHAR(255)
);
ALTER TABLE authors
    ADD CONSTRAINT unique_nick_email UNIQUE (nick, email);

CREATE TABLE tags(
    id SERIAL PRIMARY KEY,
    created_at timestamp
);

ALTER TABLE posts ADD COLUMN image_url VARCHAR(255);
CREATE TABLE subscriber_tags (
    tag_id INT NOT NULL,
    subscriber_id INT NOT NULL,
    PRIMARY KEY (tag_id, subscriber_id),
    FOREIGN KEY (subscriber_id) REFERENCES tags(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES subscribers(id) ON DELETE CASCADE
);





CREATE INDEX idx_tags_tag ON tags(id);

ALTER TABLE authors ADD COLUMN github VARCHAR(255), ADD COLUMN update_at TIMESTAMP;

CREATE VIEW authors_posts_view AS
SELECT
    authors.nick AS author_nick,
    posts.title AS post_title,
    posts.created_at AS post_created_at
FROM
    authors
JOIN
    author_posts ON authors.author_id = author_posts.author_id
JOIN
    posts ON author_posts.post_id = posts.post_id;



ALTER TABLE subscribers
    ADD CONSTRAINT not_null_emall UNIQUE (email);


CREATE TABLE users(
    id SERIAL PRIMARY KEY ,
    name VARCHAR(120)
);
CREATE TABLE address(
    id SERIAL PRIMARY KEY,
    user_id INT,
    city VARCHAR(50),
    country varchar(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE customer(
    id SERIAL PRIMARY KEY,
    name varchar(255),
    surname varchar(255)
);

CREATE TABLE cards(
    id SERIAL PRIMARY KEY,
    customer_id INT,
    number VARCHAR(16),
    pin_code VARCHAR(4),
    foreign key (customer_id) references customer(id)

);