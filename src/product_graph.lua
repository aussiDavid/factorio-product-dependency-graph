require "factorio-data.core.lualib.dataloader"
require "factorio-data.base.prototypes.recipe"
local inspect = require "inspect"
local Array = require "array"

function Set(list)
  if list == nil then return nil end

  local set = {}
  for _, l in ipairs(list) do set[l.name] = l end
  return set
end

function map(t, f)
  local t1 = {}
  local t_len = #t
  for i = 1, t_len do
      t1[i] = f(t[i])
  end
  return t1
end

local PRODUCTS = Set(data.raw.recipes)

local product_graph = {}

function product_graph.find_dependency(product, products)
  local formatted_products = Set(products) or PRODUCTS
  if formatted_products[product] == nil then
    return {
      name=product,
      items={}
    }
  end

  return {
    name=product,
    items=map(
      ingredients(product, formatted_products),
      function(ingredient) 
        return product_graph.find_dependency(ingredient, products)
      end
    )
  }
end

function ingredients(product, formatted_products)
  local item = formatted_products[product]
  
  if item.ingredients then
    return map(Array.to_array(item.ingredients), function(v) return v[1] end)
  end
  
  if item.normal then
    if item.normal.ingredients then
      return map(Array.to_array(item.normal.ingredients), function(v) return v[1] end)
    end  
  end
end

return product_graph