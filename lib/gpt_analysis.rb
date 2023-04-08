require "openai"

def analyze_code(code_snippet)
  # Set up OpenAI API key
  client = OpenAI::Client.new(api_key: Rails.application.credentials.dig(:openAI, :open_ai_api_key))
  
  # Pass the code snippet to the GPT-based AI model
  response = client.completions(parameters: {
    model: 'text-davinci-003',
    prompt: "Analyze the following code for potential issues:\n#{code_snippet}",
    max_tokens: 2000
  })
  # Extract the list of potential issues from the response
  issues = response.choices[0].text.split("\n")
  # Return the list of potential issues
  return issues
end
