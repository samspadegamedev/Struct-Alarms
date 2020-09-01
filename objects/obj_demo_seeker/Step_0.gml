/// @description Demo Seeker



if (keyboard_check_pressed(vk_space)) change_direction_timer.alarm_event();
if (keyboard_check_pressed(vk_enter)) change_direction_timer.default_start_time = irandom_range(10, 50);

change_direction_timer.run();
