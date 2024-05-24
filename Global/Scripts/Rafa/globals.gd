extends Node

signal piece_dropped_signal
signal check_answer
signal level_complete
signal put_back_shapes

var completados: int = 0
var area: String = "area"
var tortugaDone: bool = false
var gatoDone: bool = false
var objectsDone: bool = false
var perroDone: bool = false
var puerta_hecha: bool = false
