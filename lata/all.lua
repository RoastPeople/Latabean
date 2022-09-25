local lata = require("lata")
for k, v in pairs(lata) do
  _G[k] = v
end
return lata
