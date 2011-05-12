class User < ActiveRecord::Base
  has_many :products # plural
end
