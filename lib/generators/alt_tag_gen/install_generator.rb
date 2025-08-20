require "rails/generators"

module AltTagGen
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Creates an AltTagGen initializer."

      def copy_initializer
        template "alt_tag_gen_initializer.rb", "config/initializers/alt_tag_gen.rb"
      end
    end
  end
end
