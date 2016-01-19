#pragma once

#include "ofxiOS.h"
#include "fft.h"

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    int bufferCounter;
    private:
    float highFreq;
    /*--------------------------------------------------------------
     
     
     FFT
     
     
     --------------------------------------------------------------*/
    static const int fft_size = 2048;
    ofSoundStream soundStream;
    void audioIn(float* input, int bufferSize, int nChannels);
    
    float *left, *right;
    float *magnitudeL, *phaseL, *powerL, *tempL;
    float *magnitudeR, *phaseR, *powerR, *tempR;
    float max_tempL, max_tempR, max_magL, max_magR, avg_powerL, avg_powerR;
    int buffer_size;
    class fft myfft;
    
    float preTime, curTime, gapTime;

};


