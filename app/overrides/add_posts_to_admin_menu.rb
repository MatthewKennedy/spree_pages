# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "spree/admin/shared/_main_menu",
  name: "add_pages_link_to_admin_sidebar_menu",
  insert_before: "ul#sidebarConfiguration",
  partial: "spree/admin/shared/pages_sidebar_menu",
  disabled: defined?(SpreeBlogs)
)
