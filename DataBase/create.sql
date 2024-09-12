--create
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS api cascade;
DROP TABLE IF EXISTS Sales_receipt cascade;
DROP TABLE IF EXISTS logs cascade;
DROP TABLE IF EXISTS money_types cascade;
DROP TABLE IF EXISTS money_types_for_each_api cascade;


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
  version varchar(10),
  body text,
  created_at timestamp,
  period_price int,
  use_price int,
  foreign key (creator_id) references users(id) 
);

create Table Sales_receipt (
  id serial primary key,
  seller_id integer,
  customer_id integer,
  money_types_for_each_api_id integer,
  period_begin date,
  period_end date,
  count_of_request int,
  total_price int,
  body text,
  created_at timestamp,
  foreign key (seller_id) references users(id),
  foreign key (customer_id) references users(id),
  foreign key (money_types_for_each_api_id) references money_types_for_each_api(id)
);

create Table logs (
  id serial primary key,
  type varchar(20),
  user_id serial,
  sales_id serial,
  activation_event boolean,
  count_of_current_request int,
  created_at timestamp,
  foreign key (user_id) references users(id),
  foreign key (sales_id) references Sales_receipt(id)
);

create Table money_types (
  id serial primary key,
  type_of_use varchar(30),
  description text
);

create Table money_types_for_each_api( 
  id serial primary key,
  id_api serial,
  id_money_type serial,
  unit_of_payment int,
  price int,
  body text,
  foreign key (id_api) references api(id),
  foreign key (id_money_type) references money_types(id) 
);

