class User < ApplicationRecord

   has_many :shifts
   belongs_to :organization, required: false

   # adds virtual attributes for authentication
   has_secure_password
   # validates email
   validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
   #validates :name, presence: true #new
end
