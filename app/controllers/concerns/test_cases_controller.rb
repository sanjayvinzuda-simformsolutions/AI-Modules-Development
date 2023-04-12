class TestCasesController < ApplicationController

  def show; end

  def generate
    @code = params[:code]
    @language = params[:language]
    @test_cases = generate_test_cases(@code, @language)
    render :show
  end

  private

  def generate_test_cases(code, language)
    prompt = get_prompt(code, language)

    client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
    response = client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: prompt,
        max_tokens: 1024,
        best_of: 1,
        top_p: 1,
        # n: 1,
        # stop: "\n"
      }
    )
    response.dig("choices", 0, "text").split("\n")
  end

  def get_prompt(code, language)
    "Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
  end
end
