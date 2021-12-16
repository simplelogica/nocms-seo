class AddExcludeFromRobotsToNoCmsSeoInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :no_cms_seo_infos, :exclude_from_robots_txt, :boolean, default: false
    add_column :no_cms_seo_infos, :no_index, :boolean, default: false
    add_column :no_cms_seo_infos, :no_follow, :boolean, default: false
  end
end
