class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    message = @output = "Sorry."

    # accounts for the user not having enough tickets
    ticket_validation_for(user, attraction)

    # accounts for the user not being tall enough
    height_validation_for(user, attraction)

    # if message is unchanged, validations have passed
    if message == @output
      # updates ticket number
      user.tickets -= attraction.tickets
      # updates the user's nausea
      user.nausea += attraction.nausea_rating
      # updates the user's happiness
      user.happiness += attraction.happiness_rating

      #persist to db
      user.save

      @output = "Thanks for riding the #{attraction.name}!"

    else
      #otherwise, return output
      @output
    end
  end

  def ticket_validation_for(user, attraction)
    if attraction.tickets > user.tickets
      @output += " You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def height_validation_for(user, attraction)
    if attraction.min_height > user.height
      @output += " You are not tall enough to ride the #{attraction.name}."
    end
  end

end
