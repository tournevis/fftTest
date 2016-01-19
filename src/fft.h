//
//  fft.h
//  fftTest
//
//  Created by Arthur Robert on 19/01/2016.
//
//

#ifndef __fftTest__fft__
#define __fftTest__fft__

#include <stdio.h>

#endif /* defined(__fftTest__fft__) */



#ifndef _FFT
#define _FFT

#ifndef M_PI
#define	M_PI		3.14159265358979323846  /* pi */
#endif

class fft {
public:
    
    fft();
    ~fft();
    
    /* Calculate the power spectrum */
    void powerSpectrum(int start, int half, float *data, int windowSize,float *magnitude,float *phase, float *power, float *avg_mag, float *avg_power);
    /* ... the inverse */
    void inversePowerSpectrum(int start, int half, int windowSize, float *finalOut,float *magnitude,float *phase);
    
    
};
#endif
