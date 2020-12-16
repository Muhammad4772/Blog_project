class ContactMailer < ApplicationMailer
	def send_query_email(contact)
		@contact = contact
		mail(to: @contact.email, subject: 'Virtual_ContactUs')
	end
end
