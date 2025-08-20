require "uri"

module AltTagGen
  class GenrateImageAltTag
    
    def initialize(image_url)
      @image_url = image_url
      @api_key = AltTagGen.config.api_key
      @model = AltTagGen.config.model
      @openai_api_url = AltTagGen.config.openai_api_url
      @max_tokens = AltTagGen.config.max_tokens
      @system_prompt = AltTagGen.config.system_prompt || "You are an AI trained to generate descriptive alt text for images."
      @user_prompt = AltTagGen.config.user_prompt || "Write a short, descriptive alt text for this image:"
    end

    def llm_prompt
      [
        {
          role: "system",
          content: @system_prompt
        },
        {
          role: "user",
          content: [
            { type: "text", text: @user_prompt },
            { type: "image_url", image_url: { url: @image_url } }
          ]
        }
      ]
    end


    def generate
      uri = URI.parse(@api_key)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      http.ca_file = '/etc/ssl/certs/ca-certificates.crt'
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  
      request_body = {
        model: @model,
        messages: llm_prompt,
        max_tokens: @max_tokens
      }
  
      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "application/json"
      request["Authorization"] = "Bearer #{@api_key}"
      request.body = request_body.to_json
  
      response = http.request(request)
  
      if response.is_a?(Net::HTTPSuccess)
        json = JSON.parse(response.body)
        json["choices"].first["message"]["content"].strip
      else
        raise "OpenAI API request failed: #{response.code} - #{response.body}"
      end
    end

  end
end 