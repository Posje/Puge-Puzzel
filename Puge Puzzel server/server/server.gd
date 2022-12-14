extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1500
var max_players = 4

func _ready():
	start_server()
	
func start_server():
	network.create_server(port, max_players)
	get_tree().network_peer = network
	network.connect("peer_connected", self, "_player_connected")
	network.connect("peer_disconnected", self, "_player_disconnected")
	
	print("server started")
	
func _player_connected(player_id):
	print("Player: " + str(player_id) + " Connected")
	
func _player_disconnected(player_id):
	print("Player: " + str(player_id) + " Disconnected")
