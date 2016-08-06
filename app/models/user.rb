class User < ActiveRecord::Base
	has_secure_password	
	validates :password, length: { in: 6..20 }
	validates :first_name, length: { in: 2..30 }
	validates :last_name, length: { in: 2..30 }

#	has_many :comments
end
