module SpreePages
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false

      # Required to perform add_files and copy the svg icon
      def self.source_paths
        paths = superclass.source_paths

        paths << File.expand_path("../templates", __FILE__)
        paths.flatten
      end

      def add_files
        if Spree::Core::Engine.backend_available? || Rails.env.test?
          template "assets/images/backend-pages.svg", "app/assets/images/backend-pages.svg"
        end
      end

      def add_migrations
        run "bundle exec rake railties:install:migrations FROM=spree_pages"
      end

      def add_javascripts
        append_file "vendor/assets/javascripts/spree/frontend/all.js", "//= require spree/frontend/spree_pages\n"
        append_file "vendor/assets/javascripts/spree/backend/all.js", "//= require spree/backend/spree_pages\n"
      end

      def add_stylesheets
        inject_into_file "vendor/assets/stylesheets/spree/frontend/all.css", " *= require spree/frontend/spree_pages\n", before: /\*\//, verbose: true
        inject_into_file "vendor/assets/stylesheets/spree/backend/all.css", " *= require spree/backend/spree_pages\n", before: /\*\//, verbose: true
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ["", "y", "Y"].include?(ask("Would you like to run the migrations now? [Y/n]"))
        if run_migrations
          run "bundle exec rails db:migrate"
        else
          puts "Skipping rails db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
