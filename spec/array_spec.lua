local array = require("array")

describe("array", function()
  describe("when the list is missing", function()
    it("is empty", function()
      local actual = array.to_array()
      local expected = {}

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the list is empty", function()
    it("is empty", function()
      local actual = array.to_array({})
      local expected = {}

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the list contains 1 element", function()
    it("is contains 1 element", function()
      local actual = array.to_array({"sample"})
      local expected = {[1]="sample"}

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the list contains 2 elements", function()
    it("is contains 1 element", function()
      local actual = array.to_array({"sample", "example"})
      local expected = {[1]="sample", [2]="example"}

      assert.are.same(expected, actual)
    end)
  end)

  describe("when the list contains a nested elements", function()
    it("is contains a 2D array of elements", function()
      local actual = array.to_array({"sample", {"example"}})
      local expected = {[1]="sample", [2]={[1]="example"}}

      assert.are.same(expected, actual)
    end)
  end)
end)