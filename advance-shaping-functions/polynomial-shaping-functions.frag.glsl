//Blinn_Wyvill Approximation to the Raised Inverted Cosine
//Sin and cos can be expensive to compute. This is an
//approximation of these based on simple arithmetic functions, making
//it way more efficient.
float blinnWyvillCosineApproximation (float x) {

    float x2 = x*x;
    float x4 = x2*x2;
    float x6 = x4*x2;

    final float fa (4.0/9.0);
    final float fb = (17.0/9.0);
    final float fc = (22.0/9.0);

    float y = fa*x6 - fb*x4 + fc*x2;
    return y;
 }

//Double-Cubic Seat
//Seat-shaped function formed by joining two 3rd-order
//polynomial curves which meet with a horizontal inflection point
//at the control coordinate (a, b)
float doubleCubicSeat (float x, float a, float b) {

   float epsilon = 0.00001;
   float min_param_a = 0.0 + epsilon;
   float max_param_a = 1.0 - epsilon;
   float min_param_b = 0.0;
   float max_param_b = 1.0;
   a = min(max_param_a, max(min_param_a, a));
   b = min(max_param_b, max(min_param_b, b));

   float y = 0;
   if (x <= a){
    y = b - b*pow(1-x/a, 3.0);
   } else {
    y = b + (1-b)*pow((x-a)/(1-a), 3.0);
   }
   return y;
}

//Double-Cubic Seat with Linear Blend
//Modified version of the Double-Cubic Seat which uses a
//single variable to control the location of its inflection.
//A variable b is used to control the amount of the blend between
//the curve and the identity function.
float doubleCubicSeatWithLinearBlend (float x, float a, float b) {

    float epsilon = 0.00001;
    float min_param_a = 0.0 + epsilon;
    float max_param_a = 1.0 - epsilon;
    float min_param_b = 0.0;
    float max_param_b = 1.0;
    a = min(max_param_a, max(min_param_a, a));
    b = min(max_param_b, max(min_param_b, b));
    b = 1.0 - b;

    float y = 0;
    if (x <= a) {
        y = b*x + (1-b)*a*(1-pow(1-x/a, 3.0));
    } else {
        y = b*x + (1-b)*(a + (1-a)*pow((x-a)/(1-a), 3.0));
    }
    return y;
}

//Symmetric Double-Polynomial Sigmoids
//Joins a symmetric pair of polynomials at the center of the unit square
//Exponent n controls the steepness of the wall
float doublePolynomialSigmoid (float x, float a, float b, int n) {

    float y = 0;
    if (n%2 == 0) {
        // even polynomial
        if (x<=0.5){
            y = pow(2.0*x, n)/2.0;
        } else {
            y = 1.0 - pow(2*(x-1), n)/2.0;
        }
    } else {
        // odd polynomial
        if (x<=0.5) {
            y = pow(2.0*x, n)/2.0;
        } else {
            y = 1.0 + pow(2.0*(x-1), n)/2.0;
        }
    }

    return y;
}

//Quadratic Through a Given Point
//Axis-aligned parabola which passes through a user-supplied point (a,b)
//in the unit square
float quadraticThroughAGivenPoint (float x, float a, float b) {

    float epsilon = 0.00001;
    float min_param_a = 0.0 + epsilon;
    float max_param_a = 1.0 - epsilon;
    float min_param_b = 0.0;
    float max_param_b = 1.0;
    a = min(max_param_a, max(min_param_a, a));
    b = min(max_param_b, max(min_param_b, b));

    float A = (1-b)/(1-a) - (b/a);
    float B = (A*(a*a)-b)/a;
    float y = A*(x*x) - B*(x);
    y = min(1,max(0,y));

    return y;
}