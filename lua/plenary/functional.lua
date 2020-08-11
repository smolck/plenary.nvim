package.loaded['plenary.functional'] = nil

local f = {}

function f.map(fun, iter)
  local results = {}
  for _, v in pairs(iter) do
    table.insert(results, fun(v))
  end

  return results
end

function f.partial(fun, ...)
  local args = {...}
  return function(...)
    return fun(unpack(args), ...)
  end
end

function f.any(f, iterable)
  for k, v in pairs(iterable) do
    if f(k, v) then
      return true
    end
  end

  return false
end

function f.all(f, iterable)
  for k, v in pairs(iterable) do
    if not f(k, v) then
      return false
    end
  end

  return true
end

function f.curry(f)
    return function(x)
        return function(y)
            f(x, y)
        end
    end
end

return f
