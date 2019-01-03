close all; clear;

map = double( dicomread('50657_12\i596342.MRDC.1') );
figure; imshow(map,[ ]);

kspace = fftshift( fft2(map) );
figure; imshow( abs(kspace),[ ] ); imcontrast;

kspace_extract = zeros(128,256);
for i = 1:128
    
    kspace_extract(i,:) = kspace( (2*i),: );
    
end
figure; imshow( abs(kspace_extract),[ ] ); imcontrast;

kspace_interp = imresize(kspace_extract,[256 256]);
figure; imshow( abs(kspace_interp),[ ] ); imcontrast;

map_interp = ifft2( kspace_interp );
figure; imshow( abs(map_interp),[ ] );