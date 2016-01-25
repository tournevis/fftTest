//
//  detect.h
//  fftTest
//
//  Created by Arthur Robert on 21/01/2016.
//
//

#ifndef __fftTest__detect__
#define __fftTest__detect__


#endif
class detect{
public:
    
    detect(int freqInit , int idInit);
    ~detect();
    
    int _freq;
    int pingNum;
    int _id;
    /* Calculate the power spectrum */
    void onHighFreq( int freq  );
    /* ... the inverse */
};