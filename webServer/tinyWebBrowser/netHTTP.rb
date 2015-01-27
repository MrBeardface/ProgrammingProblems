require 'net/http'                  # The library we need

host = 'www.tutorialspoint.com'     # The web server
path = '/index.htm'                 # The file we want 

http = Net::HTTP.new(host)          # Create a connection
headers, body = http.get(path)      # Request the file

if headers.code == "200"            # Check the status code   
  print body                        
else                                
  puts "#{headers.code} #{headers.message}" 
end