object @goals

# Reuse the show template definition
extends "api/v1/goals/show"

attributes :id

# Include a custom node
# node :custom_field  @goals.each do |goal|
#   [goal.id, goal.title].join(" ")
# end
