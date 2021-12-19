class Shift < ApplicationRecord

     # validates Organization
     #id, userid, start(datetime), finish(datetime), breaklength
     belongs_to :user, optional: true

     validates :start, presence: true
     validates :finish, presence: true
     validates :breaklength, presence: true
  end
