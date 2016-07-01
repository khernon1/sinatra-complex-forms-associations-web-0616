class Pet < ActiveRecord::Base
  belongs_to :owner

  def owner_name=(name)  
  #binding.pry  
     owner = Owner.find_or_create_by(name: name)
#     binding.pry
     self.owner = owner
  end
end

#pet[owner_name]
#owner.name