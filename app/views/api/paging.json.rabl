object @list

node(:offset) {locals[:list].offset}
node(:count) {locals[:list].per_page}
node(:next) {next_page_url locals[:list]}
node(:previous) {previous_page_url locals[:list]}
