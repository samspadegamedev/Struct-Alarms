// Struct Alarm Script File


/// @function alarm_struct(default_timer, function)
/// @param {real}                       default_timer a number greater than zero
/// @param {function} function          what the alarm will do when it goes off
/// @description creates a struct based alarm, can take 0 or 2 starting arguments
function alarm_struct(_default_timer, _func) constructor {
        
    timer = 0;
    active = false;
    
    if (argument_count == 2) { 
        default_timer = _default_timer;
        my_func = _func;    
    } else {
        default_timer = 0;
        my_func = function() {show_debug_message("No function set for this alarm");}
    }

    static set = function(_value) {
        timer = argument_count == 1 ? argument[0] : default_timer;
        active = true;
    }
    
    static set = function() {
        timer = default_timer;
        active = true;
    }
    
    static run = function() {
        if (timer < 0) exit;
        timer -= argument_count == 1 ? argument[0] : 1;
        if (timer <= 0) && (active) {
            active = false;
            trigger();       
        } 
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
            var _new_array = array_create(alarm_amount - 1);
            for (var i = 0; i < (alarm_amount - 1); i += 1) {
                if (i < _pos) {
                    _new_array[i] = alarm_array[i];
                } else {
                    _new_array[i] = alarm_array[i + 1];
                }
            }
            alarm_array = _new_array;
        }
        alarm_amount--;
        return _alarm;
    }

    static run = function() {
        var _value = argument_count == 1 ? argument[0] : 1;
        for (var i = 0; i < alarm_amount; i += 1) {
            alarm_array[i].run(_value);
        }
    }

}




