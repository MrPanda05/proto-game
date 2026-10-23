@tool
class_name FSM
extends Node

signal state_changed(state_name: String)

@export var initial_state: NodePath:
	set(value):
		initial_state = value
		update_configuration_warnings()
## should the state machine auto enter on initial state on ready?
@export var autoStart: bool = true
var states: Dictionary = {}  # String -> State
var current_state: State


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if initial_state.is_empty():
		warnings.append("No initial state set")
	return warnings


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	if get_child_count() == 0:
		push_warning("No states found in FSM")
		return

	for child in get_children():
		if child is State:
			states[child.name] = child
			child.fsm = self
			child.Start()

	if initial_state.is_empty():
		push_warning("No initial state set in FSM")
		return

	current_state = get_node(initial_state) as State
	if current_state == null:
		push_warning("Current state is null")
		return
	if(autoStart):
		current_state.Enter()

func StartFSM():
	if current_state == null:
		push_warning("Current state is null")
		return
	current_state.Enter()

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if current_state:
		current_state.Update(delta)


func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if current_state:
		current_state.FixUpdate(delta)


func _unhandled_input(event: InputEvent) -> void:
	if Engine.is_editor_hint():
		return
	if current_state:
		current_state.UnhandleInput(event)


func _input(event: InputEvent) -> void:
	if Engine.is_editor_hint():
		return
	if current_state:
		current_state.HandleInput(event)


func transition_to_state(key: String) -> void:
	if not states.has(key) or current_state == states[key]:
		return
	print("Entering ", key)
	state_changed.emit(key)
	if current_state:
		current_state.Exit()
	current_state = states[key]
	current_state.Enter()


func get_current_state_name() -> String:
	return current_state.name if current_state != null else ""


func force_null_state() -> void:
	if current_state:
		current_state.Exit()
	current_state = null
	state_changed.emit("null")
