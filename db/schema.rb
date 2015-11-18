# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151118172243) do

  create_table "cobrancas", force: :cascade do |t|
    t.decimal  "valor",      precision: 14, scale: 2
    t.float    "juros"
    t.float    "multa"
    t.float    "atualizado"
    t.date     "vencimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "composicao_cobrancas", force: :cascade do |t|
    t.integer  "cobranca_id"
    t.decimal  "valor",       precision: 14, scale: 2
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "composicao_cobrancas", ["cobranca_id"], name: "index_composicao_cobrancas_on_cobranca_id"

  create_table "recebimentos", force: :cascade do |t|
    t.integer  "cobranca_id"
    t.date     "data"
    t.decimal  "valor",       precision: 14, scale: 2
    t.decimal  "juros",       precision: 14, scale: 2
    t.decimal  "multa",       precision: 14, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recebimentos", ["cobranca_id"], name: "index_recebimentos_on_cobranca_id"

end
