class Employ < ApplicationRecord
    has_secure_password
    has_many :expenses, dependent: :destroy 
   
    before_save :downcase_email
    before_validation :downcase_email
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
    # validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true , on: :create
    validates :password,length: {minimum: 8}, on: :create
     


     def downcase_email
     self.email = email.downcase
     end

   
    


end
