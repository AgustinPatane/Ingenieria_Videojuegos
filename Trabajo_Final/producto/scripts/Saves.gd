extends Node

const SAVE_PATH = "user://savesGlobal.sav"

var player = {
"username":"",
"score":0,
"highscore":0
}

var skin_default = {"nombre":"Black","tipo":"color","valor":0}

var skin_1 = {"nombre":"Pela","tipo":"custom","valor":0}
var skin_2 = {"nombre":"Soldado_arg","tipo":"custom","valor":0}
var skin_3 = {"nombre":"Nba","tipo":"custom","valor":0}
var skin_4 = {"nombre":"Rambo","tipo":"custom","valor":0}
var skin_5 = {"nombre":"Yellow","tipo":"color","valor":0}
var skin_6 = {"nombre":"Red","tipo":"color","valor":0}
var skin_7 = {"nombre":"Blue","tipo":"color","valor":0}
var skin_8 = {"nombre":"Black","tipo":"color","valor":1}

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
	var config = {
		fullscreen = OS.is_window_fullscreen(),
		vol_sonido = Atributos.volumenes.default_vol_sonido,
		vol_musica = Atributos.volumenes.default_vol_musica,
		sound_muted = Atributos.volumenes.sound_muted,
		music_muted = Atributos.volumenes.music_muted
	}
	if not save_config.file_exists(Atributos.ruta_config):
		config.fullscreen = true
	save_config.open(Atributos.ruta_config, File.WRITE)
	
	save_config.store_line(to_json(config))
	save_config.close()
	Atributos.set_config(config)
	
func cargar_config():
	var save_config = File.new()
	if not save_config.file_exists(Atributos.ruta_config):
		guardar_config()
		return # Error! No hay archivo que guardar
	save_config.open(Atributos.ruta_config, File.READ)
	var config = parse_json(save_config.get_line())
	Atributos.set_config(config)
	save_config.close()

func crea_arch_tienda():
	var save_tienda = File.new()
	save_tienda.open(Atributos.ruta_tienda, File.WRITE)
	var tienda = [skin_default,skin_1,skin_2,skin_3,skin_4,skin_5,skin_6,skin_7,skin_8]
	save_tienda.store_line(to_json(tienda))
	save_tienda.close()
