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

  create_table "adjudicacions", :force => true do |t|
    t.column "licitacion_id", :integer
    t.column "adjudicatario_id", :integer
    t.column "importe", :float
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "adjudicacions", ["adjudicatario_id"], :name => "index_adjudicacions_on_adjudicatario_id"
  add_index "adjudicacions", ["licitacion_id"], :name => "index_adjudicacions_on_licitacion_id"

  create_table "adjudicatarios", :force => true do |t|
    t.column "cif", :string
    t.column "nombre", :string
    t.column "direccion", :string
    t.column "poblacion", :string
    t.column "cp", :string
    t.column "tlf", :string
    t.column "fax", :string
    t.column "email", :string
    t.column "web", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "adjudicatarios", ["cif"], :name => "index_adjudicatarios_on_cif"

  create_table "administracions", :force => true do |t|
    t.column "nombre", :string
    t.column "cif", :string
    t.column "wikipedia_url", :text
    t.column "foto", :text
    t.column "escudo", :text
    t.column "habitantes", :integer
    t.column "alcalde_voota_link", :text
    t.column "presupuesto_total", :float
    t.column "presupuesto_url", :text
    t.column "parent_id", :integer
    t.column "lft", :integer
    t.column "rgt", :integer
    t.column "direccion", :string
    t.column "poblacion", :string
    t.column "cp", :string
    t.column "tlf", :string
    t.column "fax", :string
    t.column "email", :string
    t.column "web", :string
    t.column "tipo_administracion_id", :integer
    t.column "provincia_id", :integer
    t.column "comunidad_autonoma_id", :integer
    t.column "partido_politico_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "administracions", ["cif"], :name => "index_administracions_on_cif"
  add_index "administracions", ["comunidad_autonoma_id"], :name => "index_administracions_on_comunidad_autonoma_id"
  add_index "administracions", ["partido_politico_id"], :name => "index_administracions_on_partido_politico_id"
  add_index "administracions", ["provincia_id"], :name => "index_administracions_on_provincia_id"
  add_index "administracions", ["tipo_administracion_id"], :name => "index_administracions_on_tipo_administracion_id"

  create_table "comentarios", :force => true do |t|
    t.column "usuario_id", :integer
    t.column "licitacion_id", :integer
    t.column "tipo_licitacion_id", :integer
    t.column "comentario", :text
    t.column "is_vote", :boolean
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "comentarios", ["licitacion_id"], :name => "index_comentarios_on_licitacion_id"
  add_index "comentarios", ["tipo_licitacion_id"], :name => "index_comentarios_on_tipo_licitacion_id"
  add_index "comentarios", ["usuario_id"], :name => "index_comentarios_on_usuario_id"

  create_table "comunidad_autonomas", :force => true do |t|
    t.column "nombre", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "fuente_datos", :force => true do |t|
    t.column "nombre", :string
    t.column "ultima_importacion", :datetime
    t.column "web", :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "licitacions", :force => true do |t|
    t.column "organo_contratacion_id", :integer
    t.column "expediente", :string
    t.column "tipo_procedimiento_id", :integer
    t.column "tipo_licitacion_id", :integer
    t.column "importe_estimado", :float
    t.column "fecha_publicacion", :datetime
    t.column "fecha_adjudicacion", :datetime
    t.column "titulo", :string
    t.column "descripcion", :text
    t.column "codigo_cpv_ppal", :string
    t.column "url_licitacion", :text
    t.column "votes_up", :integer, :default => 0
    t.column "votes_down", :integer, :default => 0
    t.column "num_comentarios", :integer, :default => 0
    t.column "ref_publicacion", :text
    t.column "mesa_contratacion", :text
    t.column "fuente_datos_id", :integer
    t.column "programa_financion_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "licitacions", ["codigo_cpv_ppal"], :name => "index_licitacions_on_codigo_cpv_ppal"
  add_index "licitacions", ["expediente"], :name => "index_licitacions_on_expediente"
  add_index "licitacions", ["fuente_datos_id"], :name => "index_licitacions_on_fuente_datos_id"
  add_index "licitacions", ["importe_estimado"], :name => "index_licitacions_on_importe_estimado"
  add_index "licitacions", ["organo_contratacion_id"], :name => "index_licitacions_on_organo_contratacion_id"
  add_index "licitacions", ["programa_financion_id"], :name => "index_licitacions_on_programa_financion_id"
  add_index "licitacions", ["tipo_licitacion_id"], :name => "index_licitacions_on_tipo_licitacion_id"
  add_index "licitacions", ["tipo_procedimiento_id"], :name => "index_licitacions_on_tipo_procedimiento_id"
  add_index "licitacions", ["titulo"], :name => "index_licitacions_on_titulo"

  create_table "organo_contratacions", :force => true do |t|
    t.column "administracion_id", :integer
    t.column "nombre", :text
    t.column "direccion", :string
    t.column "poblacion", :string
    t.column "cp", :string
    t.column "tlf", :string
    t.column "fax", :string
    t.column "email", :string
    t.column "web", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "organo_contratacions", ["administracion_id"], :name => "index_organo_contratacions_on_administracion_id"

  create_table "partido_politicos", :force => true do |t|
    t.column "nombre", :string
    t.column "siglas", :string
    t.column "web", :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "programa_financiacions", :force => true do |t|
    t.column "nombre", :string
    t.column "nivel", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "provincias", :force => true do |t|
    t.column "nombre", :string
    t.column "comunidad_autonoma_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "provincias", ["comunidad_autonoma_id"], :name => "index_provincias_on_comunidad_autonoma_id"

  create_table "tipo_administracions", :force => true do |t|
    t.column "nombre", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "tipo_licitacions", :force => true do |t|
    t.column "nombre", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "tipo_procedimientos", :force => true do |t|
    t.column "nombre", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "usuarios", :force => true do |t|
    t.column "token", :string
    t.column "nombre", :string
    t.column "email", :string
    t.column "web", :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email"
  add_index "usuarios", ["token"], :name => "index_usuarios_on_token"

end
