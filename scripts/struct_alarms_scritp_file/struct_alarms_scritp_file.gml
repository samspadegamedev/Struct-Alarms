// Struct Alarm Script File


/// @function alarm_struct(default_start_time, function)
/// @param {real} default_start_time         a number greater than zero
/// @param {function} function          what the alarm will do when it goes off
/// @description creates a struct based alarm, can take 0 or 2 starting arguments
function alarm_struct(_default_start_time, _func) constructor {

    time_remaining = 0;
    default_start_time = 0;                  
    alarm_event = function() {
        show_debug_message("No function set for this alarm");
    }

    //set the default_start_time and alarm_event variables if the optional arguments are provided
    if (argument_count == 2) { 
        default_start_time = _default_start_time;
        alarm_event = _func;    
    } 

    //set alarm to the specified value or to the of default_start_time if no value is given
    static set = function() {
        time_remaining = argument_count == 1 ? argument[0] : default_start_time;
    }

    //run the alarm by counting down by the value given or 1 if no value is given
    static run = function() {
        if (time_remaining > 0) {
            time_remaining -= argument_count == 1 ? argument[0] : 1;
            if (time_remaining <= 0) {
                alarm_event();       
            } 
        }
    }

    static is_active = function() {
        return time_remaining > 0 ? true : false;
    }

    static cancel = function() {
        time_remaining = 0;
    }

}


/// @function alarm_group()
/// @description creates an empty alarm group, alarm groups can be used to run groups of alarms together
function alarm_group() constructor {

    alarm_amount = 0;
    alarm_array = [];

    static add_alarm = function(_alarm) {        
        alarm_array[alarm_amount++] = _alarm;
    }
    
    static remove_alarm = function(_alarm) { 
        var _pos = -1;
        for (var i = 0; i < alarm_amount; i += 1) {
            if (alarm_array[i] == _alarm) {
                _pos = i;
                break;
            }
        }
        if (_pos != -1) {
            var _new_array = array_create(--alarm_amount);
            for (var i = 0; i < alarm_amount; i += 1) {
                if (i < _pos) {
                    _new_array[i] = alarm_array[i];
                } else {
                    _new_array[i] = alarm_array[i + 1];
                }
            }
            alarm_array = _new_array;
        }
        return _alarm;
    }

    static run = function() {
        var _value = argument_count == 1 ? argument[0] : 1;
        for (var i = 0; i < alarm_amount; i += 1) {
            alarm_array[i].run(_value);
        }
    }

}




