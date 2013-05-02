class Goal < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :tasks

  validates :title, :description, :presence => true
end
