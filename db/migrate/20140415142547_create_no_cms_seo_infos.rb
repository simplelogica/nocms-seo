class CreateNoCmsSeoInfos < ActiveRecord::Migration[6.0]
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
