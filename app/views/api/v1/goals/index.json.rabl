object false

extends "api/paging", :locals => { :list => @goals }

# node(:offset) {@goals.offset}
# node(:count) {@goals.per_page}
# node(:next) {next_page_url @goals}
# node(:previous) {previous_page_url @goals}
# partial("api/paging", :object => @goals)

child(@goals) do
  extends "api/v1/goals/show"
end
