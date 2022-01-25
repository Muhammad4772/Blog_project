class ContactsController < ApplicationController
   def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new(contact_params)
		respond_to do |format|
			if @contact.save
	      # Sends email to user when user is created.
	      ContactMailer.send_query_email(@contact).deliver_now
	      format.html { redirect_to new_contact_path, notice: 'Email send' }
	      format.json { render :show, status: :created, location: @contact }
	    else
	    	format.html { render :new }
	    	format.json { render json: @contact.errors, status: :unprocessable_entity }
	    end
	  end
	end
	private
	def contact_params
		params.require(:contact).permit(:name, :phone, :email, :message)
	end	
end

