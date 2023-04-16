require 'gpt_analysis'

class OpenAiCodeAnalysisController < ApplicationController
  def test_cases; end

  def generate_test_cases
    code = params[:code]
    language = params[:language]
    prompt = get_test_cases_prompt(code, language)
    @test_cases = analyze_code(prompt)
    render :test_cases
  end

  private

  def get_test_cases_prompt(code, language)
    "Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
  end
end
