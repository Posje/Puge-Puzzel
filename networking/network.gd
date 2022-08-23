extends Node

const DEFAULT_PORT = 1500
const MAX_CLIENTS = 4

var server = null
var client = null

var ip_addres = "127.0.0.1"

func _ready():
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	get_tree().connect("connection_failed", self, "_connection_failed")

func create_server():
	print("creating server")
	
	server = NetworkedMultiplayerENet.new()
	server.create_client(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().network_peer = server

func join_server():
	print("joining server")
	
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_addres, DEFAULT_PORT)
	get_tree().network_peer = client

func _connected_to_server():
	print("successfuly conected to the server")

func _server_disconnected():
	print("server disconected")
	
	reset_network_connection()

func _connection_failed():
	print("conmection failed")
	
	reset_network_connection()

func reset_network_connection():
	if get_tree().has_network_peer():
		get_tree().network_peer = null
