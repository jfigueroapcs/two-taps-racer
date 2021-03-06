extends Spatial

var curPos = Vector3();
var nextUpdate = 0;

func _ready():
	curPos = Vector3();

func build_level(num = 2):
	var level = load("res://models/levels/"+globals.trackList[globals.trackSelected].name+"/level.scn");
	
	for i in get_children():
		i.queue_free();
	
	var startPos = curPos.snapped(80.0);
	
	for i in range(2):
		var inst = level.instance();
		inst.set_name("block_"+str(i));
		inst.set_translation(startPos+Vector3(0, 0, -80*i));
		add_child(inst);

func update_level():
	if (curPos.z > nextUpdate):
		return;
	
	var startPos = curPos.snapped(80.0);
	
	for i in range(get_child_count()):
		var inst = get_child(i);
		inst.set_translation(startPos+Vector3(0, 0, -80*i));
		
		nextUpdate -= 40.0;
