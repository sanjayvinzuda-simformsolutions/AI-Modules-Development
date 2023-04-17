class EmailGenerator
  attr_reader :body

  def initialize(email)
    @email = email
    @body =  {
      model: "text-davinci-001",
      prompt: generate_prompt,
      max_tokens: 150
    }
  end

  def email_message
    call.dig("choices", 0, "text")
  end

  def client
    OpenAI::Client.new
  end

  def call #calls api endpoint to get the response
    client.completions(parameters: @body)
  end

  def generate_prompt
    # combine all the necessary fields to form a complete prompt
    prompt = "Write an email I can copy and paste to my email service."
    prompt += "It should include, that #{@email.description}. " if @email.description.present?
    prompt += "It should be in response to this email: '#{@email.received}'. " if @email.received.present?
    prompt += "The tonality should be #{@email.tonality}. "
    prompt += "Make the email sound well written and expand to make it sound better. It should follow the correct email etiquette including placeholders for names in Greeting and Signature."
    prompt
  end
end
