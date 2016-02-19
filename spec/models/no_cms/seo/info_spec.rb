require 'rails_helper'

describe NoCms::Seo::Info do
  it_behaves_like "model with has one relationship", :no_cms_seo_info, :page, :target, :seo_info

  context "when dupping the related object" do

    let(:seo_info) { create(:no_cms_seo_info) }
    let!(:page) { seo_info.target }

    subject { page.dup }

    it "should dup the seo information" do
      expect(subject.seo_info.title).to eq page.seo_info.title
      expect(subject.seo_info.description).to eq page.seo_info.description
      expect(subject.seo_info.no_index).to eq page.seo_info.no_index
      expect(subject.seo_info.no_follow).to eq page.seo_info.no_follow
      expect(subject.seo_info.exclude_from_sitemap).to eq page.seo_info.exclude_from_sitemap
      expect(subject.seo_info).not_to eq page.seo_info
    end

    context "with multiple seo infos" do

      let!(:other_seo_info) { create(:no_cms_mobile_seo_info, target: page)}

      subject { page.dup }

      it "should dup the seo information" do
        expect(subject.seo_info.title).to eq page.seo_info.title
        expect(subject.seo_info.description).to eq page.seo_info.description
        expect(subject.seo_info.no_index).to eq page.seo_info.no_index
        expect(subject.seo_info.no_follow).to eq page.seo_info.no_follow
        expect(subject.seo_info.exclude_from_sitemap).to eq page.seo_info.exclude_from_sitemap
        expect(subject.seo_info).not_to eq page.seo_info

        expect(subject.mobile_seo_info.title).to eq page.mobile_seo_info.title
        expect(subject.mobile_seo_info.description).to eq page.mobile_seo_info.description
        expect(subject.mobile_seo_info.no_index).to eq page.mobile_seo_info.no_index
        expect(subject.mobile_seo_info.no_follow).to eq page.mobile_seo_info.no_follow
        expect(subject.mobile_seo_info.exclude_from_sitemap).to eq page.mobile_seo_info.exclude_from_sitemap
        expect(subject.mobile_seo_info).not_to eq page.mobile_seo_info
      end

    end

  end

  context "when create seo of a kind" do

    let(:seo_info) { create(:no_cms_mobile_seo_info) }
    let!(:page) { seo_info.target }

    subject { page.mobile_seo_info }

    it "should have kind seo information" do
      expect(subject.title).to eq seo_info.title
      expect(subject.description).to eq seo_info.description
      expect(subject.no_index).to eq seo_info.no_index
      expect(subject.no_follow).to eq seo_info.no_follow
      expect(subject.exclude_from_sitemap).to eq seo_info.exclude_from_sitemap
      expect(subject).to eq seo_info
    end

  end
end
