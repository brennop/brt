local server = require "server"

local cpf = require "lib.cpf"

server
  .get("/cpf", cpf)
  .listen()

