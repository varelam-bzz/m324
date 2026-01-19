/*
Task: Traffic light with argument color
*/
'use strict';

function trafficLight(color){
    if (color === undefined || color === null || color === ''){//??
        return `OUT OF ORDER`//??
    } else {//??
        if (color === 'red'){//??
            return `DON'T WALK!`//??
        }//??
        else if (color === 'orange'){//??
            return `ATTENTION!`//??
        }//??
        else if (color === 'green'){//??
            return `WALK!`//??
        }//??
    }//??
}

module.exports = {
    trafficLight
}
