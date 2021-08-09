%% In His Exalted Name
% Psychophysic Workshope 2021  (Held in: Psychology & education school
% University of Tehran)
%
%
%written by : Fatemeh Fallah
%
%
%fh.fallah90@gmail.com
%
%last edition : 2021/8/4
%
close all;
clear all;
clc;

path_code = cd;
addpath(genpath([path_code '\sup']))

%% to test and diagnose screen sync issues 
%Screen Test
Screen('Preference','SkipSyncTests',1);
ScreenTest()  % Screen Test --> after running the code press 0 to test your screen

%% Read in the image data using imread()
A = imread('mypicture.jpg');
[A, map] = imread('mypicture.jpg');
[A, map, alpha] = imread('mypicture.jpg');

%% Read in the image data using imread()
faceData = imread('sadface.jpg');
size(faceData)

%% Displaying images

Screen('Preference', 'SkipSyncTests', 1);
%Open the screen
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));

%Create texture
faceData=imread('sadface.jpg');
faceTexture=Screen('MakeTexture',wPtr,faceData);

%Draw it
Screen('DrawTexture',wPtr,faceTexture);
Screen('Flip',wPtr);

%Wait for keypress and clear
KbWait();

clear Screen;

%% Moving images

Screen('Preference', 'SkipSyncTests', 1);
%Open the screen
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
xCenter=rect(3)/2;
yCenter=rect(4)/2;

%Create texture
faceData=imread('sadface.jpg');
faceTexture=Screen('MakeTexture',wPtr,faceData);

%Get size of image
[imageHeight,imageWidth,colorChannels]=size(faceData);

%Define image rect
imageRect=[0 0 imageWidth imageHeight];

%Draw it
Screen('DrawTexture',wPtr,faceTexture,[],imageRect);
Screen('Flip',wPtr);

%Wait for keypress
KbWait();

%Move the image to 50,100
xOffset=50;
yOffset=100;
imageRect=[xOffset,yOffset,xOffset+imageWidth,yOffset+imageHeight];

%Draw new version
Screen('DrawTexture',wPtr,faceTexture,[],imageRect);
Screen('Flip',wPtr);

%Wait for keypress and clear
WaitSecs(0.5);
KbWait();
clear Screen;

%% Scaling images

Screen('Preference', 'SkipSyncTests', 1);

%Open the screen
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
xCenter=rect(3)/2;
yCenter=rect(4)/2;

%Create texture
faceData=imread('sadface.jpg');
faceTexture=Screen('MakeTexture',wPtr,faceData);

%Get size of image
[imageHeight,imageWidth,colorChannels]=size(faceData);

%Define image rect
imageRect=[0 0 imageWidth imageHeight];

%Center it
destinationRect=CenterRect(imageRect,rect);

%Draw it
Screen('DrawTexture',wPtr,faceTexture,[],destinationRect);
Screen('Flip',wPtr);

%Wait for keypress
KbWait();

%Shrink by a factor of 2
imageRect=imageRect./2;
destinationRect=CenterRect(imageRect,rect);

%Draw shrunken version
Screen('DrawTexture',wPtr,faceTexture,[],destinationRect);
Screen('Flip',wPtr);

%Wait for keypress and clear
WaitSecs(0.5);
KbWait();
clear Screen;

%% Rotating images

Screen('Preference', 'SkipSyncTests', 1);
%Open the screen
[wPtr,rect]=Screen('OpenWindow',max(Screen('Screens')));

%Creat texture
faceData=imread('sadface.jpg');
faceTexture=Screen('MakeTexture',wPtr,faceData);

%Draw it
Screen('DrawTexture',wPtr,faceTexture);
Screen('Flip',wPtr);

%Wait for keypress and clear
KbWait();

angle=0;

start=GetSecs();
duration=5;

while GetSecs < start + duration
    Screen('DrawTexture',wPtr,faceTexture,[],[],angle);
    Screen('Flip',wPtr);
    angle= angle+1;
end
    
clear Screen;

%% Multiple images
Screen('Preference', 'SkipSyncTests', 1);

%Open the screen
[wPtr,rect]=Screen('OpenWindow',max(Screen('Screens')));
xCenter=rect(3)/2;
yCenter=rect(4)/2;

%Create textures
sadFaceData=imread('sadface.jpg');
sadFaceTexture=Screen('MakeTexture',wPtr,sadFaceData);

angryFaceData=imread('angryface.jpg');
angryFaceTexture=Screen('MakeTexture',wPtr,angryFaceData);

%Get size of image(both images are the same size in this example)
[imageHeight,imageWidth,colorChannels]=size(sadFaceData);

%Define upper left hand corner of image rect
distanceFromCenter=50;
sadX=xCenter - imageWidth - distanceFromCenter;
sadY=yCenter - imageHeight/2;
angryX=xCenter + distanceFromCenter;
angryY=yCenter - imageHeight/2;

%Define destination rects
sadRect=[sadX,sadY,sadX+imageWidth,sadY+imageHeight];
angryRect=[angryX,angryY,angryX+imageWidth,angryY+imageHeight];

%Draw them
Screen('DrawTexture',wPtr,sadFaceTexture,[],sadRect);
Screen('DrawTexture',wPtr,angryFaceTexture,[],angryRect);
Screen('Flip',wPtr);

%Wait for keypress and clear
KbWait();
clear Screen;

%% Alpha blending
 
%open screen
Screen('Preference', 'SkipSyncTests', 1);
[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

% Turn on alpha blending
Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

%Create texture
faceData=imread('sadface.jpg');
faceTexture=Screen('MakeTexture',wPtr,faceData);

%Draw it
Screen('DrawTexture',wPtr,faceTexture,[],[],[],[],0.5);

%Get size of image
[imageHeight,imageWidth,colorChannels]=size(faceData);

%Define image rect
imageRect=[0 0 imageWidth imageHeight];

%Draw it
Screen('DrawTexture',wPtr,faceTexture,[],imageRect);


%show them
Screen('Flip',wPtr)

KbWait(); %wait until key pressed

clear Screen;

 %% Movies
playMovie()

%% Tests Sync
Screen('Preference', 'SkipSyncTests', 1);
VBLSyncTest() % Tests Sync

%% Perceptual VBL Sync Test
PerceptualVBLSyncTest() % Perceptual VBL Sync Test
%%instructions on how to install the kernel driver

%% Testing the screen

help SyncTrouble 

%% Skipping Sync Tests

Screen('Preference','SkipSyncTests',1);

%% Screen Timing

Screen('Preference','SkipSyncTests',1);

wPtr = Screen('OpenWindow',0);
% wPtr =Screen('OpenWindow',max(Screen('Screens')));
flipTime = Screen('Flip',wPtr);

KbWait(); %wait until key pressed

clear Screen;

%% Screen Timing

now = GetSecs();
aLittleLater = GetSecs();
gap = aLittleLater - now;
