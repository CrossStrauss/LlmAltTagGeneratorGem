# AltTagGen

AltTagGen is a Ruby gem that generates descriptive alt text for images using OpenAI’s GPT models. Simply provide an image URL, and the gem returns a short, human-readable alt text suitable for accessibility.

## Features

- Generates concise alt text for images.
- Configurable prompts, model, and token limits.
- Easy to integrate into Rails or Ruby applications.
- Fully configurable via initializer or programmatically.

## Installation

Add this line to your application's Gemfile:

gem "alt_tag_gen", path: "/path/to/your/alt_tag_gen"

Then run:

bundle install

## Configuration (Rails)

Generate the initializer file:

rails generate alt_tag_gen:install

This will create config/initializers/alt_tag_gen.rb. Then, edit it to configure your settings:

AltTagGen.configure do |config|
  # OpenAI API key (recommended to keep in environment variables)
  config.api_key = ENV["OPENAI_API_KEY"]

  # GPT model to use (e.g., gpt-4o-mini, gpt-4, etc.)
  config.model = "gpt-4o-mini"

  # OpenAI API endpoint
  config.openai_api_url = "https://api.openai.com/v1/chat/completions"

  # Maximum tokens to generate in the response
  config.max_tokens = 50

  # Optional system prompt for AI context
  config.system_prompt = "You are an AI trained to generate descriptive alt text for images."

  # Optional user prompt to instruct the AI
  config.user_prompt = "Write a short, descriptive alt text for this image:"
end

Make sure your OpenAI API key is set in the environment:

export OPENAI_API_KEY="your_api_key_here"

## Usage

# Load the gem
require "alt_tag_gen"

# Create a new generator instance with an image URL
generator = AltTagGen::GenrateImageAltTag.new("https://example.com/image.jpg")

# Generate alt text
alt_text = generator.generate

puts alt_text
# => "A scenic view of mountains at sunrise."

## Notes

- The gem sends a request to the OpenAI API. Ensure the URL you provide is publicly accessible.
- You can customize system_prompt, user_prompt, model, and max_tokens via the initializer or programmatically when creating the generator.

## Development

If you want to make changes locally:

# Clone the gem
git clone https://github.com/yourusername/alt_tag_gen.git

# Navigate into the gem
cd alt_tag_gen

# Run tests
bundle exec rake test

## License

This gem is available under the MIT License. See LICENSE for details.
