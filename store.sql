DROP TABLE IF EXISTS Users;
CREATE TABLE users (
  user_id        varchar(20) not null,
  user_login     varchar(70) not null,
  displaylogin   varchar(70) not null,
  gravatar_id    varchar(50) not null,
  user_url       varchar(150) not null,
  avatar_url     varchar(150) not null,
  PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS Repo;
CREATE TABLE repo (
  repo_id     varchar(20) not NULL,
  repo_name   varchar(50) not NULL,
  repo_url    varhchar(150) not NULL,
  PRIMARY KEY (repo_id)
);

DROP TABLE IF EXISTS CreateEvent;
CREATE TABLE CreateEvent (
  create_id       varchar(20) not NULL,
  create_ref      varchar(150) not NULL, 
  ref_type        varchar(20) not NULL,
  master_branch   varchar(15) not NULL,
  create_descrip  varchar(200),
  pusher_type     varchar(20),
  public_evt      BOOLEAN not NULL,
  created_at      DATETIME,
  repo_id         varchar(20) not NULL,
  user_id_execute varchar(20) not NULL,
  PRIMARY KEY (create_id),
  Foreign Key (repo_id) REFERENCES repo(repo_id),
  Foreign Key (user_id_execute) REFERENCES users(user_id)
)
