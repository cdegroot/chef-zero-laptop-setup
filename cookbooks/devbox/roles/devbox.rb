name "devbox"
description "standard linux development box"

run_list(
  "recipe[apt]",
  "recipe[devbox]")
