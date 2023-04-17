require 'gpt_analysis'

class OpenAiCodeAnalysisController < ApplicationController
  def test_cases; end

  def code_docs; end

  def generate_test_cases
    code = params[:code]
    language = params[:language]
    prompt = get_prompt('test_cases_generator', code, language)
    @response = analyze_code(prompt)
    render :test_cases
  end

  def generate_code_docs
    @code = params[:code]
    prompt = get_prompt('doc_generator', @code, nil)
    @response = analyze_code(prompt)
    render :code_docs
  end

  def code_generator; end

  def generate_code
    code = params[:code]
    language = params[:language]
    prompt = get_prompt('code_generator', code, language)
    @response = analyze_code(prompt)
    render :code_generator
  end

  def code_refactor; end

  def generate_refactor_code
    prompt = get_prompt('code_refector', params[:code], params[:language])
    @response = analyze_code(prompt)
    render :code_refactor
  end

  private
  
  def get_prompt(type, code, language)
    case type
    when 'test_cases_generator'
      "Check if text is valid and Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
    when 'code_generator'
      "write function in #{language} code for #{code}"
    when 'code_refector'
      "Refactor the following code in #{language} language: #{code}"
    when 'doc_generator'
      "Is input valid don't answer it and Generate the code documentation with markdown:\n #{code}"
    end
  end
end