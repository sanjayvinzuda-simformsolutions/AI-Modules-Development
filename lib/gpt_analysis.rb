require 'openai'

# Set up OpenAI API key
OpenAI.api_key = Rails.application.credentials.dig(:openAI, :open_ai_api_key)

def analyze_code(code_snippet)
  # Pass the code snippet to the GPT-based AI model
  response = OpenAI::Completion.create(
    engine: 'text-davinci-002',
    prompt: "Analyze the following code for potential issues:\n#{code_snippet}",
    max_tokens: 800
  )
  # Extract the list of potential issues from the response
  issues = response.choices[0].text.split("\n")
  # Return the list of potential issues
  return issues
end
