local array = {}

function array.to_array(table)
  if table == nil then return {} end
  local data = {}
  for k, v in ipairs(table) do data[k] = v end
  return data
end

return array