A MATLAB app which can compress an image with Discrete Cosine Transform Matrix of Image.
A discrete cosine transform (DCT) expresses a finite sequence of data points in terms of a sum of cosine functions oscillating at different frequencies. The DCT, first proposed by Nasir Ahmed in 1972, is a widely used transformation technique in signal processing and data compression. It is used in most digital media, including digital images (such as JPEG and HEIF, where small high-frequency components can be discarded), digital video (such as MPEG and H.26x), digital audio (such as Dolby Digital, MP3 and AAC), digital television (such as SDTV, HDTV and VOD), digital radio (such as AAC+ and DAB+), and speech coding (such as AAC-LD, Siren and Opus). DCTs are also important to numerous other applications in science and engineering, such as digital signal processing, communications devices, reducing network bandwidth usage, and spectral methods for the numerical solution of partial differential equations.

The use of cosine rather than sine functions is critical for compression, since it turns out (as described below) that fewer cosine functions are needed to approximate a typical signal, whereas for differential equations the cosines express a particular choice of boundary conditions. In particular, a DCT is a Fourier-related transform similar to the discrete Fourier transform (DFT), but using only real numbers. The DCTs are generally related to Fourier Series coefficients of a periodically and symmetrically extended sequence whereas DFTs are related to Fourier Series coefficients of a periodically extended sequence. DCTs are equivalent to DFTs of roughly twice the length, operating on real data with even symmetry (since the Fourier transform of a real and even function is real and even), whereas in some variants the input and/or output data are shifted by half a sample. There are eight standard DCT variants, of which four are common.

The most common variant of discrete cosine transform is the type-II DCT, which is often called simply "the DCT". This was the original DCT as first proposed by Ahmed. Its inverse, the type-III DCT, is correspondingly often called simply "the inverse DCT" or "the IDCT". Two related transforms are the discrete sine transform (DST), which is equivalent to a DFT of real and odd functions, and the modified discrete cosine transform (MDCT), which is based on a DCT of overlapping data. Multidimensional DCTs (MD DCTs) are developed to extend the concept of DCT on MD signals. There are several algorithms to compute MD DCT. A variety of fast algorithms have been developed to reduce the computational complexity of implementing DCT. One of these is the integer DCT[1] (IntDCT), an integer approximation of the standard DCT,[2] used in several ISO/IEC and ITU-T international standards.[2][1]

DCT compression, also known as block compression, compresses data in sets of discrete DCT blocks.[3] DCT blocks can have a number of sizes, including 8x8 pixels for the standard DCT, and varied integer DCT sizes between 4x4 and 32x32 pixels.[1][4] The DCT has a strong "energy compaction" property,[5][6] capable of achieving high quality at high data compression ratios.[7][8] However, blocky compression artifacts can appear when heavy DCT compression is applied


# Steps
1. [Installation](https://in.mathworks.com/help/install/install-products.html)
2. [Install tollbox](https://in.mathworks.com/products/image.html)
3. [Store the test image in working directory](#store-the-test-image-in-working-directory)
4. [Write the DCT code](https://github.com/Ajeet-kumar1/JPEG-Compressor-MATLAB-App/blob/master/Main_Code.m)

If you need GUI then write code for GUI also.

5. [UI description](#ui-description)
6. [Demonstration](#demonstration)


## Store the test image in working directory
![image](https://github.com/Ajeet-kumar1/JPEG-Compressor-MATLAB-App/blob/master/Images/Screenshot%20(47).png)

## UI description

![image](https://github.com/Ajeet-kumar1/JPEG-Compressor-MATLAB-App/blob/master/Output%20Interface.jpeg)

## Demonstration
[Click here](https://youtu.be/6zr2Pl2icmY?t=505)
