class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    email = Email.new(email_params)
    response = EmailGenerator.new(email).email_message
    redirect_to action: "show_response", response: response
  end

  def show_response
    @response = params[:response]
  end

  private

  def email_params
    params.require(:email).permit(:received, :description, :tonality)
  end
end
