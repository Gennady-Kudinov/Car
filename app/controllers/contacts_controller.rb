class ContactsController < ApplicationController
  def new
  end

  def create # Атрибуты емайл и контакт запарещенные, необходимо их разрешить
    @contact = Contact.new(contact_params)
    if @contact.valid?
       @contact.save
    else
      render action: 'new'
    end
  end

  # все что ниже Приватного метода не имеет доступа из вне.
  # Далее идет разрешение доступа к запретным атрибутам емайл и контакт
  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
