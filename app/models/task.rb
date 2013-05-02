class Task < ActiveRecord::Base
  attr_accessible :status, :title

  belongs_to :goal
end
