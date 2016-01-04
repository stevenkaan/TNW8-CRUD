CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "cities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "city_name" varchar(255), "country_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_cities_on_country_id" ON "cities" ("country_id");
CREATE TABLE "markers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "city_id" integer, "created_at" datetime, "updated_at" datetime, "marker_images" json, "marker_images_2" json, "marker_images_3" json, "marker_images_4" json, "marker_lng" float, "marker_lat" float, "marker_type" int, "icon_only" boolean);
CREATE INDEX "index_markers_on_city_id" ON "markers" ("city_id");
CREATE TABLE "countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "country_name_nld" varchar(255), "created_at" datetime, "updated_at" datetime, "country_name_eng" varchar(255), "country_name_esp" varchar(255));
CREATE TABLE "city_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "language" varchar(255), "city_id" integer, "created_at" datetime, "updated_at" datetime, "name" varchar(255));
CREATE INDEX "index_city_infos_on_city_id" ON "city_infos" ("city_id");
CREATE TABLE "marker_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "language" varchar(255), "marker_id" integer, "created_at" datetime, "updated_at" datetime, "marker_audio" json, "name" varchar(255));
CREATE INDEX "index_marker_infos_on_marker_id" ON "marker_infos" ("marker_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "password_digest" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "routes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "afstand" decimal, "city_id" integer, "created_at" datetime, "updated_at" datetime, "multiple_starting_points" boolean, "name_nld" varchar(255), "info_nld" text, "name_eng" varchar(255), "info_eng" text, "name_esp" varchar(255), "info_esp" text);
CREATE INDEX "index_routes_on_city_id" ON "routes" ("city_id");
CREATE TABLE "markers_routes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "marker_id" integer NOT NULL, "route_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime, "position" int);
INSERT INTO schema_migrations (version) VALUES ('20150929113828');

INSERT INTO schema_migrations (version) VALUES ('20150930083518');

INSERT INTO schema_migrations (version) VALUES ('20151007082934');

INSERT INTO schema_migrations (version) VALUES ('20151007102457');

INSERT INTO schema_migrations (version) VALUES ('20151008122536');

INSERT INTO schema_migrations (version) VALUES ('20151012113934');

INSERT INTO schema_migrations (version) VALUES ('20151013090602');

INSERT INTO schema_migrations (version) VALUES ('20151014102855');

INSERT INTO schema_migrations (version) VALUES ('20151026131636');

INSERT INTO schema_migrations (version) VALUES ('20151111130639');

INSERT INTO schema_migrations (version) VALUES ('20151111133247');

INSERT INTO schema_migrations (version) VALUES ('20151112110642');

INSERT INTO schema_migrations (version) VALUES ('20151117113647');

INSERT INTO schema_migrations (version) VALUES ('20151118100909');

INSERT INTO schema_migrations (version) VALUES ('20151216102436');
