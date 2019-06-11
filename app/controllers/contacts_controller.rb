class ContactsController < ApplicationController
  layout 'vanilla'
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if params["back"].nil? && @contact.valid?
      @contact.save
      CustomerNotificationMailer.send_thanks_contact(@contact, @basic_info)
      render :action => 'create'
    else
      render :action => 'new'
    end
  end

  def contact_params
    params.require(:contact).permit(:full_name, :email, :title, :message)
  end

end
