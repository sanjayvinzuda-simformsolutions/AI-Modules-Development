require_relative '../config/environment'
require "openai"

def client
  api_key = Rails.application.credentials.dig(:openAI, :open_ai_api_key) || ENV["OPENAI_API_KEY"]
  OpenAI::Client.new(access_token: api_key)
end

def analyze_code(code_snippet)
  # Set up OpenAI API key
  
  # Pass the code snippet to the GPT-based AI model
  response = client.completions(parameters: {
    model: 'text-davinci-003',
    prompt: "Analyze the following code for potential issues:\n#{code_snippet}",
    max_tokens: 2000
  })
  # Extract the list of potential issues from the response
  response.dig("choices", 0, "text").split("\n")
end
