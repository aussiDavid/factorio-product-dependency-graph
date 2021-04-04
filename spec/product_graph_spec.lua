local product_graph = require("product_graph")

describe("product_graph", function()
  describe("when the product is not listed", function()
    local recipes = { 
      {
        name = "iron-plate",
        ingredients = {{"iron-ore", 1}}
      }
    }

    it("requires no ingredients", function()
      local actual = product_graph.find_dependency("iron-ore", recipes)
      local expected = {
        name="iron-ore",
        items={}
      }
      
      assert.are.same(expected, actual)
    end)
  end)

  describe("when the recipe contains 1 ingredent", function()
    local recipes = { 
      {
        name = "iron-plate",
        ingredients = {{"iron-ore", 1}}
      }
    }

    it("requires 1 ingredient", function()
      local actual = product_graph.find_dependency("iron-plate", recipes)
      local expected = {
        name="iron-plate",
        items={
          {
            name="iron-ore",
            items={}
          }
        }
      }

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the recipe contains a normal mode", function()
    local recipes = { 
      {
        name = "steel-plate",
        normal =
        {
          ingredients = {{"iron-plate", 5}},
        }
      }
    }

    it("requires the normal ingredent", function()
      local actual = product_graph.find_dependency("steel-plate", recipes)
      local expected = {
        name="steel-plate",
        items={
          {
            name="iron-plate",
            items={}
          }
        }
      }

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the recipe contains 2 ingredents", function()
    local recipes = { 
      {
        name = "decider-combinator",
        ingredients =
        {
          {"copper-cable", 5},
          {"electronic-circuit", 5}
        },
      }
    }

    it("requires 2 ingredents", function()
      local actual = product_graph.find_dependency("decider-combinator", recipes)
      local expected = {
        name="decider-combinator",
        items={
          {
            name="copper-cable",
            items={}
          },
          {
            name="electronic-circuit",
            items={}
          }
        }
      }

      assert.are.same(expected, actual)
    end)
  end)
end)