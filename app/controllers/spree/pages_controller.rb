# frozen_string_literal: true

class Spree::PagesController < Spree::StoreController
  def show

    @page = Spree::Page.friendly.find(params[:id])

    @title = @page.page_seo_title

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end
