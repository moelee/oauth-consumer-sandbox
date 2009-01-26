CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(40), "name" varchar(100) DEFAULT '', "email" varchar(100), "crypted_password" varchar(40), "salt" varchar(40), "created_at" datetime, "updated_at" datetime, "remember_token" varchar(40), "remember_token_expires_at" datetime);
CREATE UNIQUE INDEX "index_users_on_login" ON "users" ("login");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090126011215');