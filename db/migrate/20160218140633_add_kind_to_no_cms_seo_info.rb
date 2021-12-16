class AddKindToNoCmsSeoInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :no_cms_seo_infos, :kind, :string
    add_index :no_cms_seo_infos, [:target_id, :target_type, :kind], name: 'index_no_cms_seo_infos_kind', unique: true
  end
end
