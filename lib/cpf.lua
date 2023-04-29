local function generateDigit(digits)
  local sum = 0
  for i = 1, 9 do
    local num = tonumber(string.sub(digits, i, i))
    sum = sum + (11 - i) * num
  end

  local rest = sum % 11
  if rest < 2 then
    return '0'
  end

  return tostring(11 - rest)
end

return function(options)
  local region = options.region
  local formated = options.formated

  if formated == nil then formated = true end

  local cpf = ''
  for i = 1, 8 do
    local num = math.random(0, 9)
    cpf = cpf .. tostring(num)
  end

  local num
  if region == nil then
    num = math.random(0, 9)
  else
    num = region
  end
  cpf = cpf .. tostring(num)

  -- primeiro digito de verificação
  cpf = cpf .. generateDigit(string.sub(cpf, 1, 9))
  -- segundo digito de verificação
  cpf = cpf .. generateDigit(string.sub(cpf, 2, 10))

  if formated then
    return string.format('%s.%s.%s-%s', string.sub(cpf, 1, 3), string.sub(cpf, 4, 6), string.sub(cpf, 7, 9), string.sub(cpf, 10))
  end

  return cpf
end
