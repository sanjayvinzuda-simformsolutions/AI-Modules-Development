require "test_helper"

class CodeGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get code_generator_generate_url
    assert_response :success
  end
end
