DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  user_id        varchar(20) not NULL,
  user_login     varchar(70) not NULL,
  display_login   varchar(70) not NULL,
  gravatar_id    varchar(50),
  user_url       varchar(150) not NULL,
  avatar_url     varchar(150) not NULL,
  PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS Repo;
CREATE TABLE Repo (
  repo_id     varchar(20) not NULL,
  repo_name   varchar(50) not NULL,
  repo_url    varhchar(150) not NULL,
  PRIMARY KEY (repo_id)
);

DROP TABLE IF EXISTS Org;
CREATE TABLE Org (
  org_id      varchar(20) not NULL,
  org_login   varchar(70) not NULL,
  gravatar_id varchar(50),
  org_url     varchar(150),
  avatar_url  varchar(150),
  PRIMARY KEY (org_id)
);

DROP TABLE IF EXISTS EventRelation;
CREATE TABLE EventRelation (
  user_id     varchar(20) not NULL,
  repo_id     varchar(20) not NULL,
  event_type  varchar(50) not NULL, 
  event_id    varchar(20) not NULL,
  org_id      varchar(20),
  public_evt  BOOLEAN,
  created_at  DATETIME,
  PRIMARY KEY (event_id),
  FOREIGN KEY (repo_id) REFERENCES Repo(repo_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (org_id) REFERENCES Org(org_id)
);

DROP TABLE IF EXISTS CreateEvent;
CREATE TABLE CreateEvent (
  create_id       varchar(20) not NULL,
  create_ref      varchar(150) not NULL, 
  ref_type        varchar(20) not NULL,
  master_branch   varchar(15) not NULL,
  create_descrip  varchar(200),
  pusher_type     varchar(20),
  PRIMARY KEY (create_id),
  FOREIGN KEY (create_id) REFERENCES EventRelation(event_id)
);

DROP TABLE IF EXISTS DeleteEvent;
CREATE TABLE DeleteEvent (
  delete_id   varchar(20) not NULL,
  delete_ref  varchar(150) not NULL,
  ref_type    varchar(20) not NULL,
  pusher_type varchar(20) not NULL,
  PRIMARY KEY (delete_id),
  FOREIGN KEY (delete_id) REFERENCES EventRelation(event_id)
);
