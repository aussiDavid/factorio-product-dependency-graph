require "factorio-data.core.lualib.dataloader"
require "factorio-data.base.prototypes.recipe"

local RECIPES = data.raw.recipe

local Map = require "map"

local product_graph = {}

function ingredients(product) 
  local product = product or {}
  local ingredients = {}

  if product.ingredients then
    ingredients = product.ingredients
  end
  
  if product.normal and product.normal.ingredients then
    ingredients = product.normal.ingredients
  end

  if product.normal and product.normal.ingredients then
    ingredients = product.normal.ingredients
  end

  return Map(ingredients, ingredient_name)
end

function ingredient_name(value) return value.name or value[1] end

function product_graph.find_dependency(product_name, recipes)
  local recipes = recipes or RECIPES
  local product = recipes[product_name]

  return {
    name=product_name,
    items=Map(
      ingredients(product),
      function(item) return product_graph.find_dependency(item, recipes) end
    )
  }
end

return product_graph