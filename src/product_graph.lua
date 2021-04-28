require "factorio-data.core.lualib.dataloader"
require "factorio-data.base.prototypes.recipe"

local RECIPES = data.raw.recipe

local Map = require "map"

local product_graph = {}

local function ingredient_name(ingredient)
  return ingredient.name or ingredient[1]
end

local function ingredients_for(product)
  product = product or {}
  local ingredients = {}

  if product.ingredients then
    ingredients = product.ingredients
  end

  if product.normal and product.normal.ingredients then
    ingredients = product.normal.ingredients
  end

  return Map(ingredients, ingredient_name)
end

function product_graph.find_dependency(product_name, recipes)
  recipes = recipes or RECIPES
  local product = recipes[product_name]

  return {
    name = product_name,
    items = Map(
      ingredients_for(product),
      function(item) return product_graph.find_dependency(item, recipes) end
    )
  }
end

return product_graph