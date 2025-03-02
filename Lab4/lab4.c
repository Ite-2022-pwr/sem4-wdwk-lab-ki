#include <stdio.h>

double dx = 0.0001;
double result = 0.0;

int main() {	
	for(double x = 1.0; x <= 5.0; x += dx) {
		result += (x*x*x*x - x)/(1.0 - 3.0*x) * dx;
	}
	
	return 0;
}
