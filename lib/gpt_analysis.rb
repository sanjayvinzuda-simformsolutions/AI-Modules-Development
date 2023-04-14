require_relative '../config/environment'
require "openai"

def client
  # Set up OpenAI API key
  api_key = ENV['OPENAI_API_KEY'] || Rails.application.credentials.dig(:openAI, :open_ai_api_key)
  OpenAI::Client.new(access_token: api_key)
end

def client_response(prompt)
  client.completions(parameters: {
    model: 'text-davinci-003',
    prompt: prompt,
    max_tokens: 2000,
    n: 1,
    stop: ['\n\n']
  })
rescue StandardError => e
  puts "Error occurred while analyzing code: #{e.message}"
end

def analyze_code(code_snippet)
  # Pass the code snippet to the GPT-based AI model
  prompt = "Analyse issues in code: \n #{code_snippet}, if no issue present add N/I in response"
  response = client_response(prompt)
  # Extract the list of potential issues from the response
  result = response.dig("choices", 0, "text").split("\n")
  result.present? ? result.reject(&:blank?).map(&:strip).reject{|i| i == "N/I"} : []
end
