class RefactorController < ApplicationController
  protect_from_forgery except: :create

  def index; end

  def create
    prompt = "Refactor the following sentence in #{params[:language]} language:  #{params[:query]}"    
    client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
        
    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 1024,
        n: 1,
        stop: nil    
      })

    @response = response.dig("choices", 0, "text").split("\n")
    render :index
  end
end
