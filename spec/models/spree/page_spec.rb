# frozen_string_literal: true

require "spec_helper"

describe Spree::Page, type: :model do
  let!(:page) { create(:page) }

  describe ".title" do
    it "returns the title" do
      expect(page.title).to eq "My Page Title"
    end
  end

  describe ".slug" do
    it "returns the title as a formatted slug if no slug is set" do
      expect(page.slug).to eq "my-page-title"
    end

    it "returns a formatted slug when a slug is set" do
      page = create(:page, slug: "like a sluug")

      expect(page.slug).to eq "like-a-sluug"
    end
  end

  describe ".seo_title" do
    it "returns the title if no meta_title is set" do
      expect(page.seo_title).to eq "My Page Title"
    end

    it "returns the meta_title if set" do
      page = create(:page, meta_title: "Hello From The Meta Title")

      expect(page.seo_title).to eq "Hello From The Meta Title"
    end
  end
end
