/// @description Seeker


speed = 5;

change_direction_timer = new struct_alarm(30, function() {
    direction = point_direction(x, y, mouse_x, mouse_y);
    change_direction_timer.set();
});
change_direction_timer.set();
