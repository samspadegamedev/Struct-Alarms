# Struct-Alarms
Public asset for alarms done through structs in GameMaker Studio 2.3.

## How to Use
Either copy the code from the script file "struct_alarms_scritp_file.gml" or download the release.

## Example Use
There are two parts to this asset, alarms and alarm sets. Alarms are what they sound like—the actual alarm. Alarm sets are a way to group alarms together so that you can run them all at once. They are not necessary and exist only for additional convinence. 

### Alarms

To **create** an alarm use struct_alarm. Set the default alarm value (this can be changed later) and the function that will run when the alarm goes off (this can also be changed later).
```javascript
//create an alarm with a default timer of one second, that shows the message "Hello World" and resets itself
my_hello_alarm = new struct_alarm(room_speed, function() {
    show_debug_message("Hello World");
    my_hello_alarm.set();
});
```
To **use** an alarm call the alarm's update function (generally in a step event, but it is up to you).
```javascript
my_hello_alarm.update();
```
Additional alarm functions
* set_to (set an alarm directly to a value)
* set  (set the alarm to the default timer value)
* set_default_timer (set the default timer to a value)
* set_function (set the function that runs when the alarm is triggered)
* update (runs the alarm - can be passed the value to run by)

### Alarm Sets
There are three basic things you can do with an alarm set, add alarms to it, remove alarms from it, and run the update function for each alarm. 

```javascript
//create an alarm set
my_alarm_set = new alarm_set();

//add an alarm
my_alarm_set.add_alarm(my_hello_alarm);

//update all alarms in a set
my_alarm_set.update();

//remove an alarm (does not delete the alarm)
my_alarm_set.remove_alarm(my_hello_alarm);
```
