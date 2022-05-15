extends Node2D

var brown = 10
var green = 10


var seperator_origin =  199.5  # X Value: where seperator touches the left edge
var s_max = 519.5 # X Value for the point where seperator touches right edge
var green_pos = 529

var distance  = 329-9 #distance between brown and green MINUS width of seperator 

func _ready():

	$green.position.x = green_pos
	$green.scale.x = 1
	$seperator.position.x = seperator_origin  #199.5 is the position of the brown panel before being stretched
	



func _process(delta):
	$brown_text.text =  str(brown)
	$green_text.text =  str(green)
	if brown == 0 and green == 0:
		var pixls_total = (distance)/(2)  
		change_green(pixls_total,1)

	else:
		var pixls_total = (distance)/(brown+green)  
		change_green(pixls_total,brown)


	
func change_green(pixels_total, brown ):
	$seperator.position.x = seperator_origin + pixels_total*brown  
	$green.scale.x = ((green_pos+0.5  - $seperator.position.x)/2)/5  #+0.5 because otherwise there are small gaps sometimes
	$green.position.x = green_pos - (s_max  - $seperator.position.x)/2 
	

func _on_brown_s_value_changed(value):
	brown = $brown_s.value


func _on_green_s_value_changed(value):
	green = $green_s.value
