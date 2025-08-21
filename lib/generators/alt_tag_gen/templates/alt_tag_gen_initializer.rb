# Configure the AltTagGen gem with necessary API credentials and settings
AltTagGen.configure do |config|
  # Set the OpenAI API key (recommended to keep it in environment variables for security)
  config.api_key = ENV["OPENAI_API_KEY"]

  # Specify the LLM model to use for generating alt text
  # Example: "gpt-4o-mini" or any other OpenAI chat model you have access to
  config.model = "gpt-4o-mini"

  # Set the OpenAI API endpoint URL for chat completions
  # This is where the HTTP requests will be sent
  config.openai_api_url = "https://api.openai.com/v1/chat/completions"

  # Limit the number of tokens in the response from the model
  # Helps control cost and response length
  config.max_tokens = 50

  # Optional system prompt to provide context to the AI
  # Tells the AI its role and what it is expected to do
  config.system_prompt = "You are an AI trained to generate descriptive alt text for images."

  # Optional user prompt to instruct the AI on the specific task
  # In this case, instructing it to write a short alt text for the image
  config.user_prompt = "Write a short, descriptive alt text for this image:"
end
