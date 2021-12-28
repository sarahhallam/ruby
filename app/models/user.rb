class User < ApplicationRecord

   has_many :shifts
   belongs_to :organization, required: false

   # adds virtual attributes for authentication
   has_secure_password

   validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
   validates :name, presence: true 
   validates :password, presence: true, length: { minimum: 6}
end
