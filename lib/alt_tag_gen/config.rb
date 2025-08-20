# frozen_string_literal: true

module AltTagGen
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config) if block_given?
  end

  class Configuration
    attr_accessor :api_key, :model, :openai_api_url, :max_tokens, :system_prompt, :user_prompt
  end
end
