%This function starts and runs the camera and acquires a frame as a return
function imageData = vid_aq()
%  imaqhwinfo
%  info = imaqhwinfo('winvideo')
% 
% info.DeviceInfo
% info.DeviceInfo.SupportedFormats
% 
% vid = videoinput('winvideo',1,'RGB24_640x480');
% %note this is too many frames currently
% set(vid,'FramesPerTrigger',30);
% preview(vid)
% set(vid,'TriggerRepeat',Inf);
% %grab every 5th frame (also shows other way to refer to properties
% %vid.FrameGrabInterval = 5;
% 
% vid_src=getselectedsource(vid)
% %or
% vid_src=get(vid,'source')
% 
% %this was apparently how to do the motion detection or something
% set(vid_src,'Tag','motion detection setup');


% close all;clear all;

% Create video input object. 
% vid = videoinput('winvideo',1,'RGB24_640x480')
try out = imaqfind;stop(out);delete(out);end

%vid = videoinput('winvideo',1,'RGB24_160x120');
%vid = videoinput('winvideo',1, 'Y800_640x480');
vid = videoinput('winvideo',1);
% set(vid,'FramesPerTrigger',1);
try
    % Set video input object properties for this application.
    % Note that example uses both SET method and dot notation method.
    set(vid,'TriggerRepeat',Inf);
    vid.FrameGrabInterval = 1;
    vid.BayerSensorAlignment = 'rggb';
    vid.ReturnedColorSpace = 'bayer';

    % Set value of a video source object property.
    % vid_src = getselectedsource(vid);
    % set(vid_src,'Tag','motion detection setup');

    % Create a figure window.
    %figure(3); 

    % Start acquiring frames.
    start(vid);

    % Calculate difference image and display it.
    %while(vid.FramesAcquired<=inf) % Stop after 100 frames
    while(vid.FramesAcquired<=1)
        imageData =squeeze(getdata(vid,1));
        flushdata(vid)
        %figure(3)
        %imshow(imageData);

%         data_array=flatern_image(imageData );
% 
%         figure(4)        
%         imageData(:,:,:)=0;
%         data_array=dopredict(data_array,model);
%         imageData(:,:,1)=reshape(data_array(:,1),size(imageData,2),size(imageData,1))';
%         imageData(:,:,2)=reshape(data_array(:,2),size(imageData,2),size(imageData,1))';
%         imageData(:,:,3)=reshape(data_array(:,3),size(imageData,2),size(imageData,1))';
% 
%         imageData=imageData*255;
%         
%         imshow(imageData)
    end 
catch
    lasterr;
end

%realease the video object if there is an error
releaseVid(vid);
    
%internal function for 
function releaseVid(vid)

stop(vid)
flushdata(vid)
delete(vid)
clear vid
end

end
