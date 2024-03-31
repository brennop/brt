local message =
[[brt

TL;DR
  curl gerador.top/cpf

TOOLS
  /cpf
    Generate a valid CPF number
    args:
      - format: bool
      - region: number

  /cnpj
    Generate a valid CNPJ number
    args:
      - format: bool
      - suffix: string

  /cep
    Generate a valid CEP number
    args:
      - format: bool
      - state: string
]]

return function()
  return message
end
