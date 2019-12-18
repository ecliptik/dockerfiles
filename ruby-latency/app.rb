require "sinatra"
require "net/http"
require "uri"

# Sleep for 120 seconds then return a 418
get "/" do
  sleep 120
  halt 418, "I'm a teapot"
end
