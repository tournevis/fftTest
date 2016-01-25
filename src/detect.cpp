//
//  detect.cpp
//  fftTest
//
//  Created by Arthur Robert on 21/01/2016.
//
//

#include "detect.h"

void detect(){
}
detect::detect(int freqInit, int idInit){
    _freq = freqInit;
    _id = idInit;
    pingNum = 0 ;
    
}
detect::~detect(){
}
void detect::onHighFreq(int freq)
{
    if(_freq == 0 ){
        _freq = freq;
    }
    pingNum ++;
    
}