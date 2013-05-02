object @goal

# Declare the properties to include
attributes :title, :description, :created_at

# Alias 'created_at' to creation_timestamp
attributes :created_at => :creation_timestamp

# Add a custom node
# node :custom_field do |goal|
#   [goal.id, goal.title].join(" ")
# end
