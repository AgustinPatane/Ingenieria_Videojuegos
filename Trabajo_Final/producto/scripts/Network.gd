extends Node

# Connection constants
const HOST = "cecom112.mdp.edu.ar"
const PORT = 443
const BASIC_HEADERS = ["User-Agent: GAME/1.0", "Accept: */*"]
const ROUTE = "/franco/game.php"

# Connection variables
var http = null
var is_connected = false

func init_network():
	http = HTTPClient.new()
	http.connect_to_host(HOST, PORT,true)
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		OS.delay_msec(50)
	# Connection result
	var status = http.get_status()
	# Disconnected from the server
	if status == HTTPClient.STATUS_DISCONNECTED:
		print("Network disconnected")
	# DNS failure: Can’t resolve the hostname for the given URL
	elif status == HTTPClient.STATUS_CANT_RESOLVE:
		print("Network cant resolve")
	# Can’t connect to the server
	elif status == HTTPClient.STATUS_CANT_CONNECT:
		print("Network cant connect")
	# Error in HTTP connection
	elif status == HTTPClient.STATUS_CONNECTION_ERROR:
		print("Network connection error")
	# Error in SSL handshake
	elif status == HTTPClient.STATUS_SSL_HANDSHAKE_ERROR:
		print("Network ssl handshake error")
	# Connection established
	elif status == HTTPClient.STATUS_CONNECTED:
		is_connected = true
		print("Connection success")

func _ready():
	init_network()

func postHttp(query):
	init_network()
	#this is not necesary if the info is sent in String
	query = http.query_string_from_dict(query)
	var headers = BASIC_HEADERS
	headers.append("Content-Type: application/x-www-form-urlencoded")
	headers.append("Content-Length: " + str(query.length()))
	http.request(http.METHOD_POST, ROUTE, headers, query)
	# Keep polling until the request is going on
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		http.poll()
		OS.delay_msec(50)

func getHttp(route):
	init_network()
	var headers = BASIC_HEADERS
	headers.append("Content-Type: application/x-www-form-urlencoded")
	http.request(http.METHOD_GET, ROUTE+route, headers)
	# Keep polling until the request is going on
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		http.poll()
		OS.delay_msec(50)
	if http.has_response():
		# Get response headers
		http.get_response_headers_as_dictionary()
		var rb = PoolByteArray() # Array that will hold the data
		while http.get_status() == HTTPClient.STATUS_BODY:
			# While there is body left to be read
			http.poll()
			var chunk = http.read_response_body_chunk() # Get a chunk
			if chunk.size() == 0:
				# Got nothing, wait for buffers to fill a bit
				OS.delay_usec(1000)
			else:
				rb = rb + chunk # Append to read buffer
		http.close()
		return rb.get_string_from_ascii()
	
