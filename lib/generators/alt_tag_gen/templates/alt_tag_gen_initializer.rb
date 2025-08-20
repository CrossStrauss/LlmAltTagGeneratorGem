AltTagGen.configure do |config|
  config.api_key = ENV["OPENAI_API_KEY"]
  config.model = "gpt-4o-mini"
  config.openai_api_url = "https://api.openai.com/v1/chat/completions"
  config.max_tokens = 50
  config.system_prompt = "You are an AI trained to generate descriptive alt text for images."
  config.user_prompt = "Write a short, descriptive alt text for this image:"
end
