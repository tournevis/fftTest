#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(60);
    ofBackground(255);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    
    /*--------------------------------------------------------------
     
     
     FFT
     
     
     --------------------------------------------------------------*/
    buffer_size = fft_size*2 ;
    left = new float[buffer_size];
    magnitudeL = new float[fft_size];
    phaseL = new float[fft_size];
    powerL = new float[fft_size];
   // right = new float[buffer_size];
   // magnitudeR = new float[fft_size];
   // phaseR = new float[fft_size];
  //  powerR = new float[fft_size];
    ofSoundStreamSetup(0,1, this, 44100, buffer_size, 4);
    tempL = new float[fft_size];
   // tempR = new float[fft_size];
    for (int i = 0; i < fft_size; i++) {
        tempL[i] = 0.0f;
     //   tempR[i] = 0.0f;
    }
    
    gapTime = 0;
    curTime = 0;
    preTime = 0;
    bufferCounter = 0;
    highFreq = 0 ; 
}

//--------------------------------------------------------------
void ofApp::update(){
    /*--------------------------------------------------------------
     
     
     FFT
     
     
     --------------------------------------------------------------*/
    curTime = ofGetElapsedTimef();
    gapTime = curTime - preTime;
    gapTime = ofClamp(gapTime, 0.0f, 1.0f);
    preTime = curTime;
    avg_powerL = 0.0;
    max_tempL = 0.0;
    myfft.powerSpectrum(0, fft_size, left, buffer_size,	magnitudeL, phaseL, powerL, &max_magL, &avg_powerL);

    for (int i = 0; i < fft_size; i++) {
        tempL[i] *= 0.97f;
        tempL[i] = max(magnitudeL[i], tempL[i])*gapTime;
        if(max_tempL < tempL[i]) max_tempL = tempL[i];
        //printf("tempL %f \n", tempL[i]);
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    
    
    float y1 = ofGetHeight() ;
    
    /*MAX VAL */
    ofSetColor(165, 30, 70);
    ofSetLineWidth(1);
    ofDrawLine(0, y1*0.5 - max_tempL*1000, ofGetWidth(),y1*0.5 - max_tempL*1000);
    
    /* LAST 19K freq */
    
    ofSetColor(85, 30, 234);
    ofSetLineWidth(3);
    ofDrawLine(highFreq, 0, highFreq, ofGetHeight());
    
    /* MIDDLE LANE */
    
    ofSetColor(145, 8, 35);
    ofSetLineWidth(2);
    ofDrawLine(0, y1*0.5, ofGetWidth(), y1*0.5);
    
    
    ofSetColor(245, 58, 135);
    ofSetLineWidth(3);

    
    
    
    
   
    /* for(int i=0; i<buffer_size; i++){
         float p = i / (float)(buffer_size-1);
         float x = p * ofGetWidth();
         float y2 = y1  - tempR[i] *1000;
        ofDrawLine(x, y1, x, y2);
         
     
     } */

    float y3 = ofGetHeight()*0.5;
    
    for(int i=0; i<buffer_size; i++){
        float p = i / (float)(buffer_size-1);
        float x = p * ofGetWidth();
        float y2 = y3  - tempL[i] * 1000;
        ofDrawLine(x, y3, x, y2);
        if(tempL[i]  > 0.018 ){
            printf("thigh freq  %f \n", tempL[i]);
            highFreq = x ;
        }
        
    }
    ofDrawBitmapString("buffers received: " + ofToString(bufferCounter), 20, ofGetHeight() - 40);


}

void ofApp::audioIn(float * input, int bufferSize, int nChannels){
    if(buffer_size < bufferSize){
        ofLog(OF_LOG_ERROR, "your buffer size was set to %i - but the stream needs a buffer size of %i", buffer_size, bufferSize);
    }
    for (int i = 0; i < bufferSize; i++){
        left[i] = input[i];
       // right[i] = input[i*2+1];
    }
    bufferCounter ++ ;
}
//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
