extends Node

signal SFX_VOLUME_UPDATED(new_value)
signal BGM_VOLUME_UPDATED(new_value)

enum AudioBusChannels { Master, SFX, BGM }

const CONFIG_FILENAME:String = "config.cfg"

var sfx_volume = 1.0:
	set(value):
		if (sfx_volume != value):
			sfx_volume = value
			setBusVolume(AudioBusChannels.SFX, sfx_volume)
		
var bgm_volume = 1.0:
	set(value):
		if (bgm_volume != value):
			bgm_volume = value
			setBusVolume(AudioBusChannels.BGM, sfx_volume)
		

func setBusVolume(bus, value):
	var volume_db = -72.0 - (-72.0 * value)
	AudioServer.set_bus_volume_db(bus, volume_db)


func loadData():
	var optionsFile = ConfigFile.new()
	
	var status = optionsFile.load("user://%s" % CONFIG_FILENAME)
	
	if status == OK:
		sfx_volume = optionsFile.get_value("Options", "sfx_volume")
		bgm_volume = optionsFile.get_value("Options", "bgm_volume")
		
		SFX_VOLUME_UPDATED.emit(sfx_volume)
		BGM_VOLUME_UPDATED.emit(bgm_volume)


func saveData():
	var optionsFile = ConfigFile.new()
	
	optionsFile.set_value("Options", "sfx_volume", sfx_volume)
	optionsFile.set_value("Options", "bgm_volume", bgm_volume)
	
	optionsFile.save("user://%s" % CONFIG_FILENAME)
