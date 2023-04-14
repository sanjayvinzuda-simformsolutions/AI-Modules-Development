class CodeGeneratorController < ApplicationController
  
  def index; end
  
  def generate
    @code = params[:code]
    @language = params[:language]
    @generated_code = generate_code(@code,@language)
    render :index
  end

  private

  def generate_code(code, language)
    prompt = get_prompt(code, language)
    openai = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
    response = openai.completions(
      parameters:{
        model: 'text-davinci-002',
        prompt: prompt,
        max_tokens: 128,
        best_of: 1,
        top_p: 1,
    })
  
    # Extract the generated code from the response
    response.dig("choices", 0, "text").split("\n")
  end

  def get_prompt(code,language)
    "write function in #{language} code for #{code}"
  end
end
