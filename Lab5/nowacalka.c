#include <stdio.h>
#include <immintrin.h>

double dx = 0.0001;
double result = 0.0;

int main() {
    __m256d dx_vec = _mm256_set1_pd(dx);
    __m256d one_vec = _mm256_set1_pd(1.0);
    __m256d three_vec = _mm256_set1_pd(3.0);
    __m256d result_vec = _mm256_setzero_pd();

    for(double x = 1.0; x <= 5.0; x += 4*dx) {
        __m256d x_vec = _mm256_set_pd(x + 3*dx, x + 2*dx, x + dx, x);
        
        __m256d x2_vec = _mm256_mul_pd(x_vec, x_vec); // x*x
        __m256d x3_vec = _mm256_mul_pd(x2_vec, x_vec); // x*x*x
        __m256d x4_vec = _mm256_mul_pd(x3_vec, x_vec); // x*x*x*x
        
        // (x*x*x*x - x)
        __m256d first_vec = _mm256_sub_pd(x4_vec, x_vec);
        
        // (1.0 - 3.0*x)
        __m256d second_vec = _mm256_sub_pd(one_vec, _mm256_mul_pd(three_vec, x_vec));
        
        // (x*x*x*x - x)/(1.0 - 3.0*x) * dx
        __m256d result_i_vec = _mm256_mul_pd(_mm256_div_pd(first_vec, second_vec), dx_vec);
        
        // Dodanie do wyniku
        result_vec = _mm256_add_pd(result_vec, result_i_vec);
    }

    double result_array[4];
    _mm256_storeu_pd(result_array, result_vec);

    for (int i = 0; i < 4; i++) {
        result += result_array[i];
    }

    return 0;
}
