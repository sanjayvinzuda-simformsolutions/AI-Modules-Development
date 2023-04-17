OpenAI.configure do |config|
  config.access_token = ENV['OPENAI_ACCESS_TOKEN'] || Rails.application.credentials.dig(:openAI, :open_ai_api_key)
  OpenAI::Client.new(access_token: api_key)
end
