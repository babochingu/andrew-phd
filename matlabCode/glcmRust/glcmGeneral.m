%This example creates gray level co occurence matrix for the
%difference grades of rusts as extracted from the ISO8501-1
%standard.
%The GLCM will look at 4 offsets with 45 degree change
%Plots are created to illustrate the different properties of 
%GLCM to see if it's usable for classification.
clear;
offsets = [0 1; -1 1; -1 0; -1 -1];
gradeImage(1).val = imread('gradeA.jpg');
gradeImage(2).val = imread('gradeB.jpg');
gradeImage(3).val = imread('gradeC.jpg');
gradeImage(4).val = imread('gradeD.jpg');



%Construct the 4 offset glcm for each grade
%%GradeA

rowDivider = 2;
columnDivider = 2;
%assume all sample images to be the same size
rowSegment = floor(size(gradeImage(1).val,1)/rowDivider);
columnSegment = floor(size(gradeImage(1).val,2)/columnDivider);

%Initialise the array of structures
%glcmGradeAMatrix(rowDivider*columnDivider) = struct('R', {1:8,1:8,1:4}, 'G', zeros(8,8,4), 'B', zeros(8,8,4), 'Gray', zeros(8,8,4));
%keyboard
%GLCM of the whole image
counter = 1;
for curr_mat=1:size(gradeImage,2)
    glcmGradeMatrix(curr_mat,counter).R = graycomatrix(gradeImage(curr_mat).val(:,:,1), 'Offset', offsets, 'NumLevels', 8); %whole image
    glcmGradeMatrix(curr_mat,counter).G = graycomatrix(gradeImage(curr_mat).val(:,:,2), 'Offset', offsets, 'NumLevels', 8);
    glcmGradeMatrix(curr_mat,counter).B = graycomatrix(gradeImage(curr_mat).val(:,:,3), 'Offset', offsets, 'NumLevels', 8);
    glcmGradeMatrix(curr_mat,counter).Gray = graycomatrix(rgb2gray(gradeImage(curr_mat).val), 'Offset', offsets, 'NumLevels', 8);
end
%Breaks the sample image into sections as specified by the row & column
%divider


for curr_mat=1:size(gradeImage,2)
    counter = 2;
    for i=1:rowDivider
        for j=1:columnDivider
            glcmGradeMatrix(curr_mat,counter).R = graycomatrix(gradeImage(curr_mat).val((i-1)*rowSegment+1:i*rowSegment,(j-1)*columnSegment+1:j*columnSegment,1), 'Offset', offsets, 'NumLevels', 8);       
            glcmGradeMatrix(curr_mat,counter).G = graycomatrix(gradeImage(curr_mat).val((i-1)*rowSegment+1:i*rowSegment,(j-1)*columnSegment+1:j*columnSegment,2), 'Offset', offsets, 'NumLevels', 8);
            glcmGradeMatrix(curr_mat,counter).B = graycomatrix(gradeImage(curr_mat).val((i-1)*rowSegment+1:i*rowSegment,(j-1)*columnSegment+1:j*columnSegment,3), 'Offset', offsets, 'NumLevels', 8);
            glcmGradeMatrix(curr_mat,counter).Gray = graycomatrix(rgb2gray(gradeImage(curr_mat).val((i-1)*rowSegment+1:i*rowSegment,(j-1)*columnSegment+1:j*columnSegment,:)), 'Offset', offsets, 'NumLevels', 8);
            counter = counter + 1;
        end
    end
end

%Average the 4 matrix into 1
for curr_mat=1:size(gradeImage,2)
    for i=1:rowDivider*columnDivider+1
        glcmGradeMatrix(curr_mat,i).R = round((glcmGradeMatrix(curr_mat,i).R(:,:,1)+glcmGradeMatrix(curr_mat,i).R(:,:,2)+glcmGradeMatrix(curr_mat,i).R(:,:,3)+glcmGradeMatrix(curr_mat,i).R(:,:,4))/4);
        glcmGradeMatrix(curr_mat,i).G = round((glcmGradeMatrix(curr_mat,i).G(:,:,1)+glcmGradeMatrix(curr_mat,i).G(:,:,2)+glcmGradeMatrix(curr_mat,i).G(:,:,3)+glcmGradeMatrix(curr_mat,i).G(:,:,4))/4);
        glcmGradeMatrix(curr_mat,i).B = round((glcmGradeMatrix(curr_mat,i).B(:,:,1)+glcmGradeMatrix(curr_mat,i).B(:,:,2)+glcmGradeMatrix(curr_mat,i).B(:,:,3)+glcmGradeMatrix(curr_mat,i).B(:,:,4))/4);
        glcmGradeMatrix(curr_mat,i).Gray = round((glcmGradeMatrix(curr_mat,i).Gray(:,:,1)+glcmGradeMatrix(curr_mat,i).Gray(:,:,2)+glcmGradeMatrix(curr_mat,i).Gray(:,:,3)+glcmGradeMatrix(curr_mat,i).Gray(:,:,4))/4);       
    end    
end


%Stats Structure 1-4 channel r, 5-8 channel g, 9-12 channel b, 13-16
%channel gray stats(channel,material,sample)
for curr_mat=1:size(gradeImage,2) %number of material
    for i=1:rowDivider*columnDivider+1 %number of samples
        stats(curr_mat,i).R = graycoprops(glcmGradeMatrix(curr_mat,i).R); %R
        stats(curr_mat,i).G = graycoprops(glcmGradeMatrix(curr_mat,i).G); %G
        stats(curr_mat,i).B = graycoprops(glcmGradeMatrix(curr_mat,i).B); %B
        stats(curr_mat,i).Gray = graycoprops(glcmGradeMatrix(curr_mat,i).Gray); %Gray          
    end
end
%Boxplot info arrangement
for curr_mat=1:size(gradeImage,2)
    for sample = 1:rowDivider*columnDivider+1
    boxplotInfo.RContrast(sample,curr_mat) = stats(curr_mat,sample).R.Contrast;
    boxplotInfo.GContrast(sample,curr_mat) = stats(curr_mat,sample).G.Contrast;
    boxplotInfo.BContrast(sample,curr_mat) = stats(curr_mat,sample).B.Contrast;
    boxplotInfo.GrayContrast(sample,curr_mat) = stats(curr_mat,sample).Gray.Contrast;
    
    boxplotInfo.RCorrelation(sample,curr_mat) = stats(curr_mat,sample).R.Correlation;
    boxplotInfo.GCorrelation(sample,curr_mat) = stats(curr_mat,sample).G.Correlation;
    boxplotInfo.BCorrelation(sample,curr_mat) = stats(curr_mat,sample).B.Correlation;
    boxplotInfo.GrayCorrelation(sample,curr_mat) = stats(curr_mat,sample).Gray.Correlation;
    
    boxplotInfo.REnergy(sample,curr_mat) = stats(curr_mat,sample).R.Energy;
    boxplotInfo.GEnergy(sample,curr_mat) = stats(curr_mat,sample).G.Energy;
    boxplotInfo.BEnergy(sample,curr_mat) = stats(curr_mat,sample).B.Energy;
    boxplotInfo.GrayEnergy(sample,curr_mat) = stats(curr_mat,sample).Gray.Energy;
    
    boxplotInfo.RHomogeneity(sample,curr_mat) = stats(curr_mat,sample).R.Homogeneity;
    boxplotInfo.GHomogeneity(sample,curr_mat) = stats(curr_mat,sample).G.Homogeneity;
    boxplotInfo.BHomogeneity(sample,curr_mat) = stats(curr_mat,sample).B.Homogeneity;
    boxplotInfo.GrayHomogeneity(sample,curr_mat) = stats(curr_mat,sample).Gray.Homogeneity;
    end
end
%Calculating the statistic information mu and sigma for the sames of each
%channel

%pdfInfo(channel, material, glcm property) channel 1,2,3,4 = R,G,B,Gray
%properties contrast,correlation,energy,homogeneity = 1,2,3,4
%pdfInfo = zeros(4,size(gradeImage,2),4);
for curr_mat =1:size(gradeImage,2)
    pdfInfo(1,curr_mat,1).std = std(boxplotInfo.RContrast(:,curr_mat));
    pdfInfo(2,curr_mat,1).std = std(boxplotInfo.GContrast(:,curr_mat));
    pdfInfo(3,curr_mat,1).std = std(boxplotInfo.BContrast(:,curr_mat));
    pdfInfo(4,curr_mat,1).std = std(boxplotInfo.GrayContrast(:,curr_mat));
    
    pdfInfo(1,curr_mat,2).std = std(boxplotInfo.RCorrelation(:,curr_mat));
    pdfInfo(2,curr_mat,2).std = std(boxplotInfo.GCorrelation(:,curr_mat));
    pdfInfo(3,curr_mat,2).std = std(boxplotInfo.BCorrelation(:,curr_mat));
    pdfInfo(4,curr_mat,2).std = std(boxplotInfo.GrayCorrelation(:,curr_mat));
    
    pdfInfo(1,curr_mat,3).std = std(boxplotInfo.REnergy(:,curr_mat));
    pdfInfo(2,curr_mat,3).std = std(boxplotInfo.GEnergy(:,curr_mat));
    pdfInfo(3,curr_mat,3).std = std(boxplotInfo.BEnergy(:,curr_mat));
    pdfInfo(4,curr_mat,3).std = std(boxplotInfo.GrayEnergy(:,curr_mat));
    
    pdfInfo(1,curr_mat,4).std = std(boxplotInfo.RHomogeneity(:,curr_mat));
    pdfInfo(2,curr_mat,4).std = std(boxplotInfo.GHomogeneity(:,curr_mat));
    pdfInfo(3,curr_mat,4).std = std(boxplotInfo.BHomogeneity(:,curr_mat));
    pdfInfo(4,curr_mat,4).std = std(boxplotInfo.GrayHomogeneity(:,curr_mat));
    
    pdfInfo(1,curr_mat,1).mean = mean(boxplotInfo.RContrast(:,curr_mat));
    pdfInfo(2,curr_mat,1).mean = mean(boxplotInfo.GContrast(:,curr_mat));
    pdfInfo(3,curr_mat,1).mean = mean(boxplotInfo.BContrast(:,curr_mat));
    pdfInfo(4,curr_mat,1).mean = mean(boxplotInfo.GrayContrast(:,curr_mat));
    
    pdfInfo(1,curr_mat,2).mean = mean(boxplotInfo.RCorrelation(:,curr_mat));
    pdfInfo(2,curr_mat,2).mean = mean(boxplotInfo.GCorrelation(:,curr_mat));
    pdfInfo(3,curr_mat,2).mean = mean(boxplotInfo.BCorrelation(:,curr_mat));
    pdfInfo(4,curr_mat,2).mean = mean(boxplotInfo.GrayCorrelation(:,curr_mat));
    
    pdfInfo(1,curr_mat,3).mean = mean(boxplotInfo.REnergy(:,curr_mat));
    pdfInfo(2,curr_mat,3).mean = mean(boxplotInfo.GEnergy(:,curr_mat));
    pdfInfo(3,curr_mat,3).mean = mean(boxplotInfo.BEnergy(:,curr_mat));
    pdfInfo(4,curr_mat,3).mean = mean(boxplotInfo.GrayEnergy(:,curr_mat));
    
    pdfInfo(1,curr_mat,4).mean = mean(boxplotInfo.RHomogeneity(:,curr_mat));
    pdfInfo(2,curr_mat,4).mean = mean(boxplotInfo.GHomogeneity(:,curr_mat));
    pdfInfo(3,curr_mat,4).mean = mean(boxplotInfo.BHomogeneity(:,curr_mat));
    pdfInfo(4,curr_mat,4).mean = mean(boxplotInfo.GrayHomogeneity(:,curr_mat));
end
save glcmData.mat
keyboard
normpdf
%Boxplotting the features
figure(1)
subplot(4,1,1);
boxplot(boxplotInfo.RContrast);
title('Contrast channel r');
subplot(4,1,2);
boxplot(boxplotInfo.GContrast);
title({'Contrast channel g'});
subplot(4,1,3);
boxplot(boxplotInfo.BContrast);
title({'Contrast channel b'});
subplot(4,1,4);
boxplot(boxplotInfo.GrayContrast);
title({'Contrast channel gray'});

figure(2)
subplot(4,1,1);
boxplot(boxplotInfo.RCorrelation);
title({'Correlation channel r'});
subplot(4,1,2);
boxplot(boxplotInfo.GCorrelation);
title({'Correlation channel g'});
subplot(4,1,3);
boxplot(boxplotInfo.BCorrelation);
title({'Correlation channel b'});
subplot(4,1,4);
boxplot(boxplotInfo.GrayCorrelation);
title({'Correlation channel gray'});

figure(3)
subplot(4,1,1);
boxplot(boxplotInfo.REnergy);
title({'Energy channel r'});
subplot(4,1,2);
boxplot(boxplotInfo.GEnergy);
title({'Energy channel g'});
subplot(4,1,3);
boxplot(boxplotInfo.BEnergy);
title({'Energy channel b'});
subplot(4,1,4);
boxplot(boxplotInfo.GrayEnergy);
title({'Energy channel gray'});

figure(4)
subplot(4,1,1);
boxplot(boxplotInfo.RHomogeneity);
title({'Homogeneity channel r'});
subplot(4,1,2);
boxplot(boxplotInfo.GHomogeneity);
title({'Homogeneity channel g'});
subplot(4,1,3);
boxplot(boxplotInfo.BHomogeneity);
title({'Homogeneity channel b'});
subplot(4,1,4);
boxplot(boxplotInfo.GrayHomogeneity);
title({'Homogeneity channel gray'});

