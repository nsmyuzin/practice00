class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'create'
    else
      render :action => 'new'
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if params["back"].nil? && @contact.valid?
      @contact.save
      render :action => 'create'
    else
      render :action => 'new'
    end
  end

  def contact_params
    params.require(:contact).permit(:full_name, :email, :title, :message)
  end

end
