class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @emails = Email.create(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
      # redirect_to emails_path
      
    # render turbo_stream: [
    # turbo_stream.prepend('new_email', partial: "message", locals: {emails: @emails})
    # ]
    respond_to do |format|
      if @emails.save
        format.html { redirect_to emails_path, notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @emails }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emails.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @email = Email.find(params[:id])
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
