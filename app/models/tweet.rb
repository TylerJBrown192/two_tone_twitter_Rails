class Tweet < ActiveRecord::Base
  validates :body, :presence => true
  validates :user_id, :presence => true
end
