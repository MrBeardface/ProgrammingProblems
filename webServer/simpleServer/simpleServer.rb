require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.puts "Wait, I'm not closed! Oh wait, I'm about to be..."
  client.close                 # Disconnect from the client
}

if response == "200"
	file = File.open("index.html")
	file.read
end