t = TempoClock.default;
t.tempo_(120/60);


// globals

~notes = (62..86);
~legato = 0.2;
~events = (notes:List.new, durs: List.new);

// tests
~f = { arg notes, dur, legato, transpose;
	Pdef(("fokker_2").asSymbol, { Pbind(\dur, Pseq(dur, inf), \stepsPerOctave, 31, \midinote, Pseq(notes, inf), \ctranspose, Pfunc{transpose}, \legato, Pfunc{legato}, \chan, Pseq([0,1,2].stutter(3), inf), \type, \midi, \midiout, m)}).play;
};


Pdef("fokker_2".asSymbol).stop;


// MIDI samples read
~path = thisProcess.nowExecutingPath.dirname ++ "/files/";
~fantasia = SimpleMIDIFile.read(~path ++ "i1.MID");

~fantasia.tempo = 70
( ~fantasia.p <> (type: \midi, midiout: m) ).play
Pdef(\fe, Ppar([( ~fantasia.p <> (type: \midi, midiout: m) )], inf) ).play;

Pdef(("fokker_b").asSymbol, { Pbind(\dur, Pseq([1], inf), \stepsPerOctave, 31, \midinote, Pseq(["d1".namecps, "f1".namecps]/2, inf), \ctranspose,0, \legato, 1, \chan, Pseq([4], inf), \type, \midi, \midiout, m)}).play;

a = ~fantasia.generatePatternSeqs;

a.collect{|e|
	~events['notes'].add(e[0]);
	~events['durs'].add(e[1]);
};

~f.(~notes, [1/4], 0.2, 0);


Pdef(("fokker_b").asSymbol, { Pbind(\dur, Pseq([1], inf), \stepsPerOctave, 31, \midinote, Pseq(["d1".namecps, "f1".namecps]/2, inf), \ctranspose,0, \legato, 1, \chan, Pseq([4], inf), \type, \midi, \midiout, m)}).play;

Pdef("fokker_2".asSymbol).stop;

p = ~fantasia.p.play;
p.stop;

~allOpen.();

~notesOff.();

~allClose.();




/// melodie omhoog en omlaag.

/// 55-70
Pdef(("up").asSymbol, { Pbind(\dur, Pseq([2], inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "c2".namemidi, "d2".namemidi, "e2".namemidi], inf), \ctranspose,0, \legato, 1, \chan, Pseq([4], inf), \type, \midi, \midiout, m)}).play;


Pdef("up".asSymbol).stop;



/// machine sounds (v1)
Pdef(\m, { Pbind(\dur, 1 \stepsPerOctave, 31, \midinote, Pseq((45..97), inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
Pdef(\m3, { Pbind(\dur, 1, \stepsPerOctave, 31, \midinote, Pwhite((75..91), inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([7,8,9], inf), \type, \midi, \midiout, m)}).play;
Pdef(\mb, { Pbind(\dur, 1, \stepsPerOctave, 31, \midinote, Pwhite((36..45), inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([5,4,6], inf), \type, \midi, \midiout, m)}).play;

Pdef.all.do{|p| p.stop;}


// rain
Pdef(\regen, { Pbind(\dur, 1/32, \stepsPerOctave, 31, \midinote, Pwhite(46, 51, inf), \ctranspose,0, \legato, 3, \chan, Pwhite(0,4, inf), \type, \midi, \midiout, m) }).play;
Pdef(\regenb, { Pbind(\dur, 2, \stepsPerOctave, 31, \midinote, 36, \ctranspose,0, \legato, 1, \chan, 6, \type, \midi, \midiout, m) }).play;
Pdef(\wind, { Pbind(\dur, Pseq([1/23], inf), \stepsPerOctave, 31, \midinote, Pseq((56..89).mirror, inf), \ctranspose,0, \legato, 1, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).stop;



// reverb:
Ndef(\s, {GVerb.ar(SoundIn.ar(0,1),100,8)*0.7}).play(0,2);

// rap:
Ndef(\s, {GVerb.ar(SoundIn.ar(0,1),100,0.1)*0.7}).play(0,2).stop;

// moment supreme
Pdef("machine".asSymbol, { Pbind(\dur, Pseq([1/1], 2), \stepsPerOctave, 31, \midinote, Pseq(["d5".namemidi], inf), \ctranspose,0, \legato, 0.2, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;
Pdef("machine".asSymbol, { Pbind(\dur, Pseq([1/1], inf), \stepsPerOctave, 31, \midinote, Pseq(["d1".namemidi, "eb1".namemidi], inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;
Pdef("machineCue".asSymbol, { Pbind(\dur, Pseq([8/1], inf), \stepsPerOctave, 31, \midinote, Pseq(["d4".namemidi], inf), \ctranspose,0, \legato, 0.05, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;

Pdef(\machine2, { Pbind(\dur, Pseq([1/1], inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "c2".namemidi], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;
}, '/2/push2');

Pdef(("machineSwing1").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((36..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
Pdef(("machineSwing").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((56..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
Pdef(("machineSwing3").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((66..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
}, '/2/push3');

// normal tempo
t.tempo_(115/60);

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


