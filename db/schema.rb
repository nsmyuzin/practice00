# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_19_082304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "article_pickups", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.text "description", comment: "説明"
    t.integer "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_selections", force: :cascade do |t|
    t.bigint "article_pickup_id"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_article_selections_on_article_id"
    t.index ["article_pickup_id"], name: "index_article_selections_on_article_pickup_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name", null: false, comment: "記事タイトル"
    t.text "sentence", null: false, comment: "文章"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", comment: "カテゴリID"
    t.string "image", comment: "イメージ画像"
    t.string "title", comment: "タイトル"
    t.string "meta_keyword", comment: "メタキーワード"
    t.text "meta_description", comment: "メタディスクリプション"
    t.bigint "content_id", comment: "コンテンツタイプ"
    t.integer "display_flag", default: 1, null: false, comment: "公開フラグ"
    t.datetime "from_display", comment: "公開開始日時"
    t.datetime "to_display", comment: "公開終了日時"
    t.index ["content_id"], name: "index_articles_on_content_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "m_title", null: false, comment: "管理用タイトル"
    t.string "title", comment: "タイトル"
    t.string "alt", comment: "alt"
    t.integer "width", comment: "縦幅"
    t.integer "height", comment: "横幅"
    t.string "image_url", null: false, comment: "画像URL"
    t.string "link_url", null: false, comment: "リンク"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "basic_infos", force: :cascade do |t|
    t.string "name", null: false, comment: "サイト名"
    t.string "sub_name", comment: "サイト名サブ"
    t.text "sentence", comment: "サイト説明文"
    t.string "header_logo", comment: "ヘッダーロゴ"
    t.string "footer_logo", comment: "フッターロゴ"
    t.string "copyright", comment: "コピーライト"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", comment: "サイトタイトル"
    t.string "meta_keyword", comment: "メタキーワード"
    t.text "meta_description", comment: "メタディスクリプション"
    t.string "from_system_email", default: "sample@sample.com", null: false, comment: "システムメール(from)"
    t.string "to_system_email", default: "sample@sample.com", null: false, comment: "システムメール(to)"
    t.string "public_email", default: "sample@sample.com", null: false, comment: "公開メールアドレス"
    t.string "email1"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリ名"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "category_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "category_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "category_desc_idx"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", comment: "名"
    t.string "family_name", comment: "姓"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "title", null: false, comment: "件名"
    t.text "message", null: false, comment: "本文"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name", null: false, comment: "フルネーム"
  end

  create_table "contents", force: :cascade do |t|
    t.string "name", null: false, comment: "コンテンツ名"
    t.string "sub_name", comment: "コンテンツ名サブ"
    t.text "description", comment: "コンテンツ説明文"
    t.string "url", null: false, comment: "url"
    t.integer "template", comment: "使用テンプレート"
    t.string "title", comment: "タイトル"
    t.text "meta_description", comment: "タグディスクリプション"
    t.string "meta_keyword", comment: "タグキーワード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_selections", "article_pickups"
  add_foreign_key "article_selections", "articles"
  add_foreign_key "articles", "contents"
end
