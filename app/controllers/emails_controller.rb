class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
      @emails = Email.create(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
      # redirect_to emails_path
      
      # respond_to do |format|
      #   format.turbo_stream do
          render turbo_stream: [
          turbo_stream.prepend('new_email', partial: "message", locals: {emails: @emails})
          ]
  end


  def destroy
    @email.destroy
  end

  def refresh
  end
    
  private
    
  def email_params
      params.permit(:object, :body)
  end

end
