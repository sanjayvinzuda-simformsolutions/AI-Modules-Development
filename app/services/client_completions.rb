require "openai"

class ClientCompletions

  def initialize(prompt)
    @prompt = prompt
  end

  def client
    api_key = ENV['OPENAI_API_KEY'] || Rails.application.credentials.dig(:openAI, :open_ai_api_key)
    OpenAI::Client.new(access_token: api_key)
  end

  def client_response
    client.completions(parameters: {
      model: 'text-davinci-003',
      prompt: @prompt,
      max_tokens: 2000,
      n: 1,
      stop: ['\n\n']
    })
  rescue StandardError => e
    puts "Error occurred: #{e.message}"
  end

end
