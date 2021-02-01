

[ images3D ] = get3Dimage( 'H:\OBSS\OBSS3\CTMRI\Images-Patient-002824-01\1.2.840.113747.1134576325.3260.2824.811679136118.0\3' );
figure();
imshow3D(images3D);

newImages3D=images3D;
parfor i=1:size(newImages3D,3)-1
    newImages3D(:,:,i) = connectivity24( images3D(:,:,i),images3D(:,:,i+1));   
end

figure();
imshow3D(newImages3D);