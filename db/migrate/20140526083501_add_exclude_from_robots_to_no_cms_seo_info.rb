active_record_migration_class =
  if Rails::VERSION::STRING[0..2].to_f >= 5
    ActiveRecord::Migration[Rails::VERSION::STRING[0..2].to_f]
  else
    ActiveRecord::Migration
  end

class AddExcludeFromRobotsToNoCmsSeoInfo < active_record_migration_class
  def change
    add_column :no_cms_seo_infos, :exclude_from_robots_txt, :boolean, default: false
    add_column :no_cms_seo_infos, :no_index, :boolean, default: false
    add_column :no_cms_seo_infos, :no_follow, :boolean, default: false
  end
end
