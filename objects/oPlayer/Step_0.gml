/// @description Player movement

//Movement
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
key_sprint = keyboard_check(vk_shift);

if (!key_sprint) {
	sprintsp = 1;
} else {
	sprintsp = 1.5;	
}

var move = key_right - key_left;

hsp = move * (walksp * sprintsp);

if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y , oWall))
	{
		x = x+sign(hsp);
	}
	hsp = 0;

}

x = x + hsp;

vsp = vsp + grv;

if (place_meeting(x, y+1, oWall)) && (key_jump)
{
	vsp = -5;	
}

if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y+sign(vsp) , oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;

}

y = y + vsp;

//Sprite animation

if (!place_meeting(x, y+1, oWall)) 
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0 ) 
	{
		image_index = 1;
	} else {
		image_index = 0;	
	}
} else 
{
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else 
	{
		sprite_index = sPlayerR;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);