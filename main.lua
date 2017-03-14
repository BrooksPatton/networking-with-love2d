-- load the http module
local io = require("io")
local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require('json')

local payload = {
  name = "lua",
  message = "Hello from love2d!"
}

headers = {["Content-type"] = "application/x-www-form-urlencoded"}
-- connect to server "www.example.com" and tries to retrieve
-- "/private/index.html". Fails because authentication is needed.
-- out = http.request {
--   method = "POST",
--   url = "http://localhost:3000/api/things",
--   headers = headers,
--   {name="lua", lua="hello from love2d"}
-- }

-- b = http.request('http://localhost:3000/api/things', 'name=lua&message=hello from love2d')
b = http.request('http://localhost:3000/api/things')
decoded = json.decode(b)

function love.draw()
  love.graphics.print(decoded[1].message, 10, 10)
end
