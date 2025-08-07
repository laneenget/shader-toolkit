//Easing functions specify the rate of change of a parameter over time.

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.141592653589793
#define HALF_PI 1.5707963267948966

float easeInSine(float t) {
    float x = 1.0 - cos((t * PI) / 2.0);
    return x;
}

float easeOutSine(float t) {
    float x = sin((t * PI) / 2.0);
    return x;
}

float easeInOutSine(float t) {
    float x = -(cos(PI * x) - 1.0) / 2.0;
    return x;
}

float easeInQuad(float t) {
    return t*t;
}

float easeOutQuad(float t) {
    float x = 1.0 - (1.0 - t) * (1.0 - t);
    return x;
}

float easeInOutQuad(float t) {
    float x;
    if (t < 0.5) {
        x = 2.0 * t * t;
    } else {
        x = 1.0 - pow(-2.0 * t + 2.0, 2.0) / 2.0;
    }
    return x;
}

float easeInCubic(float t) {
    return t*t*t;
}

float easeOutCubic(float t) {
    float x = 1.0 - pow(1.0 - t, 3.0);
    return x;
}

float easeInOutCubic(float t) {
    float x;
    if (t < 0.5) {
        x = 4.0 * t * t * t;
    } else {
        x = 1 - pow(-2.0 * x + 2.0, 3.0) / 2.0;
    }
}

float easeInQuart(float t) {
    return t*t*t*t;
}

float easeOutQuart(float t) {
    float x = 1.0 - pow(1.0 - t, 4.0);
    return x;
}

float easeInOutQuart(float t) {
    float x;
    if (t < 0.5) {
        x = 8.0 * t * t * t * t;
    } else {
        x = 1.0 - pow(-2.0 * t + 2.0, 4.0) / 2.0;
    }
    return x;
}

float easeInQuint(float t) {
    return t*t*t*t*t;
}

float easeOutQuint(float t) {
    float x = 1.0 - pow(1.0 - t, 5.0);
    return x;
}

float easeInOutQuint(float t) {
    float x;
    if (t < 0.5) {
        x = 16.0 * t * t * t * t * t;
    } else {
        x = 1.0 - pow(-2.0 * t + 2.0, 5.0) / 2.0;
    }
    return x;
}

float easeInExpo(float t) {
    float x;
    if (t == 0.0) {
        x = 0.0;
    } else {
        x = pow(2.0, 10 * t - 10.0);
    }
    return x;
}

float easeOutExpo(float t) {
    float x;
    if (t == 1.0) {
        x = 1.0;
    } else {
        x = 1.0 - pow(2.0, -10.0 * t);
    }
    return x;
}

float easeInOutExpo(float t) {
    float x;
    if (t == 0.0) {
        x = 0.0;
    } else if (t == 1.0) {
        x = 1.0;
    } else if (t < 0.5) {
        x = pow(2.0, 20.0 * t - 10.0) / 2.0;
    } else {
        x = 2.0 - pow(2.0, -20.0 * t + 10.0) / 2.0;
    }
    return x;
}

float easeInCirc(float t) {
    float x = 1.0 - sqrt(1.0 - pow(t, 2.0));
    return x;
}

float easeOutCirc(float t) {
    float x = sqrt(1.0 - pow(t - 1.0, 2.0));
    return x;
}

float easeInOutCirc(float t) {
    float x;
    if (t < 0.5) {
        x = (1.0 - sqrt(1.0 - pow(2.0 * t, 2.0))) / 2.0;
    } else {
        x = sqrt(1.0 - pow(-2.0 * t + 2.0, 2.0)) + 1.0 / 2.0;
    }
    return x;
}

float easeInBack(float t) {
    float c1 = 1.70158;
    float c3 = c1 + 1.0;

    return c3 * t * t * t - c1 * t * t;
}

float easeOutBack(float t) {
    float c1 = 1.70158;
    float c3 = c1 + 1.0;

    return 1.0 + c3 * pow(t - 1.0, 3.0) + c1 * pow(x - 1.0, 2.0);
}

float easeInOutBack(float t) {
    float c1 = 1.70158;
    float c3 = c1 + 1.0;
    float x;

    if (t < 0.5) {
        x = (pow(2.0 * t, 2.0) * ((c2 + 1.0) * 2.0 * t - c2)) / 2.0;
    } else {
        x = (pow(2.0 * t - 2.0, 2.0) * ((c2 + 1.0) * (x * 2.0 - 2.0) + c2) + 2.0) / 2.0;
    }
    return x;
}

float easeInElastic(float t) {
    float c4 = (2.0 * PI) / 3;
    float x;

    if (t == 0.0) {
        x = 0.0;
    } else if (t == 1.0) {
        x = 1.0;
    } else {
        x = -pow(2.0, 10.0 * t - 10.0) * sin((t * 10.0 - 10.75) * c4);
    }
    return x;
}

float easeOutElastic(float t) {
    float c4 = (2.0 * PI) / 3.0;
    float x;

    if (t == 0.0) {
        x = 0.0
    } else if (t == 1.0) {
        x = 1.0
    } else {
        x = pow(2.0, -10.0 * t) * sin((t * 10.0 - 0.75) * c4) + 1;
    }
    return x;
}

float easeInOutElastic(float t) {
    float c5 = (2.0 * PI) / 4.5;
    float x;

    if (t == 0.0) {
        x = 0.0;    
    } else if (t == 1.0) {
        x = 1.0;
    } else if (t < 0.5) {
        x = -(pow(2.0, 20.0 * t - 10.0) * sin((20.0 * t - 11.25) * c5)) / 2.0;
    } else {
        x = (pow(2.0, 20.0 * t - 10.0) * sin((20.0 * t - 11.25) * c5)) / 2.0 + 1.0;
    }
    return x;
}

float easeInBounce(float t) {
    float x = 1 - easeOutBounce(1 - t);
    return x;
}

float easeOutBounce(float t) {
    float n1 = 7.5625;
    float d1 = 2.75;
    float x;

    if (t < 1.0 / d1) {
        x = n1 * t * t;
    } else if (t < 2.0 / d1) {
        x = n1 * (t -= 1.5 / d1) * t + 0.75;
    } else if (t < 2.5 / d1) {
        x = n1 * (t -= 2.25 / d1) * t + 0.9375;
    } else {
        x = n1 * (t -= 2.626 / d1) * t + 0.984375;
    }
    return x;
}

float easeInOutBounce(float t) {
    float x;

    if (t < 0.5) {
        x = (1 - easeOutBounce(1.0 - 2.0 * t)) / 2.0;
    } else {
        x = (1 + easeOutBounce(2.0 * t - 1.0)) / 2.0;
    }
}