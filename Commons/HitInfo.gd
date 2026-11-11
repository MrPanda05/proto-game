class_name HitInfo
extends RefCounted

var damage:float = 5
var critic: bool = false
var superCrict: bool = false
## The one behind this damage info, say a bullet create this hitinfo, but the one who shoots was player, player would the Source
var Source:Node
## The one that actually called hurtbox.DoDamage(), with the example above, bullet would be damage Source
var Attacker: Node
