require 'gpt_analysis'

class OpenAiCodeAnalysisController < ApplicationController
  def test_cases; end

  def code_docs; end

  def generate_test_cases
    code = params[:code]
    language = params[:language]
    prompt = get_test_cases_prompt(code, language)
    @test_cases = analyze_code(prompt)
    render :test_cases
  end

  def generate_code_docs
    @code = params[:code]
    prompt = get_code_doc_prompt(@code)
    @result = analyze_code(prompt)
    render :code_docs
  end

  private

  def get_test_cases_prompt(code, language)
    "Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
  end

  def get_code_doc_prompt(code)
    "Generate the code documentation with markdown:\n #{code}"
  end
end
