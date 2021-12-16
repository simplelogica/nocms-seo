class RenameExcludeFromRobotsInNoCmsSeoInfos < ActiveRecord::Migration[6.0]
  def up
    add_column :no_cms_seo_infos, :exclude_from_sitemap, :boolean, default: false
    NoCms::Seo::Info.update_all 'exclude_from_sitemap=exclude_from_robots_txt'
    remove_column :no_cms_seo_infos, :exclude_from_robots_txt, :boolean, default: false
  end

  def down
    add_column :no_cms_seo_infos, :exclude_from_robots_txt, :boolean, default: false
    NoCms::Seo::Info.update_all 'exclude_from_robots_txt=exclude_from_sitemap'
    remove_column :no_cms_seo_infos, :exclude_from_sitemap, :boolean, default: false
  end
end
