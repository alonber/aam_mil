
clear all;
dir = 'jonathan/';
img=imread('jonathan/6.JPEG');


r=img;
r(:,:,2:3)=0;
g=img;
g(:,:,1:2:3)=0;
b=img;
b(:,:,1:2)=0;

R=r(:,:,1);
G=g(:,:,2);
B=b(:,:,3);


figure(2);
subplot(1,3,1);
imshow(r);
title('R');
subplot(1,3,2);
imshow(g);
title('G');
subplot(1,3,3);
imshow(b);
title('B');


%%%%%%%%%%%%%%
clear all;
img=(imread('jonathan/11.JPEG'));


figure(2);
subplot(1,2,1);
imshow(img);
title('RGB');
subplot(1,2,2);
imshow(rgb2gray(img));
title('gray');

%%%%
clear all;
img=(imread('jonathan/12.JPEG'));
img = rgb2gray(img);
smallPic = img(200:399,350:549);
% on smallPic - change the values to the "important" part of the image


figure(3);
subplot(1,2,1);
imshow(img);
title('gray');
subplot(1,2,2);
imshow(smallPic);
title('gray-"zoom"');

m=[1 2 4 5 8 10 20 40 50];
quant=cell(1,length(m));

for y=1:length(m)
    j=m(y);
    tmpPic=smallPic;
    for i=(1:j:length(tmpPic))
        for k=(1:j:length(tmpPic))
            pixel=uint8(round(sum(sum(tmpPic(i:i+j-1,k:k+j-1)))/(j*j)));
            tmpPic(i:i+j-1,k:k+j-1)=pixel;
        end
    end
    quant(y)= mat2cell(tmpPic,length(tmpPic),length(tmpPic));
end

figure(4);
for i=1:length(quant)
    subplot(3,3,i)
    imshow(cell2mat(quant(i)));
    j=m(i);
    title([num2str(j) '*' num2str(j) ' pixels -> ONE pixel']);
end

%%%%%%%%%%%%%%%%
clear all;
img=(imread('jonathan/3.JPEG'));
img=rgb2gray(img);

newImg=uint8(255-double(img));


figure(5);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(newImg);



%%%%%%%%%%%%%%%%%%%%
clear all;
img=(imread('jonathan/6.JPEG'));
img=rgb2gray(img);

figure(5);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(edge(img));

%%%%%%%%
clear all;
orig=(imread('jonathan/2.JPEG'));

figure(7);
imshow(orig);
title('Origin');

img4=orig;
img8=orig;
quant8=repmat(32*(1:8),32,1);
quant4=repmat(64*(1:4),64,1);
quant8_2=(quant8(:))';
quant4_2=(quant4(:))';
[k,b,~]=size(img4);
for i=1:k
    for j=1:b
        img8(i,j,1)=quant8_2(1+img8(i,j,1));
        img8(i,j,2)=quant8_2(1+img8(i,j,2));
        img8(i,j,3)=quant8_2(1+img8(i,j,3));
        img4(i,j,1)=quant4_2(1+img4(i,j,1));
        img4(i,j,2)=quant4_2(1+img4(i,j,2));
        img4(i,j,3)=quant4_2(1+img4(i,j,3));
    end
end

figure(8);
subplot(1,3,1);
imshow(orig);
title('Origin');
subplot(1,3,2);
imshow(img8);
title('quantization to 8 colors per filter');
subplot(1,3,3);
imshow(img4);       
title('quantization to 4 colors per filter');
        

