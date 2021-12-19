class Organization < ApplicationRecord

   has_many :users

   # validates Organization
   validates :company, presence: true, uniqueness: true
   validates :rate, presence: true
end
