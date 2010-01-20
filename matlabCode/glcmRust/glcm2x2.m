%This example creates gray level co occurence matrix for the
%difference grades of rusts as extracted from the ISO8501-1
%standard.
%The GLCM will look at 4 offsets with 45 degree change
%Plots are created to illustrate the different properties of 
%GLCM to see if it's usable for classification.
offsets = [0 1; -1 1; -1 0; -1 -1];
gradeAImage = imread('gradeA.jpg');
gradeBImage = imread('gradeB.jpg');
gradeCImage = imread('gradeC.jpg');
gradeDImage = imread('gradeD.jpg');


%Construct the 4 offset glcm for each grade
%%GradeA
glcmGradeAMatrixR(:,:,:,1) = graycomatrix(gradeAImage(:,:,1), 'Offset', offsets, 'NumLevels', 8); %whole image
glcmGradeAMatrixR(:,:,:,2) = graycomatrix(gradeAImage(1:50,1:50,1), 'Offset', offsets, 'NumLevels', 8); %1st quarter
glcmGradeAMatrixR(:,:,:,3) = graycomatrix(gradeAImage(51:100,1:50,1), 'Offset', offsets, 'NumLevels', 8); %2nd quarter
glcmGradeAMatrixR(:,:,:,4) = graycomatrix(gradeAImage(1:50,51:100,1), 'Offset', offsets, 'NumLevels', 8); %3rd quarter
glcmGradeAMatrixR(:,:,:,5) = graycomatrix(gradeAImage(51:100,51:100,1), 'Offset', offsets, 'NumLevels', 8); % 4th quarter

glcmGradeAMatrixG(:,:,:,1) = graycomatrix(gradeAImage(:,:,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixG(:,:,:,2) = graycomatrix(gradeAImage(1:50,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixG(:,:,:,3) = graycomatrix(gradeAImage(51:100,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixG(:,:,:,4) = graycomatrix(gradeAImage(1:50,51:100,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixG(:,:,:,5) = graycomatrix(gradeAImage(51:100,51:100,2), 'Offset', offsets, 'NumLevels', 8);

glcmGradeAMatrixB(:,:,:,1) = graycomatrix(gradeAImage(:,:,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixB(:,:,:,2) = graycomatrix(gradeAImage(1:50,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixB(:,:,:,3) = graycomatrix(gradeAImage(51:100,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixB(:,:,:,4) = graycomatrix(gradeAImage(1:50,51:100,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixB(:,:,:,5) = graycomatrix(gradeAImage(51:100,51:100,3), 'Offset', offsets, 'NumLevels', 8);

x = rgb2gray(gradeAImage);
glcmGradeAMatrixGray(:,:,:,1) = graycomatrix(rgb2gray(gradeAImage), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixGray(:,:,:,2) = graycomatrix(x(1:50,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixGray(:,:,:,3) = graycomatrix(x(51:100,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixGray(:,:,:,4) = graycomatrix(x(1:50,51:100), 'Offset', offsets, 'NumLevels', 8);
glcmGradeAMatrixGray(:,:,:,5) = graycomatrix(x(51:100,51:100), 'Offset', offsets, 'NumLevels', 8);

%%GradeB
glcmGradeBMatrixR(:,:,:,1) = graycomatrix(gradeBImage(:,:,1), 'Offset', offsets, 'NumLevels', 8); %whole image
glcmGradeBMatrixR(:,:,:,2) = graycomatrix(gradeBImage(1:50,1:50,1), 'Offset', offsets, 'NumLevels', 8); %1st quarter
glcmGradeBMatrixR(:,:,:,3) = graycomatrix(gradeBImage(51:100,1:50,1), 'Offset', offsets, 'NumLevels', 8); %2nd quarter
glcmGradeBMatrixR(:,:,:,4) = graycomatrix(gradeBImage(1:50,51:100,1), 'Offset', offsets, 'NumLevels', 8); %3rd quarter
glcmGradeBMatrixR(:,:,:,5) = graycomatrix(gradeBImage(51:100,51:100,1), 'Offset', offsets, 'NumLevels', 8); % 4th quarter

glcmGradeBMatrixG(:,:,:,1) = graycomatrix(gradeBImage(:,:,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixG(:,:,:,2) = graycomatrix(gradeBImage(1:50,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixG(:,:,:,3) = graycomatrix(gradeBImage(51:100,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixG(:,:,:,4) = graycomatrix(gradeBImage(1:50,51:100,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixG(:,:,:,5) = graycomatrix(gradeBImage(51:100,51:100,2), 'Offset', offsets, 'NumLevels', 8);

glcmGradeBMatrixB(:,:,:,1) = graycomatrix(gradeBImage(:,:,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixB(:,:,:,2) = graycomatrix(gradeBImage(1:50,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixB(:,:,:,3) = graycomatrix(gradeBImage(51:100,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixB(:,:,:,4) = graycomatrix(gradeBImage(1:50,51:100,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixB(:,:,:,5) = graycomatrix(gradeBImage(51:100,51:100,3), 'Offset', offsets, 'NumLevels', 8);

x = rgb2gray(gradeBImage);
glcmGradeBMatrixGray(:,:,:,1) = graycomatrix(rgb2gray(gradeBImage), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixGray(:,:,:,2) = graycomatrix(x(1:50,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixGray(:,:,:,3) = graycomatrix(x(51:100,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixGray(:,:,:,4) = graycomatrix(x(1:50,51:100), 'Offset', offsets, 'NumLevels', 8);
glcmGradeBMatrixGray(:,:,:,5) = graycomatrix(x(51:100,51:100), 'Offset', offsets, 'NumLevels', 8);

%%GradeC
glcmGradeCMatrixR(:,:,:,1) = graycomatrix(gradeCImage(:,:,1), 'Offset', offsets, 'NumLevels', 8); %whole image
glcmGradeCMatrixR(:,:,:,2) = graycomatrix(gradeCImage(1:50,1:50,1), 'Offset', offsets, 'NumLevels', 8); %1st quarter
glcmGradeCMatrixR(:,:,:,3) = graycomatrix(gradeCImage(51:100,1:50,1), 'Offset', offsets, 'NumLevels', 8); %2nd quarter
glcmGradeCMatrixR(:,:,:,4) = graycomatrix(gradeCImage(1:50,51:100,1), 'Offset', offsets, 'NumLevels', 8); %3rd quarter
glcmGradeCMatrixR(:,:,:,5) = graycomatrix(gradeCImage(51:100,51:100,1), 'Offset', offsets, 'NumLevels', 8); % 4th quarter

glcmGradeCMatrixG(:,:,:,1) = graycomatrix(gradeCImage(:,:,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixG(:,:,:,2) = graycomatrix(gradeCImage(1:50,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixG(:,:,:,3) = graycomatrix(gradeCImage(51:100,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixG(:,:,:,4) = graycomatrix(gradeCImage(1:50,51:100,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixG(:,:,:,5) = graycomatrix(gradeCImage(51:100,51:100,2), 'Offset', offsets, 'NumLevels', 8);

glcmGradeCMatrixB(:,:,:,1) = graycomatrix(gradeCImage(:,:,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixB(:,:,:,2) = graycomatrix(gradeCImage(1:50,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixB(:,:,:,3) = graycomatrix(gradeCImage(51:100,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixB(:,:,:,4) = graycomatrix(gradeCImage(1:50,51:100,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixB(:,:,:,5) = graycomatrix(gradeCImage(51:100,51:100,3), 'Offset', offsets, 'NumLevels', 8);

x = rgb2gray(gradeCImage);
glcmGradeCMatrixGray(:,:,:,1) = graycomatrix(rgb2gray(gradeCImage), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixGray(:,:,:,2) = graycomatrix(x(1:50,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixGray(:,:,:,3) = graycomatrix(x(51:100,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixGray(:,:,:,4) = graycomatrix(x(1:50,51:100), 'Offset', offsets, 'NumLevels', 8);
glcmGradeCMatrixGray(:,:,:,5) = graycomatrix(x(51:100,51:100), 'Offset', offsets, 'NumLevels', 8);

%%GradeD
glcmGradeDMatrixR(:,:,:,1) = graycomatrix(gradeDImage(:,:,1), 'Offset', offsets, 'NumLevels', 8); %whole image
glcmGradeDMatrixR(:,:,:,2) = graycomatrix(gradeDImage(1:50,1:50,1), 'Offset', offsets, 'NumLevels', 8); %1st quarter
glcmGradeDMatrixR(:,:,:,3) = graycomatrix(gradeDImage(51:100,1:50,1), 'Offset', offsets, 'NumLevels', 8); %2nd quarter
glcmGradeDMatrixR(:,:,:,4) = graycomatrix(gradeDImage(1:50,51:100,1), 'Offset', offsets, 'NumLevels', 8); %3rd quarter
glcmGradeDMatrixR(:,:,:,5) = graycomatrix(gradeDImage(51:100,51:100,1), 'Offset', offsets, 'NumLevels', 8); % 4th quarter

glcmGradeDMatrixG(:,:,:,1) = graycomatrix(gradeDImage(:,:,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixG(:,:,:,2) = graycomatrix(gradeDImage(1:50,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixG(:,:,:,3) = graycomatrix(gradeDImage(51:100,1:50,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixG(:,:,:,4) = graycomatrix(gradeDImage(1:50,51:100,2), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixG(:,:,:,5) = graycomatrix(gradeDImage(51:100,51:100,2), 'Offset', offsets, 'NumLevels', 8);

glcmGradeDMatrixB(:,:,:,1) = graycomatrix(gradeDImage(:,:,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixB(:,:,:,2) = graycomatrix(gradeDImage(1:50,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixB(:,:,:,3) = graycomatrix(gradeDImage(51:100,1:50,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixB(:,:,:,4) = graycomatrix(gradeDImage(1:50,51:100,3), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixB(:,:,:,5) = graycomatrix(gradeDImage(51:100,51:100,3), 'Offset', offsets, 'NumLevels', 8);

x = rgb2gray(gradeDImage);
glcmGradeDMatrixGray(:,:,:,1) = graycomatrix(rgb2gray(gradeDImage), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixGray(:,:,:,2) = graycomatrix(x(1:50,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixGray(:,:,:,3) = graycomatrix(x(51:100,1:50), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixGray(:,:,:,4) = graycomatrix(x(1:50,51:100), 'Offset', offsets, 'NumLevels', 8);
glcmGradeDMatrixGray(:,:,:,5) = graycomatrix(x(51:100,51:100), 'Offset', offsets, 'NumLevels', 8);


%keyboard


%Construct the average glcmMatrix
glcmGradeAMatrixRAverage(:,:,1) = round((glcmGradeAMatrixR(:,:,1,1)+glcmGradeAMatrixR(:,:,2,1)+glcmGradeAMatrixR(:,:,3,1)+glcmGradeAMatrixR(:,:,4,1))/4);
glcmGradeAMatrixRAverage(:,:,2) = round((glcmGradeAMatrixR(:,:,1,2)+glcmGradeAMatrixR(:,:,2,2)+glcmGradeAMatrixR(:,:,3,2)+glcmGradeAMatrixR(:,:,4,2))/4);
glcmGradeAMatrixRAverage(:,:,3) = round((glcmGradeAMatrixR(:,:,1,3)+glcmGradeAMatrixR(:,:,2,3)+glcmGradeAMatrixR(:,:,3,3)+glcmGradeAMatrixR(:,:,4,3))/4);
glcmGradeAMatrixRAverage(:,:,4) = round((glcmGradeAMatrixR(:,:,1,4)+glcmGradeAMatrixR(:,:,2,4)+glcmGradeAMatrixR(:,:,3,4)+glcmGradeAMatrixR(:,:,4,4))/4);
glcmGradeAMatrixRAverage(:,:,5) = round((glcmGradeAMatrixR(:,:,1,5)+glcmGradeAMatrixR(:,:,2,5)+glcmGradeAMatrixR(:,:,3,5)+glcmGradeAMatrixR(:,:,4,5))/4);

glcmGradeAMatrixGAverage(:,:,1) = round((glcmGradeAMatrixG(:,:,1,1)+glcmGradeAMatrixG(:,:,2,1)+glcmGradeAMatrixG(:,:,3,1)+glcmGradeAMatrixG(:,:,4,1))/4);
glcmGradeAMatrixGAverage(:,:,2) = round((glcmGradeAMatrixG(:,:,1,2)+glcmGradeAMatrixG(:,:,2,2)+glcmGradeAMatrixG(:,:,3,2)+glcmGradeAMatrixG(:,:,4,2))/4);
glcmGradeAMatrixGAverage(:,:,3) = round((glcmGradeAMatrixG(:,:,1,3)+glcmGradeAMatrixG(:,:,2,3)+glcmGradeAMatrixG(:,:,3,3)+glcmGradeAMatrixG(:,:,4,3))/4);
glcmGradeAMatrixGAverage(:,:,4) = round((glcmGradeAMatrixG(:,:,1,4)+glcmGradeAMatrixG(:,:,2,4)+glcmGradeAMatrixG(:,:,3,4)+glcmGradeAMatrixG(:,:,4,4))/4);
glcmGradeAMatrixGAverage(:,:,5) = round((glcmGradeAMatrixG(:,:,1,5)+glcmGradeAMatrixG(:,:,2,5)+glcmGradeAMatrixG(:,:,3,5)+glcmGradeAMatrixG(:,:,4,5))/4);

glcmGradeAMatrixBAverage(:,:,1) = round((glcmGradeAMatrixB(:,:,1,1)+glcmGradeAMatrixB(:,:,2,1)+glcmGradeAMatrixB(:,:,3,1)+glcmGradeAMatrixB(:,:,4,1))/4);
glcmGradeAMatrixBAverage(:,:,2) = round((glcmGradeAMatrixB(:,:,1,2)+glcmGradeAMatrixB(:,:,2,2)+glcmGradeAMatrixB(:,:,3,2)+glcmGradeAMatrixB(:,:,4,2))/4);
glcmGradeAMatrixBAverage(:,:,3) = round((glcmGradeAMatrixB(:,:,1,3)+glcmGradeAMatrixB(:,:,2,3)+glcmGradeAMatrixB(:,:,3,3)+glcmGradeAMatrixB(:,:,4,3))/4);
glcmGradeAMatrixBAverage(:,:,4) = round((glcmGradeAMatrixB(:,:,1,4)+glcmGradeAMatrixB(:,:,2,4)+glcmGradeAMatrixB(:,:,3,4)+glcmGradeAMatrixB(:,:,4,4))/4);
glcmGradeAMatrixBAverage(:,:,5) = round((glcmGradeAMatrixB(:,:,1,5)+glcmGradeAMatrixB(:,:,2,5)+glcmGradeAMatrixB(:,:,3,5)+glcmGradeAMatrixB(:,:,4,5))/4);

glcmGradeAMatrixGrayAverage(:,:,1) = round((glcmGradeAMatrixGray(:,:,1,1)+glcmGradeAMatrixGray(:,:,2,1)+glcmGradeAMatrixGray(:,:,3,1)+glcmGradeAMatrixGray(:,:,4,1))/4);
glcmGradeAMatrixGrayAverage(:,:,2) = round((glcmGradeAMatrixGray(:,:,1,2)+glcmGradeAMatrixGray(:,:,2,2)+glcmGradeAMatrixGray(:,:,3,2)+glcmGradeAMatrixGray(:,:,4,2))/4);
glcmGradeAMatrixGrayAverage(:,:,3) = round((glcmGradeAMatrixGray(:,:,1,3)+glcmGradeAMatrixGray(:,:,2,3)+glcmGradeAMatrixGray(:,:,3,3)+glcmGradeAMatrixGray(:,:,4,3))/4);
glcmGradeAMatrixGrayAverage(:,:,4) = round((glcmGradeAMatrixGray(:,:,1,4)+glcmGradeAMatrixGray(:,:,2,4)+glcmGradeAMatrixGray(:,:,3,4)+glcmGradeAMatrixGray(:,:,4,4))/4);
glcmGradeAMatrixGrayAverage(:,:,5) = round((glcmGradeAMatrixGray(:,:,1,5)+glcmGradeAMatrixGray(:,:,2,5)+glcmGradeAMatrixGray(:,:,3,5)+glcmGradeAMatrixGray(:,:,4,5))/4);

glcmGradeBMatrixRAverage(:,:,1) = round((glcmGradeBMatrixR(:,:,1,1)+glcmGradeBMatrixR(:,:,2,1)+glcmGradeBMatrixR(:,:,3,1)+glcmGradeBMatrixR(:,:,4,1))/4);
glcmGradeBMatrixRAverage(:,:,2) = round((glcmGradeBMatrixR(:,:,1,2)+glcmGradeBMatrixR(:,:,2,2)+glcmGradeBMatrixR(:,:,3,2)+glcmGradeBMatrixR(:,:,4,2))/4);
glcmGradeBMatrixRAverage(:,:,3) = round((glcmGradeBMatrixR(:,:,1,3)+glcmGradeBMatrixR(:,:,2,3)+glcmGradeBMatrixR(:,:,3,3)+glcmGradeBMatrixR(:,:,4,3))/4);
glcmGradeBMatrixRAverage(:,:,4) = round((glcmGradeBMatrixR(:,:,1,4)+glcmGradeBMatrixR(:,:,2,4)+glcmGradeBMatrixR(:,:,3,4)+glcmGradeBMatrixR(:,:,4,4))/4);
glcmGradeBMatrixRAverage(:,:,5) = round((glcmGradeBMatrixR(:,:,1,5)+glcmGradeBMatrixR(:,:,2,5)+glcmGradeBMatrixR(:,:,3,5)+glcmGradeBMatrixR(:,:,4,5))/4);

glcmGradeBMatrixGAverage(:,:,1) = round((glcmGradeBMatrixG(:,:,1,1)+glcmGradeBMatrixG(:,:,2,1)+glcmGradeBMatrixG(:,:,3,1)+glcmGradeBMatrixG(:,:,4,1))/4);
glcmGradeBMatrixGAverage(:,:,2) = round((glcmGradeBMatrixG(:,:,1,2)+glcmGradeBMatrixG(:,:,2,2)+glcmGradeBMatrixG(:,:,3,2)+glcmGradeBMatrixG(:,:,4,2))/4);
glcmGradeBMatrixGAverage(:,:,3) = round((glcmGradeBMatrixG(:,:,1,3)+glcmGradeBMatrixG(:,:,2,3)+glcmGradeBMatrixG(:,:,3,3)+glcmGradeBMatrixG(:,:,4,3))/4);
glcmGradeBMatrixGAverage(:,:,4) = round((glcmGradeBMatrixG(:,:,1,4)+glcmGradeBMatrixG(:,:,2,4)+glcmGradeBMatrixG(:,:,3,4)+glcmGradeBMatrixG(:,:,4,4))/4);
glcmGradeBMatrixGAverage(:,:,5) = round((glcmGradeBMatrixG(:,:,1,5)+glcmGradeBMatrixG(:,:,2,5)+glcmGradeBMatrixG(:,:,3,5)+glcmGradeBMatrixG(:,:,4,5))/4);

glcmGradeBMatrixBAverage(:,:,1) = round((glcmGradeBMatrixB(:,:,1,1)+glcmGradeBMatrixB(:,:,2,1)+glcmGradeBMatrixB(:,:,3,1)+glcmGradeBMatrixB(:,:,4,1))/4);
glcmGradeBMatrixBAverage(:,:,2) = round((glcmGradeBMatrixB(:,:,1,2)+glcmGradeBMatrixB(:,:,2,2)+glcmGradeBMatrixB(:,:,3,2)+glcmGradeBMatrixB(:,:,4,2))/4);
glcmGradeBMatrixBAverage(:,:,3) = round((glcmGradeBMatrixB(:,:,1,3)+glcmGradeBMatrixB(:,:,2,3)+glcmGradeBMatrixB(:,:,3,3)+glcmGradeBMatrixB(:,:,4,3))/4);
glcmGradeBMatrixBAverage(:,:,4) = round((glcmGradeBMatrixB(:,:,1,4)+glcmGradeBMatrixB(:,:,2,4)+glcmGradeBMatrixB(:,:,3,4)+glcmGradeBMatrixB(:,:,4,4))/4);
glcmGradeBMatrixBAverage(:,:,5) = round((glcmGradeBMatrixB(:,:,1,5)+glcmGradeBMatrixB(:,:,2,5)+glcmGradeBMatrixB(:,:,3,5)+glcmGradeBMatrixB(:,:,4,5))/4);

glcmGradeBMatrixGrayAverage(:,:,1) = round((glcmGradeBMatrixGray(:,:,1,1)+glcmGradeBMatrixGray(:,:,2,1)+glcmGradeBMatrixGray(:,:,3,1)+glcmGradeBMatrixGray(:,:,4,1))/4);
glcmGradeBMatrixGrayAverage(:,:,2) = round((glcmGradeBMatrixGray(:,:,1,2)+glcmGradeBMatrixGray(:,:,2,2)+glcmGradeBMatrixGray(:,:,3,2)+glcmGradeBMatrixGray(:,:,4,2))/4);
glcmGradeBMatrixGrayAverage(:,:,3) = round((glcmGradeBMatrixGray(:,:,1,3)+glcmGradeBMatrixGray(:,:,2,3)+glcmGradeBMatrixGray(:,:,3,3)+glcmGradeBMatrixGray(:,:,4,3))/4);
glcmGradeBMatrixGrayAverage(:,:,4) = round((glcmGradeBMatrixGray(:,:,1,4)+glcmGradeBMatrixGray(:,:,2,4)+glcmGradeBMatrixGray(:,:,3,4)+glcmGradeBMatrixGray(:,:,4,4))/4);
glcmGradeBMatrixGrayAverage(:,:,5) = round((glcmGradeBMatrixGray(:,:,1,5)+glcmGradeBMatrixGray(:,:,2,5)+glcmGradeBMatrixGray(:,:,3,5)+glcmGradeBMatrixGray(:,:,4,5))/4);

glcmGradeCMatrixRAverage(:,:,1) = round((glcmGradeCMatrixR(:,:,1,1)+glcmGradeCMatrixR(:,:,2,1)+glcmGradeCMatrixR(:,:,3,1)+glcmGradeCMatrixR(:,:,4,1))/4);
glcmGradeCMatrixRAverage(:,:,2) = round((glcmGradeCMatrixR(:,:,1,2)+glcmGradeCMatrixR(:,:,2,2)+glcmGradeCMatrixR(:,:,3,2)+glcmGradeCMatrixR(:,:,4,2))/4);
glcmGradeCMatrixRAverage(:,:,3) = round((glcmGradeCMatrixR(:,:,1,3)+glcmGradeCMatrixR(:,:,2,3)+glcmGradeCMatrixR(:,:,3,3)+glcmGradeCMatrixR(:,:,4,3))/4);
glcmGradeCMatrixRAverage(:,:,4) = round((glcmGradeCMatrixR(:,:,1,4)+glcmGradeCMatrixR(:,:,2,4)+glcmGradeCMatrixR(:,:,3,4)+glcmGradeCMatrixR(:,:,4,4))/4);
glcmGradeCMatrixRAverage(:,:,5) = round((glcmGradeCMatrixR(:,:,1,5)+glcmGradeCMatrixR(:,:,2,5)+glcmGradeCMatrixR(:,:,3,5)+glcmGradeCMatrixR(:,:,4,5))/4);

glcmGradeCMatrixGAverage(:,:,1) = round((glcmGradeCMatrixG(:,:,1,1)+glcmGradeCMatrixG(:,:,2,1)+glcmGradeCMatrixG(:,:,3,1)+glcmGradeCMatrixG(:,:,4,1))/4);
glcmGradeCMatrixGAverage(:,:,2) = round((glcmGradeCMatrixG(:,:,1,2)+glcmGradeCMatrixG(:,:,2,2)+glcmGradeCMatrixG(:,:,3,2)+glcmGradeCMatrixG(:,:,4,2))/4);
glcmGradeCMatrixGAverage(:,:,3) = round((glcmGradeCMatrixG(:,:,1,3)+glcmGradeCMatrixG(:,:,2,3)+glcmGradeCMatrixG(:,:,3,3)+glcmGradeCMatrixG(:,:,4,3))/4);
glcmGradeCMatrixGAverage(:,:,4) = round((glcmGradeCMatrixG(:,:,1,4)+glcmGradeCMatrixG(:,:,2,4)+glcmGradeCMatrixG(:,:,3,4)+glcmGradeCMatrixG(:,:,4,4))/4);
glcmGradeCMatrixGAverage(:,:,5) = round((glcmGradeCMatrixG(:,:,1,5)+glcmGradeCMatrixG(:,:,2,5)+glcmGradeCMatrixG(:,:,3,5)+glcmGradeCMatrixG(:,:,4,5))/4);

glcmGradeCMatrixBAverage(:,:,1) = round((glcmGradeCMatrixB(:,:,1,1)+glcmGradeCMatrixB(:,:,2,1)+glcmGradeCMatrixB(:,:,3,1)+glcmGradeCMatrixB(:,:,4,1))/4);
glcmGradeCMatrixBAverage(:,:,2) = round((glcmGradeCMatrixB(:,:,1,2)+glcmGradeCMatrixB(:,:,2,2)+glcmGradeCMatrixB(:,:,3,2)+glcmGradeCMatrixB(:,:,4,2))/4);
glcmGradeCMatrixBAverage(:,:,3) = round((glcmGradeCMatrixB(:,:,1,3)+glcmGradeCMatrixB(:,:,2,3)+glcmGradeCMatrixB(:,:,3,3)+glcmGradeCMatrixB(:,:,4,3))/4);
glcmGradeCMatrixBAverage(:,:,4) = round((glcmGradeCMatrixB(:,:,1,4)+glcmGradeCMatrixB(:,:,2,4)+glcmGradeCMatrixB(:,:,3,4)+glcmGradeCMatrixB(:,:,4,4))/4);
glcmGradeCMatrixBAverage(:,:,5) = round((glcmGradeCMatrixB(:,:,1,5)+glcmGradeCMatrixB(:,:,2,5)+glcmGradeCMatrixB(:,:,3,5)+glcmGradeCMatrixB(:,:,4,5))/4);

glcmGradeCMatrixGrayAverage(:,:,1) = round((glcmGradeCMatrixGray(:,:,1,1)+glcmGradeCMatrixGray(:,:,2,1)+glcmGradeCMatrixGray(:,:,3,1)+glcmGradeCMatrixGray(:,:,4,1))/4);
glcmGradeCMatrixGrayAverage(:,:,2) = round((glcmGradeCMatrixGray(:,:,1,2)+glcmGradeCMatrixGray(:,:,2,2)+glcmGradeCMatrixGray(:,:,3,2)+glcmGradeCMatrixGray(:,:,4,2))/4);
glcmGradeCMatrixGrayAverage(:,:,3) = round((glcmGradeCMatrixGray(:,:,1,3)+glcmGradeCMatrixGray(:,:,2,3)+glcmGradeCMatrixGray(:,:,3,3)+glcmGradeCMatrixGray(:,:,4,3))/4);
glcmGradeCMatrixGrayAverage(:,:,4) = round((glcmGradeCMatrixGray(:,:,1,4)+glcmGradeCMatrixGray(:,:,2,4)+glcmGradeCMatrixGray(:,:,3,4)+glcmGradeCMatrixGray(:,:,4,4))/4);
glcmGradeCMatrixGrayAverage(:,:,5) = round((glcmGradeCMatrixGray(:,:,1,5)+glcmGradeCMatrixGray(:,:,2,5)+glcmGradeCMatrixGray(:,:,3,5)+glcmGradeCMatrixGray(:,:,4,5))/4);

glcmGradeDMatrixRAverage(:,:,1) = round((glcmGradeDMatrixR(:,:,1,1)+glcmGradeDMatrixR(:,:,2,1)+glcmGradeDMatrixR(:,:,3,1)+glcmGradeDMatrixR(:,:,4,1))/4);
glcmGradeDMatrixRAverage(:,:,2) = round((glcmGradeDMatrixR(:,:,1,2)+glcmGradeDMatrixR(:,:,2,2)+glcmGradeDMatrixR(:,:,3,2)+glcmGradeDMatrixR(:,:,4,2))/4);
glcmGradeDMatrixRAverage(:,:,3) = round((glcmGradeDMatrixR(:,:,1,3)+glcmGradeDMatrixR(:,:,2,3)+glcmGradeDMatrixR(:,:,3,3)+glcmGradeDMatrixR(:,:,4,3))/4);
glcmGradeDMatrixRAverage(:,:,4) = round((glcmGradeDMatrixR(:,:,1,4)+glcmGradeDMatrixR(:,:,2,4)+glcmGradeDMatrixR(:,:,3,4)+glcmGradeDMatrixR(:,:,4,4))/4);
glcmGradeDMatrixRAverage(:,:,5) = round((glcmGradeDMatrixR(:,:,1,5)+glcmGradeDMatrixR(:,:,2,5)+glcmGradeDMatrixR(:,:,3,5)+glcmGradeDMatrixR(:,:,4,5))/4);

glcmGradeDMatrixGAverage(:,:,1) = round((glcmGradeDMatrixG(:,:,1,1)+glcmGradeDMatrixG(:,:,2,1)+glcmGradeDMatrixG(:,:,3,1)+glcmGradeDMatrixG(:,:,4,1))/4);
glcmGradeDMatrixGAverage(:,:,2) = round((glcmGradeDMatrixG(:,:,1,2)+glcmGradeDMatrixG(:,:,2,2)+glcmGradeDMatrixG(:,:,3,2)+glcmGradeDMatrixG(:,:,4,2))/4);
glcmGradeDMatrixGAverage(:,:,3) = round((glcmGradeDMatrixG(:,:,1,3)+glcmGradeDMatrixG(:,:,2,3)+glcmGradeDMatrixG(:,:,3,3)+glcmGradeDMatrixG(:,:,4,3))/4);
glcmGradeDMatrixGAverage(:,:,4) = round((glcmGradeDMatrixG(:,:,1,4)+glcmGradeDMatrixG(:,:,2,4)+glcmGradeDMatrixG(:,:,3,4)+glcmGradeDMatrixG(:,:,4,4))/4);
glcmGradeDMatrixGAverage(:,:,5) = round((glcmGradeDMatrixG(:,:,1,5)+glcmGradeDMatrixG(:,:,2,5)+glcmGradeDMatrixG(:,:,3,5)+glcmGradeDMatrixG(:,:,4,5))/4);

glcmGradeDMatrixBAverage(:,:,1) = round((glcmGradeDMatrixB(:,:,1,1)+glcmGradeDMatrixB(:,:,2,1)+glcmGradeDMatrixB(:,:,3,1)+glcmGradeDMatrixB(:,:,4,1))/4);
glcmGradeDMatrixBAverage(:,:,2) = round((glcmGradeDMatrixB(:,:,1,2)+glcmGradeDMatrixB(:,:,2,2)+glcmGradeDMatrixB(:,:,3,2)+glcmGradeDMatrixB(:,:,4,2))/4);
glcmGradeDMatrixBAverage(:,:,3) = round((glcmGradeDMatrixB(:,:,1,3)+glcmGradeDMatrixB(:,:,2,3)+glcmGradeDMatrixB(:,:,3,3)+glcmGradeDMatrixB(:,:,4,3))/4);
glcmGradeDMatrixBAverage(:,:,4) = round((glcmGradeDMatrixB(:,:,1,4)+glcmGradeDMatrixB(:,:,2,4)+glcmGradeDMatrixB(:,:,3,4)+glcmGradeDMatrixB(:,:,4,4))/4);
glcmGradeDMatrixBAverage(:,:,5) = round((glcmGradeDMatrixB(:,:,1,5)+glcmGradeDMatrixB(:,:,2,5)+glcmGradeDMatrixB(:,:,3,5)+glcmGradeDMatrixB(:,:,4,5))/4);

glcmGradeDMatrixGrayAverage(:,:,1) = round((glcmGradeDMatrixGray(:,:,1,1)+glcmGradeDMatrixGray(:,:,2,1)+glcmGradeDMatrixGray(:,:,3,1)+glcmGradeDMatrixGray(:,:,4,1))/4);
glcmGradeDMatrixGrayAverage(:,:,2) = round((glcmGradeDMatrixGray(:,:,1,2)+glcmGradeDMatrixGray(:,:,2,2)+glcmGradeDMatrixGray(:,:,3,2)+glcmGradeDMatrixGray(:,:,4,2))/4);
glcmGradeDMatrixGrayAverage(:,:,3) = round((glcmGradeDMatrixGray(:,:,1,3)+glcmGradeDMatrixGray(:,:,2,3)+glcmGradeDMatrixGray(:,:,3,3)+glcmGradeDMatrixGray(:,:,4,3))/4);
glcmGradeDMatrixGrayAverage(:,:,4) = round((glcmGradeDMatrixGray(:,:,1,4)+glcmGradeDMatrixGray(:,:,2,4)+glcmGradeDMatrixGray(:,:,3,4)+glcmGradeDMatrixGray(:,:,4,4))/4);
glcmGradeDMatrixGrayAverage(:,:,5) = round((glcmGradeDMatrixGray(:,:,1,5)+glcmGradeDMatrixGray(:,:,2,5)+glcmGradeDMatrixGray(:,:,3,5)+glcmGradeDMatrixGray(:,:,4,5))/4);


%Stats Structure 1-4 channel r, 5-8 channel g, 9-12 channel b, 13-16
%channel gray
for i=1:5
    stats(1,i) = graycoprops(glcmGradeAMatrixRAverage(:,:,i));
    stats(2,i) = graycoprops(glcmGradeBMatrixRAverage(:,:,i));
    stats(3,i) = graycoprops(glcmGradeCMatrixRAverage(:,:,i));
    stats(4,i) = graycoprops(glcmGradeDMatrixRAverage(:,:,i));

    stats(5,i) = graycoprops(glcmGradeAMatrixGAverage(:,:,i));
    stats(6,i) = graycoprops(glcmGradeBMatrixGAverage(:,:,i));
    stats(7,i) = graycoprops(glcmGradeCMatrixGAverage(:,:,i));
    stats(8,i) = graycoprops(glcmGradeDMatrixGAverage(:,:,i));

    stats(9,i) = graycoprops(glcmGradeAMatrixBAverage(:,:,i));
    stats(10,i) = graycoprops(glcmGradeBMatrixBAverage(:,:,i));
    stats(11,i) = graycoprops(glcmGradeCMatrixBAverage(:,:,i));
    stats(12,i) = graycoprops(glcmGradeDMatrixBAverage(:,:,i));

    stats(13,i) = graycoprops(glcmGradeAMatrixGrayAverage(:,:,i));
    stats(14,i) = graycoprops(glcmGradeBMatrixGrayAverage(:,:,i));
    stats(15,i) = graycoprops(glcmGradeCMatrixGrayAverage(:,:,i));
    stats(16,i) = graycoprops(glcmGradeDMatrixGrayAverage(:,:,i));    
end

%Plotting the data
figure(1);
for i=1:4
    for j=1:5
        subplot(4,1,1);
        hold on;
        title({'Contrast channel r'});
        if j == 1
            scatter(i,stats(i,j).Contrast,4,'b')
        else
            scatter(i,stats(i,j).Contrast,4,'r')
        end        
        subplot(4,1,2);
        hold on;
        title({'Contrast channel g'});
        if j == 1            
            scatter(i,stats(i+4,j).Contrast,4,'b')
        else
            scatter(i,stats(i+4,j).Contrast,4,'r')
        end
        subplot(4,1,3);
        hold on;
        title({'Contrast channel b'});
        if j == 1
            scatter(i,stats(i+8,j).Contrast,4,'b')
        else
            scatter(i,stats(i+8,j).Contrast,4,'r')
        end
        subplot(4,1,4);
        hold on;
        title({'Contrast channel gray'});
        if j == 1
            scatter(i,stats(i+8,j).Contrast,4,'b')
        else
            scatter(i,stats(i+8,j).Contrast,4,'r')
        end
    end
end

figure(2);
for i=1:4
    for j=1:5
        subplot(4,1,1);
        hold on;
        title({'Correlation channel r'});
        if j == 1
            scatter(i,stats(i,j).Correlation,4,'b')
        else
            scatter(i,stats(i,j).Correlation,4,'r')
        end        
        subplot(4,1,2);
        hold on;
        title({'Correlation channel g'});
        if j == 1            
            scatter(i,stats(i+4,j).Correlation,4,'b')
        else
            scatter(i,stats(i+4,j).Correlation,4,'r')
        end
        subplot(4,1,3);
        hold on;
        title({'Correlation channel b'});
        if j == 1
            scatter(i,stats(i+8,j).Correlation,4,'b')
        else
            scatter(i,stats(i+8,j).Correlation,4,'r')
        end
        subplot(4,1,4);
        hold on;
        title({'Correlation channel gray'});
        if j == 1
            scatter(i,stats(i+8,j).Correlation,4,'b')
        else
            scatter(i,stats(i+8,j).Correlation,4,'r')
        end
    end
end

figure(3);
for i=1:4
    for j=1:5
        subplot(4,1,1);
        hold on;
        title({'Energy channel r'});
        if j == 1
            scatter(i,stats(i,j).Energy,4,'b')
        else
            scatter(i,stats(i,j).Energy,4,'r')
        end        
        subplot(4,1,2);
        hold on;
        title({'Energy channel g'});
        if j == 1            
            scatter(i,stats(i+4,j).Energy,4,'b')
        else
            scatter(i,stats(i+4,j).Energy,4,'r')
        end
        subplot(4,1,3);
        hold on;
        title({'Energy channel b'});
        if j == 1
            scatter(i,stats(i+8,j).Energy,4,'b')
        else
            scatter(i,stats(i+8,j).Energy,4,'r')
        end
        subplot(4,1,4);
        hold on;
        title({'Energy channel gray'});
        if j == 1
            scatter(i,stats(i+8,j).Energy,4,'b')
        else
            scatter(i,stats(i+8,j).Energy,4,'r')
        end
    end
end

figure(4);
for i=1:4
    for j=1:5
        subplot(4,1,1);
        hold on;
        title({'Homogeneity channel r'});
        if j == 1
            scatter(i,stats(i,j).Homogeneity,4,'b')
        else
            scatter(i,stats(i,j).Homogeneity,4,'r')
        end        
        subplot(4,1,2);
        hold on;
        title({'Homogeneity channel g'});
        if j == 1            
            scatter(i,stats(i+4,j).Homogeneity,4,'b')
        else
            scatter(i,stats(i+4,j).Homogeneity,4,'r')
        end
        subplot(4,1,3);
        hold on;
        title({'Homogeneity channel b'});
        if j == 1
            scatter(i,stats(i+8,j).Homogeneity,4,'b')
        else
            scatter(i,stats(i+8,j).Homogeneity,4,'r')
        end
        subplot(4,1,4);
        hold on;
        title({'Homogeneity channel gray'});
        if j == 1
            scatter(i,stats(i+8,j).Homogeneity,4,'b')
        else
            scatter(i,stats(i+8,j).Homogeneity,4,'r')
        end
    end
end

keyboard
