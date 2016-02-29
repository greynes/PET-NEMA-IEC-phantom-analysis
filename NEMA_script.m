%%NEMA PHANTOM SCRIPT
close all

%% Ratio 8:1
%Read the DICOM and get the info
sData=readDICOMdir('C:\Users\h501zgrl\Documents\MATLAB\PET_SUV\160116_NEMA_VELL\DICOM',0) ;
I=sData{2}.scan.volume ; %Phantom
pixelSize = sData{2}.scan.sliceS*2 ; %Pixel Size
%Select the correcte slice and correct for displacements
[x0,y0,z0] = deal(0.5,-2.5,0) ; %Center of the phantom. Z axis do nothing for now..
%Select the ratio Hot/Background
aH = 7.8 ; %Hot Sphere Activity
aB = 1 ; %Background Activity
ISlice= 33 ; %Slice of the center
% Call function
TResults1 = NEMA_phantom(I,ISlice,pixelSize,aH,aB,x0,y0,z0) ;
% Display results
fprintf(sprintf(['\n*** Activity ratio: ',num2str(aH/aB),' \n'])) ;
disp(TResults1) ;


%% Ratio 4:1
%Read the DICOM and get the info
sData=readDICOMdir('C:\Users\h501zgrl\Documents\MATLAB\PET_SUV\160116_NEMA_VELL\DICOM2',0) ;
I=sData{2}.scan.volume ; %Phantom
pixelSize = sData{2}.scan.sliceS*2 ; %Pixel Size
%Select the correcte slice and correct for displacements
[x0,y0,z0] = deal(0.5,-8.5,0) ; %Center of the phantom. Z axis do nothing for now..
%Select the ratio Hot/Background
aH = 3.6 ; %Hot Sphere Activity
aB = 1 ; %Background Activity
ISlice= 20 ; %Slice of the center
% Call function
TResults2 = NEMA_phantom(I,ISlice,pixelSize,aH,aB,x0,y0,z0) ;
% Display results
fprintf(sprintf(['\n*** Activity ratio: ',num2str(aH/aB),' \n'])) ;
disp(TResults2) ;


%% Ratio 2:1
%Read the DICOM and get the info
sData=readDICOMdir('C:\Users\h501zgrl\Documents\MATLAB\PET_SUV\160116_NEMA_VELL\DICOM3',0) ;
I=sData{2}.scan.volume ; %Phantom
pixelSize = sData{2}.scan.sliceS*2 ; %Pixel Size
%Select the correcte slice and correct for displacements
[x0,y0,z0] = deal(0.3,-2.5,0) ; %Center of the phantom. Z axis do nothing for now..
%Select the ratio Hot/Background
aH = 1.4 ; %Hot Sphere Activity
aB = 1 ; %Background Activity
ISlice= 38 ; %Slice of the center
% Call function
TResults3 = NEMA_phantom(I,ISlice,pixelSize,aH,aB,x0,y0,z0) ;
% Display results
fprintf(sprintf(['\n*** Activity ratio: ',num2str(aH/aB),' \n'])) ;
disp(TResults3) ;


%% Plot differences for each concentration
res1=(TResults1(3:end-1,{'HC'})) ;
res2=(TResults2(3:end-1,{'HC'})) ;
res3=(TResults3(3:end-1,{'HC'})) ;
D = 2*[11,8.5,6.5,5] ;
figure
hold on
plot(D,res1.HC,'b--o')
plot(D,res2.HC,'b--o','Color','r')
plot(D,res3.HC,'b--o','Color',[0,0.7,0.9])
title('Hot Lesion Recovery Factor')
xlabel('Sphere Diameter')
ylabel('HC(%)')
axis([9 25 -20 100])
legend('Ratio 1:8','Ratio 1:4','Ratio 1:2')
set(gca,'Box','on','YGrid','on')
hold off