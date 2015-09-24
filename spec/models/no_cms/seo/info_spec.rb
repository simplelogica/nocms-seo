require 'rails_helper'

describe NoCms::Seo::Info do
  it_behaves_like "model with has one relationship", :no_cms_seo_info, :page, :target, :seo_info

  context "when dupping the related object" do

    let!(:page) { create :page, seo_info: create(:no_cms_seo_info)}

    subject { page.dup }

    it "should dup the seo information" do
      expect(subject.seo_info.title).to eq page.seo_info.title
      expect(subject.seo_info.description).to eq page.seo_info.description
      expect(subject.seo_info.no_index).to eq page.seo_info.no_index
      expect(subject.seo_info.no_follow).to eq page.seo_info.no_follow
      expect(subject.seo_info.exclude_from_sitemap).to eq page.seo_info.exclude_from_sitemap
      expect(subject.seo_info).not_to eq page.seo_info
    end

  end
end
