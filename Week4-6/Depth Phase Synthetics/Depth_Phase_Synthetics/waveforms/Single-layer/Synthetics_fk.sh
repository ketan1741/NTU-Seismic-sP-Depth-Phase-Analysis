#!/bin/bash
###generate the theoretical seismograms using fk
#############################
cat > model.d << EOF
simple wholespace model
ISOTROPIC
FLAT EARTH
1-D
  H(KM) VP(KM/S) VS(KM/S) RHO(GM/CC)   QP   QS  ETAP  ETAS  FREFP  FREFS
  32.000     6.3000     3.6400     2.700    0.0    0.0   0.0 0.0 1.0 1.0 
  00.000     8.1000     4.5000     3.500    0.0    0.0   0.0 0.0 1.0 1.0 
EOF
#####
awk 'FNR>5{print}' model.d > model.temp
H1=`awk 'FNR==1{print $1}' model.temp`
vp1=`awk 'FNR==1{print $2}' model.temp`
vs1=`awk 'FNR==1{print $3}' model.temp`
kapa1=`echo $vp1 $vs1 | awk '{print $1/$2}'`
vp2=`awk 'FNR==2{print $2}' model.temp`
vs2=`awk 'FNR==2{print $3}' model.temp`
kapa2=`echo $vp2 $vs2 | awk '{print $1/$2}'`
echo $H1 $vs1 $kapa1 > Model
echo 0 $vs2 $kapa2 >> Model
rm *.temp
###########################################################################
##Green function 
depth=10
[ -d ./Waveform ] && rm -r ./Waveform
mkdir ./Waveform
for (( i=50;i<=400;i=i+50 ))
do
##########DOUBLECOUPLE SOURCE
../fk/bin/fk.pl -MModel/$depth/k -N1024/0.05 -S2 $i
### DoubleCouple solution comes from USGS, see it from Event folder.
syn -M3.0/309/72/-172 -D0.2/0.1 -A0 -OWaveform/sP-${i}.z -GModel_${depth}/${i}.grn.0
done
rm junk*
