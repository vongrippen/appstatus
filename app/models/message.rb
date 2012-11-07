class Message < ActiveRecord::Base
  belongs_to :service
  attr_accessible :full_message, :short_message, :status
  
  default_scope order('updated_at DESC')
end
