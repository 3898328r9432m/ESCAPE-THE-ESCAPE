extends Label
var seconds_thing = 0
var time = [8, 30, "am"]

func update_time() -> void:
	time[1] += 1
	if time[1] == 60:
		time[1] = 0
		time[0] += 1
	# PM handling
	if time[0] >= 12 or time[0] <= 3:
		time[2] = "pm"
	else:
		time[2] = "am"
	
	# Time loop handling
	if time[0] == 13:
		time[0] = 1
		
		
	if time[0] == 12:
		time[0] = 12
		time[2] = "pm"
	if time[0] == 13:
		time[0] = 1
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	seconds_thing += delta
	
	if seconds_thing >= 1:
		seconds_thing = 0
		update_time()
		if time[1] <= 9:
			self.text = str(time[0]) + ":0" + str(time[1]) + str(time[2])
		else:
			self.text = str(time[0]) + ":" + str(time[1]) + str(time[2])

	pass
