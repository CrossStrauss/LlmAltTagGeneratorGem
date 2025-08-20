# frozen_string_literal: true

require_relative "alt_tag_gen/version"
require_relative "alt_tag_gen/config"
require_relative "alt_tag_gen/generate_image_alt_tag"


if defined?(Rails)
  require_relative "generators/alt_tag_gen/install_generator"
end
module AltTagGen
  class Error < StandardError; end
  # Your code goes here...
end
