class_name DeathCanvas
extends CanvasLayer


func _ready() -> void:
	visible = false
	GameManager.OnStateChanged.connect(CheckGlobalState)

func CheckGlobalState():
	if(GameManager.CurrentState == GameManager.States.GAMEOVER):
		visible = true
func OnRetryButtonButtonDown() -> void:
	GameManager.DestroyGameBus()
	GameManager.CreateGameBus()
	GameManager.CurrentState = GameManager.States.PLAYING
	get_tree().reload_current_scene()


func OnQuitButtonButtonDown() -> void:
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")
