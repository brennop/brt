local server = require "server"

local cpf = require "lib.cpf"
local cnpj = require "lib.cnpj"
local cep = require "lib.cep"

-- set random seed
math.randomseed(os.time())

server
  .get("/cpf", cpf)
  .get("/cnpj", cnpj)
  .get("/cep", cep)
  .listen()

