class Weapon < ActiveRecord::Base
  belongs_to :zombie

  def slice(zombie, head)
  	#Some complex stuff, this method will be stub
  end

  def graveyard_locator(graveyard)
  	
  end
end
