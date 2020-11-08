# frozen_string_literal: true

module Spree
  module Admin
    module PagesHelper
      def view_page_in_store_link(page, store)

        unless store.url[/\Ahttp:\/\//] || store.url[/\Ahttps:\/\//]
          store_url = "http://#{store.url}"
        end

        link_to(store.unique_name, store_url + page_path(page), class: "dropdown-item py-2 px-3", target: '_blank')
      end
    end
  end
end
