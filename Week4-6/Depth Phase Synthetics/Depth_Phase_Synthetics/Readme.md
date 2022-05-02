# Sythetics for regional sP depth phase, traveltime and waveform

## For generating the sP traveltime, we use **[obspy.taup](https://docs.obspy.org/packages/obspy.taup.html)** - Ray theoretical travel times and paths.
Once you have installed the **obspy** package on your computer, you can follow the notebook script **Sythetics_sP.ipynb** in **traveltimes** folder to explore the sP traveltime change with respect to the epicentral distance and earthquake depth.

## For generating the sP waveform, we use **[FK](http://www.eas.slu.edu/People/LZhu/home.html)** - Frequency-Wavenumber (FK) synthetic seismogram package. 
To install the **fk1.3** package, you shall first install **[SAC](https://seiscode.iris.washington.edu/projects/sac)**. Then move into folder **Depth_Phase/waveforms/fk** to modify the **Makefile** with newly installed location for **SAC**. Then, recompile the **fk** package. Within the terminal, just tap:
#### **make clean**
#### **make**
Once you have installed the **fk1.3** package on your computer, then in **waveform** folder, you can follow the shell script **sythetics_fk.sh** to generate the sythetic seismic records including P, S and sP phases. To visulize the sythetic waveforms, you can follow the notebook script **Sythetics_sP.ipynb** to plot the 3-component waveforms.