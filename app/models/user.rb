class User < ActiveRecord::Base
	acts_as_network :friends, :join_table => :friends

end
