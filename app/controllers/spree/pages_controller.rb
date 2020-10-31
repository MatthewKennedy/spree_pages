# frozen_string_literal: true

class Spree::PagesController < Spree::StoreController
  def show
    if try_spree_current_user.try(:has_spree_role?, "admin")
      @page = Spree::Page.by_store(current_store).friendly.find(params[:id])
    else
      @page = Spree::Page.visible.by_store(current_store).friendly.find(params[:id])
    end

    @title = @page.page_seo_title

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end
