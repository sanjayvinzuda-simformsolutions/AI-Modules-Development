require_relative '../config/environment'
require "openai"

def client
  api_key = ENV['OPENAI_API_KEY'] || Rails.application.credentials.dig(:openAI, :open_ai_api_key) || '${{ secrets.OPENAI_API_KEY }}'
  OpenAI::Client.new(access_token: api_key)
end

def analyze_code(code_snippet)
  begin
    # Pass the code snippet to the GPT-based AI model
    response = client.completions(parameters: {
      model: 'text-davinci-003',
      prompt: "Analyze the following code for potential issues or bugs:\n #{code_snippet}",
      max_tokens: 2000,
      n: 1,
      stop: ['\n\n']
    })
    # Extract the list of potential issues from the response
    result = response.dig("choices", 0, "text")
    result.present? ? result.split("\n").reject(&:blank?).map(&:strip) : []
  rescue StandardError => e
    puts "Error occurred while analyzing code: #{e.message}"
  end
end
