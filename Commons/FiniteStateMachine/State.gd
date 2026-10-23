class_name State
extends Node
## Base class for states in a finite state machine (FSM).

## The FSM that owns this state.
var fsm: FSM

## Called once when the FSM is ready. Use for caching and one-time setup.
func Start() -> void:
	pass

## Called when the state is entered.
func Enter() -> void:
	pass

## Called when the state is exited.
func Exit() -> void:
	pass

## Called every frame by the FSM's _process.
func Update(_delta: float) -> void:
	pass

## Called every physics frame by the FSM's _physics_process.
func FixUpdate(_delta: float) -> void:
	pass

## Called by the FSM's _unhandled_input.
func UnhandleInput(_event: InputEvent) -> void:
	pass

## Called by the FSM's _input for every input event.
func HandleInput(_event: InputEvent) -> void:
	pass
