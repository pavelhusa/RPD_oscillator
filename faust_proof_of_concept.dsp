// Proof of concept
import("stdfaust.lib");
basePitch = hslider("pitch", 50, 1,10000, 0.001);
pulseWidth = hslider("PW", 2, 1,1000, 0.001);
numHarmonics = 8;
process = par(i, numHarmonics, (ba.pulsen(pulseWidth, numHarmonics/(i+1)*basePitch)) * checkbox("Harmonic %i") ) :> fi.lowpass(4,2000) <: co.limiter_1176_R4_mono, co.limiter_1176_R4_mono;
