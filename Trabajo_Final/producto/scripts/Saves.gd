extends Node

const SAVE_PATH = "user://savesGlobal.sav"

var player = {
"username":"",
"score":0,
"highscore":0
}


func save_game():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	save_game.store_line(to_json(player))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		return # Error! No hay archivo que guardar
	save_game.open(SAVE_PATH, File.READ)
	player = parse_json(save_game.get_line())
	save_game.close()

func guardar_config():
	var save_config = File.new()
	save_config.open("res://Saves/config.sav", File.WRITE)
	
	var config = {
		fullscreen = OS.is_window_fullscreen(),
		vol_sonido = Atributos.volumenes.default_vol_sonido,
		vol_musica = Atributos.volumenes.default_vol_musica,
		sound_muted = Atributos.volumenes.sound_muted,
		music_muted = Atributos.volumenes.music_muted
	}
	
	save_config.store_line(to_json(config))
	save_config.close()
	
func cargar_config():
	var save_config = File.new()
	if not save_config.file_exists("res://Saves/config.sav"):
		guardar_config()
		return # Error! No hay archivo que guardar
	save_config.open("res://Saves/config.sav", File.READ)
	var config = parse_json(save_config.get_line())
	print(config)
	Atributos.set_config(config)
	save_config.close()


