function cleanedImage = imageCapture(filename, fig1, fig2, fig3, fig4)

    image = liveimagejpg(filename);
    if fig1 > 0
      figure(fig1)
      imshow(image)
    end
    hist = doHist(image, fig2);
    smoothedHist = smooth(hist);
    threshold = findThresh(smoothedHist, 4, fig3);
    threshedImage = doThresh(image,threshold,0);
    cleanedImage = cleanup(threshedImage,1,1,fig4);
end