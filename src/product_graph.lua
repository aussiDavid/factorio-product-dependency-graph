require "factorio-data.core.lualib.dataloader"
require "factorio-data.base.prototypes.recipe"
local Array = require "array"

function Set(list)
  if list == nil then return nil end

  local set = {}
  for _, l in ipairs(list) do set[l.name] = l end
  return set
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

  local ingredient = extract_ingredent(product, formatted_products)

  return {
    name=product,
    items={product_graph.find_dependency(ingredient, products)}
  }
end

function extract_ingredent(product, formatted_products)
  local item = formatted_products[product]
  
  if item.ingredients then
    return Array.to_array(item.ingredients)[1][1]
  end

  if item.normal then
    if item.normal.ingredients then
      return Array.to_array(item.normal.ingredients)[1][1]
    end  
  end
end

return product_graph