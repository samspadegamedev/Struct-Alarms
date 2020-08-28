// Struct Alarm Script File


function struct_alarm(_default_timer, _func) constructor {
    
    timer = 0;
    
    default_timer = _default_timer;
    my_func = _func;
    triggered = false;
    
    static set_to = function(_value) {
        timer = _value;
        triggered = false;
    }
    
    static set = function() {
        timer = default_timer;
        triggered = false;
    }
    
    static set_default_timer = function(_value) {
        default_timer = _value;
    }
     
    static set_function = function(_func) {
        my_func = _func;
    }
        
    static update = function() {
        if (timer < 0) exit;
        timer -= argument_count == 1 ? argument[0] : 1;
        if (timer <= 0) && (!triggered) {
            triggered = true;
            my_func();        
        } 
    }
    
}

function alarm_set() constructor {

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
    }

    static update = function() {
        var _value = argument_count == 1 ? argument[0] : 1;
        for (var i = 0; i < alarm_amount; i += 1) {
            alarm_array[i].update(_value);
        }
    }

}




