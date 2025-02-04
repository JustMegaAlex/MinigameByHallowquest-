
depth = -10;

/// main parameters
vsp_max = 60
grav = 1.3
jump_sp = -30
vsp = 0
in_control = true

was_down_free = false;

jump_count = 0;

initial_image_speed = image_speed

function Move() {
	move_coord(0, vsp)
	var contact = instance_place(x, y, oGround)
	while contact {
		// relative movement
		var realtive_hsp = -contact.hsp
		var dir = point_direction(0, 0, realtive_hsp, vsp)
		// move out of an object
		while place_meeting(x, y, contact) {
	        x -= lengthdir_x(1, dir)
	        y -= lengthdir_y(1, dir)
		}
		var new_contact = instance_place(x, y, oGround)
		if !new_contact {
			return contact
		}
		contact = new_contact
	}
	return contact
}

function AnimationStop() {
	image_speed = 0
}

function AnimationRun() {
	image_speed = initial_image_speed
}
