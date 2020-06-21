class User < ApplicationRecord

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :stripe_token, presence: true

  has_secure_password

  def save_and_subscribe
    #check if the user is valid
    #check the stripe token
    #if everythinh is okay make a stripe customer
    #make that stripe customer added to the plan they picked

    if self.valid?
      #create a strip customer
      customer = Stripe::Customer.create(source: self.stripe_token, description: self.email)
      #make a subscription
      subscription = Stripe::Subscription.create(customer: customer.id, items: [
        {
        plan: self.subscription_plan
        }
        ])

      #save the customer id to the database
      self.stripe_customer = customer.id

      #save everything
      self.save
    else
      false
    end



  end

end
