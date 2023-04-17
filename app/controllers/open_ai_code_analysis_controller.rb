require 'gpt_analysis'

class OpenAiCodeAnalysisController < ApplicationController
  def test_cases; end

  def code_docs; end

  def generate_test_cases
    code = params[:code]
    language = params[:language]
    prompt = get_test_cases_prompt(code, language)
    @response = analyze_code(prompt)
    render :test_cases
  end

  def generate_code_docs
    @code = params[:code]
    prompt = get_code_doc_prompt(@code)
    @response = analyze_code(prompt)
    render :code_docs
  end

  def code_generator; end

  def generate_code
    code = params[:code]
    language = params[:language]
    prompt = get_code_generator_prompt(code, language)
    @response = analyze_code(prompt)
    render :code_generator
  end

  def code_refactor; end

  def generate_refactor_code
    prompt = get_refactor_code_prompt(params[:code], params[:language])
    @response = analyze_code(prompt)
    render :code_refactor
  end

  private

  def get_test_cases_prompt(code, language)
    "Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
  end

  def get_code_doc_prompt(code)
    "Generate the code documentation with markdown:\n #{code}"
  end
  
  def get_code_generator_prompt(code, language)
    "write function in #{language} code for #{code}"
  end

  def get_refactor_code_prompt(code, language = 'Ruby on Rails')
    "Refactor the following code in #{language} language:  #{code}"   
  end
end
