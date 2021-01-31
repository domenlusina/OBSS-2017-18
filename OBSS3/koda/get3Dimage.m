function [ images3D ] = get3Dimage( folder_path )
    %'H:\OBSS\OBSS3\CTMRI\Images-Patient-002824-01\1.2.840.113747.1134576325.3260.2824.811679136118.0\3'
    imds = imageDatastore(folder_path,'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
    noImages = length(imds.Files);
    I = imread(char(imds.Files(1)));
    [h,w] = size(I);
    images3D= zeros(h,w,noImages);
    
    parfor i= 1:noImages
        I = imread(char(imds.Files(i)));
        images3D(:,:,i) = Canny( I, 0.0063  ,  0.0156 );
    end
    
    
end

