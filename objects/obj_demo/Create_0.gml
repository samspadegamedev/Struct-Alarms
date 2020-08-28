/// @description Demo   


my_alarm_set = new alarm_set();

my_hello = new struct_alarm(room_speed, function() {
    show_debug_message("Hello World");
    my_hello.set();
});
my_hello.set();

my_goodbye = new struct_alarm(room_speed, function() {
    show_debug_message("Goodbye");
    my_alarm_set.remove_alarm(my_goodbye);
});
my_goodbye.set();



my_alarm_set.add_alarm(my_hello);
my_alarm_set.add_alarm(my_goodbye);

