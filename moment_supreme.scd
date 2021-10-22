// moment supreme

// normal tempo
t.tempo_(115/60);

~allClose.();
~allOpen.();

~momentsupreme = {
{
(
Pdef("machine".asSymbol, { Pbind(\dur, Pseq([Pseq([1], 7), Pseq([1/2], 2)], inf), \stepsPerOctave, 31, \midinote, Pseq(["d1".namemidi, "eb1".namemidi], inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;
Pdef("machineCue".asSymbol, { Pbind(\dur, Pseq([8/1], inf), \stepsPerOctave, 31, \midinote, Pseq([36], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([3], inf), \type, \midi, \midiout, m)}).play;
);
10.wait;
p.dict[0] = { PZ_layer(~sampler, 0, 0.2, ~buffers['m1'], 2, 0.8, 0.2).rhythm(1,[2],1,[2]) };
5.wait;
Pdef(\machine2, { Pbind(\dur, Pseq([1/1], inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "c2".namemidi], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0,1,2].stutter(3), inf), \type, \midi, \midiout, m)}).play;
8.wait;
p.dict[1] = { PZ_layer(~sampler, 0, 0.2, ~buffers['m4'], 2, 1, {0.rrand(0.9)} ).rhythm(1,1,1,1) };
8.wait;
Pdef(("machineSwing1").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((36..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
p.dict[2] = { PZ_layer(~sampler, 0, 0.2, ~buffers['cookies'], 2, {3.rrand(4)}, 0.65).rhythm([2,0,0,0],0,0) };
7.wait;
p.dict[3] = { PZ_layer(~oneNote, {76.rrand(91)}, 0, 0.2).rhythm([8], [0,4], 0, [0,3]) };
10.wait;
p.dict[4] = { PZ_layer(~oneNote, {36.rrand(40)}, 4, 6).rhythm(1) };
}.fork;
};

// fast tempo
t.tempo_(185/60);

// magnetron ready
{
~allClose.();
Ndef(\a, {PlayBuf.ar(2, ~buffers['cookies'].bufnum)*4}).play(0,2);
Ndef(\m0).stop(1);
Tdef(\a).stop;
Pdef.all.do{|p| p.stop; }
}.fork;

p.dict=();
