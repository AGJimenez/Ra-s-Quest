extends AudioStreamPlayer

var level_music

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func play_music_level(level_music):
	_play_music(level_music)


func _on_finished():
	play()