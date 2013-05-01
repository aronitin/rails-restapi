class Goal < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :description, :presence => true
end
