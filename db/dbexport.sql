CREATE TABLE "public"."action_text_rich_texts" ( 
  "id" SERIAL,
  "name" VARCHAR NOT NULL,
  "body" TEXT NULL,
  "record_type" VARCHAR NOT NULL,
  "record_id" BIGINT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "action_text_rich_texts_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."active_storage_variant_records" ( 
  "id" SERIAL,
  "blob_id" BIGINT NOT NULL,
  "variation_digest" VARCHAR NOT NULL,
  CONSTRAINT "active_storage_variant_records_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."admin_permissions" ( 
  "id" SERIAL,
  "action" VARCHAR(255) NULL,
  "subject" VARCHAR(255) NULL,
  "properties" JSONB NULL,
  "conditions" JSONB NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "admin_permissions_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."admin_permissions_role_links" ( 
  "permission_id" INTEGER NULL,
  "role_id" INTEGER NULL
);
CREATE TABLE "public"."admin_roles" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "code" VARCHAR(255) NULL,
  "description" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "admin_roles_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."admin_users_roles_links" ( 
  "user_id" INTEGER NULL,
  "role_id" INTEGER NULL
);
CREATE TABLE "public"."announcements" ( 
  "id" SERIAL,
  "published_at" TIMESTAMP NULL,
  "announcement_type" VARCHAR NULL,
  "name" VARCHAR NULL,
  "description" TEXT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "announcements_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."admin_users" ( 
  "id" SERIAL,
  "firstname" VARCHAR(255) NULL,
  "lastname" VARCHAR(255) NULL,
  "username" VARCHAR(255) NULL,
  "email" VARCHAR(255) NULL,
  "password" VARCHAR(255) NULL,
  "reset_password_token" VARCHAR(255) NULL,
  "registration_token" VARCHAR(255) NULL,
  "is_active" BOOLEAN NULL,
  "blocked" BOOLEAN NULL,
  "prefered_language" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "admin_users_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."files_related_morphs" ( 
  "file_id" INTEGER NULL,
  "related_id" INTEGER NULL,
  "related_type" VARCHAR(255) NULL,
  "field" VARCHAR(255) NULL,
  "order" INTEGER NULL
);
CREATE TABLE "public"."friendly_id_slugs" ( 
  "id" SERIAL,
  "slug" VARCHAR NOT NULL,
  "sluggable_id" INTEGER NOT NULL,
  "sluggable_type" VARCHAR(50) NULL,
  "scope" VARCHAR NULL,
  "created_at" TIMESTAMP NULL,
  CONSTRAINT "friendly_id_slugs_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."services" ( 
  "id" SERIAL,
  "user_id" BIGINT NOT NULL,
  "provider" VARCHAR NULL,
  "uid" VARCHAR NULL,
  "access_token" VARCHAR NULL,
  "access_token_secret" VARCHAR NULL,
  "refresh_token" VARCHAR NULL,
  "expires_at" TIMESTAMP NULL,
  "auth" TEXT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "services_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."notifications" ( 
  "id" SERIAL,
  "recipient_type" VARCHAR NOT NULL,
  "recipient_id" BIGINT NOT NULL,
  "type" VARCHAR NOT NULL,
  "params" JSON NULL,
  "read_at" TIMESTAMP NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."strapi_api_tokens" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "description" VARCHAR(255) NULL,
  "type" VARCHAR(255) NULL,
  "access_key" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "strapi_api_tokens_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."strapi_core_store_settings" ( 
  "id" SERIAL,
  "key" VARCHAR(255) NULL,
  "value" TEXT NULL,
  "type" VARCHAR(255) NULL,
  "environment" VARCHAR(255) NULL,
  "tag" VARCHAR(255) NULL,
  CONSTRAINT "strapi_core_store_settings_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."i18n_locale" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "code" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "i18n_locale_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."strapi_database_schema" ( 
  "id" SERIAL,
  "schema" JSON NULL,
  "time" TIMESTAMP NULL,
  "hash" VARCHAR(255) NULL,
  CONSTRAINT "strapi_database_schema_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."strapi_migrations" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "time" TIMESTAMP NULL,
  CONSTRAINT "strapi_migrations_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."strapi_webhooks" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "url" TEXT NULL,
  "headers" JSONB NULL,
  "events" JSONB NULL,
  "enabled" BOOLEAN NULL,
  CONSTRAINT "strapi_webhooks_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."up_permissions_role_links" ( 
  "permission_id" INTEGER NULL,
  "role_id" INTEGER NULL
);
CREATE TABLE "public"."ar_internal_metadata" ( 
  "key" VARCHAR NOT NULL,
  "value" VARCHAR NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key")
);
CREATE TABLE "public"."active_storage_blobs" ( 
  "id" SERIAL,
  "key" VARCHAR NOT NULL,
  "filename" VARCHAR NOT NULL,
  "content_type" VARCHAR NULL,
  "metadata" TEXT NULL,
  "service_name" VARCHAR NOT NULL,
  "byte_size" BIGINT NOT NULL,
  "checksum" VARCHAR NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  CONSTRAINT "active_storage_blobs_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."active_storage_attachments" ( 
  "id" SERIAL,
  "name" VARCHAR NOT NULL,
  "record_type" VARCHAR NOT NULL,
  "record_id" BIGINT NOT NULL,
  "blob_id" BIGINT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  CONSTRAINT "active_storage_attachments_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."files" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "alternative_text" VARCHAR(255) NULL,
  "caption" VARCHAR(255) NULL,
  "width" INTEGER NULL,
  "height" INTEGER NULL,
  "formats" JSONB NULL,
  "hash" VARCHAR(255) NULL,
  "ext" VARCHAR(255) NULL,
  "mime" VARCHAR(255) NULL,
  "size" NUMERIC NULL,
  "url" VARCHAR(255) NULL,
  "preview_url" VARCHAR(255) NULL,
  "provider" VARCHAR(255) NULL,
  "provider_metadata" JSONB NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "files_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."users" ( 
  "id" SERIAL,
  "email" VARCHAR NOT NULL DEFAULT '' ,
  "encrypted_password" VARCHAR NOT NULL DEFAULT '' ,
  "reset_password_token" VARCHAR NULL,
  "reset_password_sent_at" TIMESTAMP NULL,
  "remember_created_at" TIMESTAMP NULL,
  "sign_in_count" INTEGER NOT NULL DEFAULT 0 ,
  "current_sign_in_at" TIMESTAMP NULL,
  "last_sign_in_at" TIMESTAMP NULL,
  "current_sign_in_ip" VARCHAR NULL,
  "last_sign_in_ip" VARCHAR NULL,
  "confirmation_token" VARCHAR NULL,
  "confirmed_at" TIMESTAMP NULL,
  "confirmation_sent_at" TIMESTAMP NULL,
  "unconfirmed_email" VARCHAR NULL,
  "first_name" VARCHAR NULL,
  "last_name" VARCHAR NULL,
  "announcements_last_read_at" TIMESTAMP NULL,
  "admin" BOOLEAN NULL DEFAULT false ,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."up_permissions" ( 
  "id" SERIAL,
  "action" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "up_permissions_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."up_roles" ( 
  "id" SERIAL,
  "name" VARCHAR(255) NULL,
  "description" VARCHAR(255) NULL,
  "type" VARCHAR(255) NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "up_roles_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."up_users" ( 
  "id" SERIAL,
  "username" VARCHAR(255) NULL,
  "email" VARCHAR(255) NULL,
  "provider" VARCHAR(255) NULL,
  "password" VARCHAR(255) NULL,
  "reset_password_token" VARCHAR(255) NULL,
  "confirmation_token" VARCHAR(255) NULL,
  "confirmed" BOOLEAN NULL,
  "blocked" BOOLEAN NULL,
  "created_at" TIMESTAMP NULL,
  "updated_at" TIMESTAMP NULL,
  "created_by_id" INTEGER NULL,
  "updated_by_id" INTEGER NULL,
  CONSTRAINT "up_users_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."up_users_role_links" ( 
  "user_id" INTEGER NULL,
  "role_id" INTEGER NULL
);
CREATE TABLE "public"."schema_migrations" ( 
  "version" VARCHAR NOT NULL,
  CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version")
);
ALTER TABLE "public"."active_storage_variant_records" ADD CONSTRAINT "fk_rails_993965df05" FOREIGN KEY ("blob_id") REFERENCES "public"."active_storage_blobs" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_permissions_role_links" ADD CONSTRAINT "admin_permissions_role_links_fk" FOREIGN KEY ("permission_id") REFERENCES "public"."admin_permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_permissions_role_links" ADD CONSTRAINT "admin_permissions_role_links_inv_fk" FOREIGN KEY ("role_id") REFERENCES "public"."admin_roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_users_roles_links" ADD CONSTRAINT "admin_users_roles_links_inv_fk" FOREIGN KEY ("role_id") REFERENCES "public"."admin_roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_users_roles_links" ADD CONSTRAINT "admin_users_roles_links_fk" FOREIGN KEY ("user_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."files_related_morphs" ADD CONSTRAINT "files_related_morphs_fk" FOREIGN KEY ("file_id") REFERENCES "public"."files" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."services" ADD CONSTRAINT "fk_rails_51a813203f" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."strapi_api_tokens" ADD CONSTRAINT "strapi_api_tokens_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."strapi_api_tokens" ADD CONSTRAINT "strapi_api_tokens_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."i18n_locale" ADD CONSTRAINT "i18n_locale_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."i18n_locale" ADD CONSTRAINT "i18n_locale_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_permissions_role_links" ADD CONSTRAINT "up_permissions_role_links_fk" FOREIGN KEY ("permission_id") REFERENCES "public"."up_permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_permissions_role_links" ADD CONSTRAINT "up_permissions_role_links_inv_fk" FOREIGN KEY ("role_id") REFERENCES "public"."up_roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."active_storage_attachments" ADD CONSTRAINT "fk_rails_c3b3935057" FOREIGN KEY ("blob_id") REFERENCES "public"."active_storage_blobs" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."files" ADD CONSTRAINT "files_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."files" ADD CONSTRAINT "files_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_permissions" ADD CONSTRAINT "up_permissions_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_permissions" ADD CONSTRAINT "up_permissions_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_roles" ADD CONSTRAINT "up_roles_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_roles" ADD CONSTRAINT "up_roles_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_users" ADD CONSTRAINT "up_users_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_users" ADD CONSTRAINT "up_users_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_users_role_links" ADD CONSTRAINT "up_users_role_links_inv_fk" FOREIGN KEY ("role_id") REFERENCES "public"."up_roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."up_users_role_links" ADD CONSTRAINT "up_users_role_links_fk" FOREIGN KEY ("user_id") REFERENCES "public"."up_users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
