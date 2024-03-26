local http = require "http"

local index = require "lib.index"
local cpf = require "lib.cpf"
local cnpj = require "lib.cnpj"
local cep = require "lib.cep"

-- set random seed
math.randomseed(os.time())

local function wrap(fn)
  return function(request)
    return tostring(fn(request.query))
  end
end

http
  :handle("GET /", index)
  :handle("GET /cpf", wrap(cpf))
  :handle("GET /cnpj", wrap(cnpj))
  :handle("GET /cep", wrap(cep))
  :listen(3000)

