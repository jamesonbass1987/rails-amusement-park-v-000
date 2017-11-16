class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    self.is_happy?? "happy" : "sad"
  end

  def is_happy?
    happiness > nausea
  end

  def is_admin?
    self.admin == true
  end

end
