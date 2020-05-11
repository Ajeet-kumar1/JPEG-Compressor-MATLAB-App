A MATLAB app which can compress an JPEG with Discrete Cosine Transform Matrix of Image.
The Discrete Cosine Transform (DCT)
  The discrete cosine transform (DCT) helps separate the image into parts (or spectral sub-bands) of differing importance (with respect to the image's visual quality). The DCT is similar to the discrete Fourier transform: it transforms a signal or image from the spatial domain to the frequency domain (Fig 7.8).


DCT Encoding

The general equation for a 1D (N data items) DCT is defined by the following equation:
\begin{displaymath}
F(u) = \left(\frac{2}{N}\right)^{\frac{1}{2}} \sum_{i=0}^{N-1}
\Lambda(i).cos\left[
\frac{\pi.u}{2.N}(2i+1)
\right]f(i)\end{displaymath}

and the corresponding inverse 1D DCT transform is simple F-1(u), i.e.:

where

\begin{displaymath}
\Lambda(i) = \left\{ \begin{array}
{ll} \frac{1}{\sqrt{2}} & {\rm
for}
\xi = 0\ 1 & {\rm otherwise}\end{array} \right.\end{displaymath}

The general equation for a 2D (N by M image) DCT is defined by the following equation:

\begin{displaymath}
F(u,v) = \left(\frac{2}{N}\right)^{\frac{1}{2}}
\left(\frac{...
 ...}(2i+1)
\right]cos\left[ \frac{\pi.v}{2.M}(2j+1) \right].f(i,j)\end{displaymath}

and the corresponding inverse 2D DCT transform is simple F-1(u,v), i.e.:

where

\begin{displaymath}
\Lambda(\xi) = \left\{ \begin{array}
{ll} \frac{1}{\sqrt{2}} & {\rm
for}
\xi = 0 \ 1 & {\rm otherwise}\end{array} \right.\end{displaymath}

The basic operation of the DCT is as follows:

The input image is N by M;
f(i,j) is the intensity of the pixel in row i and column j;
F(u,v) is the DCT coefficient in row k1 and column k2 of the DCT matrix.
For most images, much of the signal energy lies at low frequencies; these appear in the upper left corner of the DCT.
Compression is achieved since the lower right values represent higher frequencies, and are often small - small enough to be neglected with little visible distortion.
The DCT input is an 8 by 8 array of integers. This array contains each pixel's gray scale level;
8 bit pixels have levels from 0 to 255.
Therefore an 8 point DCT would be:
where

\begin{displaymath}
\Lambda(\xi) = \left\{ \begin{array}
{ll} \frac{1}{\sqrt{2}} & {\rm
for}
\xi = 0 \ 1 & {\rm otherwise}\end{array} \right.\end{displaymath}
