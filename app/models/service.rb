class Service < ActiveRecord::Base
  has_many :messages
  attr_accessible :name, :status, :url
  
  default_scope order('name ASC')
end
