#!/usr/bin/env lua

package.path = package.path .. ';./src/?.lua'
package.path = package.path .. ';./lua_modules/share/lua/5.3/?.lua'

local JSON = require "JSON"
local product_graph = require "product_graph"

local product_name = arg[1]

if not product_name then
  print("Error: Please provide a PRODUCT_NAME argument")
  print([[
Generates the dependencies for a PRODUCT_NAME in JSON format.

Usage:
  lua main.lua PRODUCT_NAME

Example:
  $ lua main.lua "steel-plate"

  {
    "items": [ {
      "items": [ {
        "items": [],
        "name": "iron-ore"
      } ],
      "name": "iron-plate"
    } ],
    "name": "steel-plate"
  }
  ]])
  os.exit(1)
end

print(JSON:encode_pretty(product_graph.find_dependency(product_name)))