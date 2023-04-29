local server = require "server"

local cpf = require "lib.cpf"
local cnpj = require "lib.cnpj"

server
  .get("/cpf", cpf)
  .get("/cnpj", cnpj)
  .listen()

