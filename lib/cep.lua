local states = {
    AC = 1,
    AL = 2,
    AM = 3,
    AP = 4,
    BA = 5,
    CE = 6,
    DF = 7,
    ES = 8,
    GO = 9,
    MA = 10,
    MG = 11,
    MS = 12,
    MT = 13,
    PA = 14,
    PB = 15,
    PE = 16,
    PI = 17,
    PR = 18,
    RJ = 19,
    RN = 20,
    RO = 21,
    RR = 22,
    RS = 23,
    SC = 24,
    SE = 25,
    SP = 26,
    TO = 27
}

local ranges = {
    {{69900000, 69999999}},
    {{57000000, 57999999}},
    {{69000000, 69299999}, {69400000, 69899999}},
    {{68900000, 68999999}},
    {{40000000, 48999999}},
    {{60000000, 63999999}},
    {{70000000, 72799999}, {73000000, 73699999}},
    {{29000000, 29999999}},
    {{72800000, 72999999}, {73700000, 76799999}},
    {{65000000, 65999999}},
    {{30000000, 39999999}},
    {{79000000, 79999999}},
    {{78000000, 78899999}},
    {{66000000, 68899999}},
    {{58000000, 58999999}},
    {{50000000, 56999999}},
    {{64000000, 64999999}},
    {{80000000, 87999999}},
    {{20000000, 28999999}},
    {{59000000, 59999999}},
    {{76800000, 76999999}},
    {{69300000, 69399999}},
    {{90000000, 99999999}},
    {{88000000, 89999999}},
    {{49000000, 49999999}},
    {{01000000, 19999999}},
    {{77000000, 77999999}}
}

return function(options)
  local state, index = options.state, 0

  if state then
    index = states[state:upper()]
  else
    index = math.random(1, #ranges)
  end

  local format = options.format or true

  if format == "false" then
    format = false
  end

  local rangeSet = ranges[index]

  if not rangeSet then
    error("Invalid state")
  end

  local range = rangeSet[math.random(1, #rangeSet)]

  local cep = math.random(range[1], range[2])

  if format then
      return string.format('%s-%s', string.sub(cep, 1, 5), string.sub(cep, 6))
  end

  return cep
end
