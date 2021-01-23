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

ActiveRecord::Schema.define(version: 2021_01_22_150232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.integer "number"
    t.string "street"
    t.string "city"
    t.string "uf"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "complement"
    t.string "neighborhood"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "atestados", force: :cascade do |t|
    t.string "text"
    t.string "cidade"
    t.string "crp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_atestados_on_patient_id"
  end

  create_table "configs", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "declaracoes", force: :cascade do |t|
    t.string "crp"
    t.string "text"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_declaracoes_on_patient_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "personal_moment"
    t.string "profissional_moment"
    t.string "interests"
    t.string "conclusions"
    t.string "intelectual_map", default: [], array: true
    t.string "personalities_characteristics", default: [], array: true
    t.string "facilities", default: [], array: true
    t.string "dificulties", default: [], array: true
    t.integer "psicological_concepts", default: [], array: true
    t.string "performance_diagnostic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_forms_on_patient_id"
  end

  create_table "formularios", force: :cascade do |t|
    t.json "content"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.integer "identifier"
    t.index ["patient_id"], name: "index_formularios_on_patient_id"
  end

  create_table "graficos", force: :cascade do |t|
    t.json "data"
    t.string "kind", default: "bar"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "laudo_id"
    t.index ["laudo_id"], name: "index_graficos_on_laudo_id"
  end

  create_table "laudos", force: :cascade do |t|
    t.string "crp"
    t.string "solicitante"
    t.string "description"
    t.string "procedure"
    t.string "analysis"
    t.string "conclusion"
    t.string "references"
    t.string "kind", default: "psicologico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_laudos_on_patient_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_visits", force: :cascade do |t|
    t.bigint "patient_id"
    t.date "date"
    t.string "hour"
    t.string "description"
    t.float "value"
    t.json "documents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_office_visits_on_patient_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.bigint "office_visit_id"
    t.float "value"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_visit_id"], name: "index_parcels_on_office_visit_id"
  end

  create_table "pareceres", force: :cascade do |t|
    t.string "crp"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "analysis"
    t.string "conclusion"
    t.string "references"
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_pareceres_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id"
    t.json "avatar"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.date "birth_date"
    t.integer "gender"
    t.string "phone"
    t.string "relative_phone"
    t.string "profession"
    t.string "cpf"
    t.string "naturalidade"
    t.bigint "address_id"
    t.index ["address_id"], name: "index_patients_on_address_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "relatorios", force: :cascade do |t|
    t.string "crp"
    t.string "atendido"
    t.string "solicitante"
    t.string "description"
    t.string "procedure"
    t.string "analysis"
    t.string "conclusion"
    t.string "goal"
    t.string "kind", default: "psicologico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_relatorios_on_patient_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "status"
    t.string "mercado_pago_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pag_seguro_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mercado_pago_id"
    t.string "document_number"
    t.string "document_type", default: "CPF"
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.bigint "user_preference_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_preference_id"], name: "index_users_on_user_preference_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "atestados", "patients"
  add_foreign_key "declaracoes", "patients"
  add_foreign_key "formularios", "patients"
  add_foreign_key "graficos", "laudos"
  add_foreign_key "laudos", "patients"
  add_foreign_key "office_visits", "patients"
  add_foreign_key "pareceres", "patients"
  add_foreign_key "patients", "addresses"
  add_foreign_key "relatorios", "patients"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "users", "user_preferences"
end
