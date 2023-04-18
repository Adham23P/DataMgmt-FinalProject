# DataMgmt-FinalProject

Authors: Karl Simon, Josh Rizika, Adham Popal

Objective: Translation of JSON to SQL type database

Using the Github Events API at https://api.github.com/events?utm_medium=referral&utm_campaign=ZEEF&utm_source=https%3A%2F%2Fjson-datasets.zeef.com%2Fjdorfman
(Sample JSON file provided)

Sqlite3 and the associated .db file act as our database created from the .sql file. The .sql file contains the created tables with their own primary and foreign keys. Python is used to parse the Github Events API and properly insert into our local database named git.db. ER Diagrams used in the planning are also provided in a folder and contains an SQL diagram as well that more clearly highlight how our database is setup from a technical perspective.