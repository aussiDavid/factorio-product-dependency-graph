package = "factorio-product-dependency-graph"
version = "0.1.0"
source = {
   url = "https://github.com/aussiDavid/factorio-product-dependency-graph"
}
description = {
   homepage = "https://github.com/aussiDavid/factorio-product-dependency-graph",
   license = "MIT"
}
test = {
  type = "busted",
  flags = { "-o", "gtest", "--coverage", "--no-keep-going" }
}
test_dependencies = {
 "luacov > 0.1"
}
dependencies = {
 "json-lua >= 0.1-3"
}
build = {
   type = "builtin",
   modules = {
      product_graph = "src/product_graph.lua"
   }
}
rockspec_format = "3.0"
