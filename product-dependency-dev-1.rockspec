package = "product-dependency"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "MIT"
}
test = {
  type = "busted",
  flags = { "-o", "gtest", "--coverage", "--no-keep-going" }
}
test_dependencies = {
 "luacov > 0.1"
}
build = {
   type = "builtin",
   modules = {
      ["product_graph"] = "src/product_graph.lua"
   }
}
rockspec_format = "3.0"
