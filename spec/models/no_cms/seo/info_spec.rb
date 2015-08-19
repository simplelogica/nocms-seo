require 'rails_helper'

describe NoCms::Seo::Info do
  it_behaves_like "model with has one relationship", :no_cms_seo_info, :page, :target, :seo_info
end
