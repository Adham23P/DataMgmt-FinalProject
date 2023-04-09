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

DROP TABLE IF EXISTS PullRequestEvent;
CREATE TABLE PullRequestEvent (
  pullreq_event_id     varchar(20) not NULL,
  num_pull            int(2),
  pullreq_id          varchar(20) not NULL,
  author_assoc        varchar(20),
  auto_merge          BOOLEAN,
  active_lock_reason  BOOLEAN,
  merged              BOOLEAN,
  mergeable           BOOLEAN,
  rebaseable          BOOLEAN,
  mergeable_state     varchar(20),
  merged_by           varchar(50),       
  num_comments        int(2),
  num_review_comments     int(2),
  maintainer_can_modify BOOLEAN,
  num_commits         int(2),
  additions           int(2),
  deletions           int(2),
  changed_files       int(2),
  PRIMARY KEY (pullreq_event_id)
  FOREIGN KEY (pullreq_event_id) REFERENCES EventRelation(event_id)
);

DROP TABLE IF EXISTS PullRequest;
CREATE TABLE PullRequest (
  pullreq_id     varchar(20) not NULL,
  pullreq_url     varchar(150) not NULL,
  pullnode_id     varchar(20) not NULL,
  html_url        varchar(150), 
  diff_url        varchar(150), 
  patch_url       varchar(150), 
  issue_url       varchar(150),
  pullreq_state   varchar(20), 
  pullreq_locked  BOOLEAN,
  title           varchar(70),
  pullreq_body    LONGTEXT,
  created_at      DATETIME,
  updated_at      DATETIME,
  closed_at       DATETIME,
  merged_at       DATETIME,
  assignee        varchar(70),
  assignees       varchar(210),
  requested_reviewers varchar(210),
  requested_teams varchar(100),
  labels          varchar(250),
  commits_url     varchar(150),
  review_comment_url  varchar(150),
  review_comments_url varchar(150),
  comments_url    varchar(150),
  statuses_url    varchar(150),
  head_sha        varchar(50),
  base_sha        varchar(50),
  PRIMARY KEY (pullreq_id),
  FOREIGN KEY (pullreq_id) REFERENCES PullRequestEvent(pullreq_id)     
);

