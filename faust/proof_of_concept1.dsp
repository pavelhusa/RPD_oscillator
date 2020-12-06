import("stdfaust.lib");
basePitch = hslider("pitch", 20, 1,100, 1);
pulseWidth = hslider("PW", 2, 1,1000, 1);
numHarmonics = 8;

sampleLen = ba.sec2samp(1 / ba.midikey2hz(basePitch));
pulseTrain = ba.pulse(1);
harmonicsGenerator(x) = par(i, numHarmonics, ba.resetCtr(sampleLen/(i+1), pulseWidth) * checkbox("Harmonic %i"));
process = pulseTrain <: harmonicsGenerator :> fi.lowpass(2, 1000) : _;