/// @description Demo   


my_alarm_group = new alarm_group();


my_hello_alarm = new alarm_struct(room_speed, function() {
    show_debug_message("Hello World");
    my_hello_alarm.set();
});
my_hello_alarm.set();

my_goodbye_alarm = new alarm_struct(room_speed, function() {
    show_debug_message("Goodbye");
    my_alarm_group.remove_alarm(my_goodbye_alarm);
});
my_goodbye_alarm.set();

my_blank_alarm = new alarm_struct();


my_alarm_group.add_alarm(my_hello_alarm);
my_alarm_group.add_alarm(my_goodbye_alarm);

