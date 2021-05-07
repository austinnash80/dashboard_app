class User < ApplicationRecord
  has_secure_password
  before_save { name.downcase! }

end
