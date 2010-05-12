# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100512135842) do

  create_table "adjudicatarios", :force => true do |t|
    t.string   "cif"
    t.string   "nombre"
    t.text     "direction"
    t.string   "poblacion"
    t.string   "cp"
    t.string   "tlf"
    t.string   "fax"
    t.string   "email"
    t.text     "web"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adjudicatarios", ["cif"], :name => "index_adjudicatarios_on_cif"

  create_table "comentarios", :force => true do |t|
    t.integer  "usario_id"
    t.integer  "licitacion_id"
    t.integer  "tipo_licitacion_id"
    t.text     "comentario"
    t.boolean  "is_vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comentarios", ["licitacion_id"], :name => "index_comentarios_on_licitacion_id"
  add_index "comentarios", ["tipo_licitacion_id"], :name => "index_comentarios_on_tipo_licitacion_id"
  add_index "comentarios", ["usario_id"], :name => "index_comentarios_on_usario_id"

  create_table "comunidad_autonomas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuente_datos", :force => true do |t|
    t.string   "nombre"
    t.datetime "ultima_importacion"
    t.text     "web"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licitacion_adjudicatarios", :force => true do |t|
    t.integer  "licitacion_id"
    t.integer  "adjudicatario_id"
    t.float    "importe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licitacion_adjudicatarios", ["adjudicatario_id"], :name => "index_licitacion_adjudicatarios_on_adjudicatario_id"
  add_index "licitacion_adjudicatarios", ["licitacion_id"], :name => "index_licitacion_adjudicatarios_on_licitacion_id"

  create_table "licitacions", :force => true do |t|
    t.integer  "organo_convocante_id"
    t.string   "expediente"
    t.integer  "tipo_procedimiento_id"
    t.integer  "tipo_licitacion_id"
    t.float    "importe"
    t.datetime "fecha_publicacion"
    t.datetime "fecha_adjudicacion"
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "codigo_cpv_ppal"
    t.integer  "estado_id"
    t.text     "url_licitacion"
    t.integer  "votes_up"
    t.integer  "votes_down"
    t.integer  "num_comentarios"
    t.text     "ref_publicacion"
    t.integer  "fuente_datos_id"
    t.integer  "programa_financion_id"
    t.datetime "fecha_ultima_actualizacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licitacions", ["codigo_cpv_ppal"], :name => "index_licitacions_on_codigo_cpv_ppal"
  add_index "licitacions", ["estado_id"], :name => "index_licitacions_on_estado_id"
  add_index "licitacions", ["expediente"], :name => "index_licitacions_on_expediente"
  add_index "licitacions", ["fuente_datos_id"], :name => "index_licitacions_on_fuente_datos_id"
  add_index "licitacions", ["importe"], :name => "index_licitacions_on_importe"
  add_index "licitacions", ["organo_convocante_id"], :name => "index_licitacions_on_organo_convocante_id"
  add_index "licitacions", ["programa_financion_id"], :name => "index_licitacions_on_programa_financion_id"
  add_index "licitacions", ["tipo_licitacion_id"], :name => "index_licitacions_on_tipo_licitacion_id"
  add_index "licitacions", ["tipo_procedimiento_id"], :name => "index_licitacions_on_tipo_procedimiento_id"
  add_index "licitacions", ["titulo"], :name => "index_licitacions_on_titulo"

  create_table "organo_convocantes", :force => true do |t|
    t.integer  "perfil_contratante_id"
    t.text     "nombre"
    t.string   "direccion"
    t.string   "poblacion"
    t.string   "cp"
    t.string   "tlf"
    t.string   "fax"
    t.string   "email"
    t.text     "web"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organo_convocantes", ["perfil_contratante_id"], :name => "index_organo_convocantes_on_perfil_contratante_id"

  create_table "partido_politicos", :force => true do |t|
    t.string   "nombre"
    t.string   "siglas"
    t.text     "web"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfil_contratantes", :force => true do |t|
    t.integer  "tipo_perfil_contratante_id"
    t.string   "nombre"
    t.string   "cif"
    t.text     "wikipedia_url"
    t.integer  "partido_politico_id"
    t.text     "foto"
    t.text     "escudo"
    t.integer  "habitantes"
    t.text     "alcalde_voota_link"
    t.integer  "provincia_id"
    t.integer  "comunidad_autonoma_id"
    t.text     "direccion"
    t.text     "poblacion"
    t.string   "cp"
    t.string   "tlf"
    t.string   "fax"
    t.text     "web"
    t.string   "email"
    t.float    "presupuesto_total"
    t.text     "presupuesto_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perfil_contratantes", ["cif"], :name => "index_perfil_contratantes_on_cif"
  add_index "perfil_contratantes", ["comunidad_autonoma_id"], :name => "index_perfil_contratantes_on_comunidad_autonoma_id"
  add_index "perfil_contratantes", ["partido_politico_id"], :name => "index_perfil_contratantes_on_partido_politico_id"
  add_index "perfil_contratantes", ["provincia_id"], :name => "index_perfil_contratantes_on_provincia_id"
  add_index "perfil_contratantes", ["tipo_perfil_contratante_id"], :name => "index_perfil_contratantes_on_tipo_perfil_contratante_id"

  create_table "programa_financiacions", :force => true do |t|
    t.string   "nombre"
    t.string   "nivel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provincias", :force => true do |t|
    t.string   "nombre"
    t.integer  "comunidad_autonoma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_licitacions", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_perfil_contratantes", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_procedimientos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "token"
    t.string   "nombre"
    t.string   "email"
    t.text     "web"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email"
  add_index "usuarios", ["token"], :name => "index_usuarios_on_token"

end
