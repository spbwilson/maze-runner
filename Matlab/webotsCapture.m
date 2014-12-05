function threshBots = webotsCapture(filename, fig1, fig2, fig3, fig4)

    take_snap();
    
    pause(1)
    
    image = importdata([filename, '.ppm'], 'ppm');
       
    if fig1 > 0
      figure(fig1)
      imshow(image)
    end
    
    hist = doHist(image, fig2);
    smoothedHist = smooth(hist);
    threshold = findThresh(smoothedHist, 4, fig3);
    image = myrgb2gray(image);
    threshBots = doThresh(image,threshold,fig4);  
end