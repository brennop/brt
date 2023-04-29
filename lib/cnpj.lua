local weights = {
  { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 },
  { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 },
}

local function generateDigit(data, index)
  local sum = 0
  for i = 1, #weights[index] do
    local num = tonumber(string.sub(data, i, i))
    sum = sum + weights[index][i] * num
  end

  local rest = sum % 11
  if rest < 2 then
    return '0'
  end

  return tostring(11 - rest)
end

return function(options)
  local format = options.format or true
  local suffix = options.suffix or "0001"

  if format == "false" then
    format = false
  end

  local cnpj = ''
  for i = 1, 8 do
    local num = math.random(0, 9)
    cnpj = cnpj .. tostring(num)
  end

  cnpj = cnpj .. suffix

  -- primeiro digito de verificação
  cnpj = cnpj .. generateDigit(string.sub(cnpj, 1, 12), 1)
  -- segundo digito de verificação
  cnpj = cnpj .. generateDigit(string.sub(cnpj, 1, 13), 2)

  if format then
    return string.format('%s.%s.%s/%s-%s', string.sub(cnpj, 1, 2), string.sub(cnpj, 3, 5), string.sub(cnpj, 6, 8), string.sub(cnpj, 9, 12), string.sub(cnpj, 13))
  end

  return cnpj
end
