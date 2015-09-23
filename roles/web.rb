name "web"
description "Web Server"
run_list "role[base]", "recipe[apache]", "recipe[apache::shellshock]"
default_attributes({
  "apache" => {
    "sites" => {
      "admin" => {
        "port" => 8000
      },
      "bears" => {
        "port" => 8081
      }
    }
  }
})
