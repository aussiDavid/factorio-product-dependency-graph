function Map(t, f)
  local t1 = {}
  local t_len = #t
  for i = 1, t_len do
      t1[i] = f(t[i])
  end
  return t1
end

return Map
