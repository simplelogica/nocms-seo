active_record_migration_class =
  if Rails::VERSION::STRING[0..2].to_f >= 5
    ActiveRecord::Migration[Rails::VERSION::STRING[0..2].to_f]
  else
    ActiveRecord::Migration
  end

class AddKindToNoCmsSeoInfo < active_record_migration_class
  def change
    add_column :no_cms_seo_infos, :kind, :string
    add_index :no_cms_seo_infos, [:target_id, :target_type, :kind], name: 'index_no_cms_seo_infos_kind', unique: true
  end
end
