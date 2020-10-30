# frozen_string_literal: true

module Spree
  module Admin
    module PagesHelper
      def view_in_store_link(page, store)
        link_to(store.name, "#{store.url}/pages/#{page.slug}", class: 'dropdown-item')
      end
    end
  end
end
