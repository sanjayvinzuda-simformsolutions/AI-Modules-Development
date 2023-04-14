class CodeDocGeneratorsController < ApplicationController
  def index; end

  def generate
    @code = params[:code]
    @result = generate_doc(@code)
    render :index
  end

  private

  def generate_doc(code)
    prompt = get_prompt(code)

    client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
    response = client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: prompt,
        max_tokens: 2000
      }
    )
    response.dig("choices", 0, "text").split("\n")
  end

  def get_prompt(code)
    "Provide the documentation with markdown of this following code:\n #{code}"
  end
end
