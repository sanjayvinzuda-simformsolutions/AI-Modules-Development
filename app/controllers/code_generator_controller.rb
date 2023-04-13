class CodeGeneratorController < ApplicationController
  
  def index; end
  
  def generate
    prompt = params[:prompt]
    @code = generate_code(prompt)
    render :index
  end

  private

  def generate_code(prompt)

    openai = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
    response = openai.completions(
      parameters:{
        model: 'text-davinci-002',
        prompt: prompt,
        max_tokens: 128,
        n: 1,
        stop: ['\n']
    })
  
    # Extract the generated code from the response
    generated_code = response.dig("choices", 0, "text")
  end
end
