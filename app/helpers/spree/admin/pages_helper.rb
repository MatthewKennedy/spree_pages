# frozen_string_literal: true

module Spree
  module Admin
    module PagesHelper
      def view_in_store_link(page, store)
        link_to(store.unique_name, store.url + page_path(page), class: "dropdown-item py-2 px-3")
      end
    end
  end
end
