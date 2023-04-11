require_relative '../config/environment'
require "openai"

def analyze_code(code_snippet)
  # Set up OpenAI API key
  client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
  
  # Pass the code snippet to the GPT-based AI model
  response = client.completions(parameters: {
    model: 'text-davinci-003',
    prompt: "Analyze the following code for potential issues:\n#{code_snippet}",
    max_tokens: 2000
  })
  # Extract the list of potential issues from the response
  response.dig("choices", 0, "text").split("\n")
end
