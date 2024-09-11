--create
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS api cascade;
DROP TABLE IF EXISTS Sales_receipt cascade;
DROP TABLE IF EXISTS logs cascade;

create Table users (
  id serial primary key,
  username varchar(50),
  password varchar(18),
  role varchar(12),
  first_name varchar(20),
  last_name varchar(20),
  patronymic varchar(20),
  age int,
  birth_date date,
  phone varchar(11),
  created_at timestamp
);

create Table api (
  id serial primary key,
  creator_id serial,
  name varchar(30),
  type varchar(30),
  protocol varchar(10),
  body text,
  created_at timestamp,
  price int,
  count_of_uses int,
  foreign key (creator_id) references users(id)  
);

create Table Sales_receipt (
  id serial primary key,
  seller_id integer,
  buyer_id integer,
  api_id integer,
  body text,
  created_at timestamp,
  foreign key (seller_id) references users(id),
  foreign key (buyer_id) references users(id)
);

create Table logs (
  id serial primary key,
  type varchar(20),
  user_id serial,
  api_id serial,
  body text,
  created_at timestamp,
  foreign key (user_id) references users(id),
  foreign key (api_id) references api(id)
);

