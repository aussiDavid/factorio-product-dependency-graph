
# Factorio Product Dependency Gragh

## Description

An application to generate a Factorio blueprint for a product. Given a product (e.g. steel-plate), this dependancy graph application lists all required products down to the raw ingredients. The program displays the output in JSON format.

## Usage

Execute the program in a docker container.

```bash
$ docker run --rm aussidavid/factorio-product-dependency-graph steel-plate

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
```

You can require the module to use it in your own LUA programs.

```lua
package.path = package.path .. ";path/to/repository/src/?.lua"

local product_graph = require "product_graph"

product_graph.find_dependency("steel-plate")
```

Replace `path/to/repository` above to the path to the repostory containing this code. See `main.lua` for an example. Replace the strin g, `steel-plate`, with the item generate the dependency graph.

## Testing

Build the lua project.

```bash
$ luarocks build

product-dependency 0.1.0 is now installed in /home/$HOME/product-dependency/./lua_modules (license: MIT)
```

Use `luarocks` to run the test suite.

```bash

$ luarocks test

product-dependency 0.1.0 depends on luacov > 0.1 (0.15.0-1 installed)
[==========] Running tests from scanned files.
[----------] Global test environment setup.
[----------] Running tests from spec/product_graph_spec.lua
[ RUN      ] spec/product_graph_spec.lua @ 11: product_graph when 
.
.
.
[----------] 6 tests from spec/product_graph_spec.lua (74.59 ms total)

[----------] Global test environment teardown.
[==========] 6 tests from 1 test file ran. (77.43 ms total)
[  PASSED  ] 6 tests.

```

## Contributing

:aussidavid: [David Milanese](https://github.com/aussidavid)

## Questions

Contact me with any questions: [email](mailto:milanese.david@gmail.com), [GitHub](https://github.com/aussidavid)
