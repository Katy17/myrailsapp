class UserMailer < ApplicationMailer
  default from: "costumer@example.com" # this will be replaced by a real email address

  def contact_form(email, name, message)
    @email = email
    @name = name
    @message = message
    mail(from: email,
       to: 'info.ktcodes@gmail.com',
       subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Find A Bike In Berlin"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end


  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@email, @name, @message).deliver_now
  end


  def order_placed(user, product)
    @user = user
    @product = product
    mail(:from => 'info.ktcodes@@gmail.com',
         :to => user.email,
         :subject => "Your order of the #{product.name} has been placed.")
  end
end
