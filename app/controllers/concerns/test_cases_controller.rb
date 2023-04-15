class TestCasesController < ApplicationController

  def index; end

  def generate
    code = params[:code]
    language = params[:language]
    prompt = get_prompt(code, language)
    response = ClientCompletions.new(prompt).client_response
    @test_cases = response.dig("choices", 0, "text").split("\n")
    render :index
  end

  private

  def get_prompt(code, language)
    "Write unit tests in #{language} using it's most used framework. Here is the file:\n #{code}"
  end
end
