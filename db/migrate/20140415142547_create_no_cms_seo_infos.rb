active_record_migration_class =
  if Rails::VERSION::STRING[0..2].to_f >= 5
    ActiveRecord::Migration[Rails::VERSION::STRING[0..2].to_f]
  else
    ActiveRecord::Migration
  end

class CreateNoCmsSeoInfos < active_record_migration_class
  def change
    create_table :no_cms_seo_infos do |t|
      t.belongs_to :target, polymorphic: true, index: true

      t.timestamps
    end


    create_table :no_cms_seo_info_translations do |t|
      t.belongs_to :no_cms_seo_info, index: true
      t.string :locale

      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
