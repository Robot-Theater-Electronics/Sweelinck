// intro tune
t.tempo = 102/60

p = PZ_machine(s); // beat
c = PZ_machine(s); // chords
c.beats = 16;

p.dict['b'] = { PZ_layer(~bd, 0, 1).rhythm([1],[1],[1],[1]) };
p.dict['s'] = { PZ_layer(~sn, 0, 1).rhythm(0,[0],0,[0,1,0, 1]) };
p.dict['h'] = { PZ_layer(~hh, 0, 1).rhythm([1],[1,2],[1,2],[1]) };
p.dict['c'] = { PZ_layer(~cl, 0, 1).rhythm(1,[0, 0.rrand(2)],[1],0) };

p.dict['c'] = ();

p.ignite;
c.ignite;

p.dict=();
c.dict=();
~allClose.();

~allOpen.();

// intro:
~midisamples = ();
~midisamples['i1'] = SimpleMIDIFile.read(~midipath ++ "i1.MID");
~midisamples['iSeq1'] = SimpleMIDIFile.read(~midipath ++ "iSeq1.MID");
~midisamples['iSeqBb'] = SimpleMIDIFile.read(~midipath ++ "iSeqBb.MID");

~i1 = {( ~midisamples['i1'].p <> (type: \midi, stepsPerOctave: 31, midiout: m, tempo: 102/60) ).play}

~iSeq1 = {arg sample, transpose; ( ~midisamples[sample].p <> (type: \midi, stepsPerOctave: 31, midiout: m, tempo: 102/60, ctranspose: transpose) ).play}

Pdef(\fe, Ppar([( ~midisamples['i1'].p <> (type: \midi, midiout: m, tempo: 102/60) )], inf) ).stop;

// chorus
(
~bM = ["b3".namemidi, "d3".namemidi, "f3".namemidi, "b4".namemidi];
~fM = ["f3".namemidi, "c3".namemidi, "f3".namemidi, "a4".namemidi];
~ebM = ["eb3".namemidi, "b2".namemidi, "eb3".namemidi, "g4".namemidi];
~cmCh = ["c3".namemidi, "g2".namemidi, "eb3".namemidi, "g4".namemidi];
~bMch = ["b2".namemidi, "f2".namemidi, "d3".namemidi, "f4".namemidi];
~cm2 = ["c2".namemidi, "c3".namemidi, "g3".namemidi, "eb4".namemidi];
~bM6 = ["d2".namemidi, "b3".namemidi, "f3".namemidi, "d4".namemidi];
~eb = ["eb2".namemidi, "b3".namemidi, "g3".namemidi, "eb4".namemidi];
~fM4 = ["f2".namemidi, "c3".namemidi, "a3".namemidi, "f4".namemidi];
~gm = ["g2".namemidi, "b3".namemidi, "f3".namemidi, "d4".namemidi];
~fM6 = ["a2".namemidi, "c3".namemidi, "a3".namemidi, "f4".namemidi];
~bMc = ["b2".namemidi, "d3".namemidi, "f3".namemidi, "b4".namemidi];
~bassprog = ["b2".namemidi, "f3".namemidi, "g3".namemidi, "c3".namemidi];
);

// intro tune
~chorus = Pseq([~bM, ~cm2, ~fM, ~ebM, ~cmCh, ~bMch].stutter(1), inf).asStream;
~chorusrl = Pseq([3, 3, 1, 1, 1, 2].stutter(1), inf).asStream;
c.dict['ch'] = { PZ_layer(~harm, {~chorus.next}, 0, {~chorusrl.next} ).rhythm(1, 0, 0, 0, 1, 0, 0 ,0, 1, 1, 1, 1); };
c.dict['ch'] = ();

//Pdef(\up, { Pbind(\dur, Pseq([1/2], inf), \stepsPerOctave, 31, \midinote, Pseq([Pfuncn({~bM}, 8), Pfuncn({~fM},8)], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0], inf), \type, \midi, \midiout, m)}).play;

// bass
~asMel = Pseq(["b1".namemidi, "c1".namemidi, "b1".namemidi, "b1".namemidi].stutter(1),inf).asStream;

c.dict['bass'] = { PZ_layer(~oneNote, {~asMel.next}, 6, 0.2).rhythm(1); };
c.dict['bass'] = ();

~synth = {arg freq, amp, out, rl; {BPF.ar(WhiteNoise.ar*FSinOsc.ar(LFSaw.kr(7).range(1678, 2233))+Saw.ar([freq, freq+LFSaw.kr(1).range(-14, 50)]), LFTri.kr(t.tempo/4).range(200, 1789), 0.1)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)}.play(s, out) }

// synth:
~synthMel = Pseq(["g5".namecps, "b5".namecps, "d6".namecps, "f6".namecps].stutter(4)/1, inf).asStream;
~panned = Pseq([0,1], inf).asStream;
p.dict['sy'] = { PZ_layer(~synth, {~synthMel.next}, 2, {~panned.next}, 0.4.rrand(0.1)).rhythm([2.rrand(0),1], [1.rrand(0),1], [1.rrand(0),1], [1,1.rrand(2)]); };
p.dict['sy'] = ();

p.beats = 4;
p.dict['ch'] = { PZ_layer(~oneNote, {~asMel.next}, 0, 1.5).rhythm(1, [0,1], 0, [0,1]) }; // for prince moment?

// chorus closure:
~verse = Pseq([~cm2, ~bM6, ~eb, ~fM4, ~gm, ~fM6, ~bMc, ~fM4].stutter(1), inf).asStream;
~rlverse = Pseq([4,4,4,0.2, 0.2, 0.2, 0.2, 0.1], inf).asStream;
p.dict['v'] = { PZ_layer(~harm, ~verse.next, 0, ~rlverse.next).rhythm([4]) };
p.dict['v'] = ();
p.dict['ch'] = ();

p.dict=();
// verse:


/// to verse

p.dict['b'] = { PZ_layer(~bd, 0, 1).rhythm([1],[1],[1],[1]) };
p.dict['s'] = ();
p.dict['h'] = ();
p.dict['c'] = ();
p.dict['sy'] = ();
c.dict['ch'] = ();

~seq = Pseq([0, 7,-12, 7, -12, 0, 7, 12].stutter(1), inf).asStream;
/*c.dict['i1'] = { PZ_layer(~i1).rhythm(0,0,0,0,1) };
c.dict['i1'] = ();*/
c.dict['iSeq1'] = { PZ_layer(~iSeq1, 'iSeqBb', {~seq.next.postln}).rhythm(1,0,1,0,1,0, 1, 0, 1, 0, 1, 0,1,0,1,0) };
c.dict['iSeq1'] = { PZ_layer(~iSeq1, 'iSeqBb', {~seq.next.postln}).rhythm(1,1,1,1,1,1, 1, 1, 1, 1, 1, 1,1,1,1,0) };
c.dict['iSeq1'] = { PZ_layer(~iSeq1, 'iSeqBb', {~seq.next.postln}).rhythm([2],[2],[2],[2],[2],1, [2], 1, 1, [2], [2], [2],[2],[2],[2],0) };
c.dict['iSeq1'] = ();

p.dict['s'] = { PZ_layer(~sn, 0, 1).rhythm(0,[0],0,[0,1,0, 1]) };
p.dict['h'] = { PZ_layer(~hh, 0, 1).rhythm([1],[1,2],[1,2],[1]) };
p.dict['c'] = { PZ_layer(~cl, 0, 1).rhythm(1,[0, 0.rrand(2)],[1],0) };

// chorus
~chorus = Pseq([~bM, ~cm2, ~fM, ~ebM, ~cmCh, ~bMch].stutter(1), inf).asStream;
~chorusrl = Pseq([3, 3, 1, 1, 1, 2].stutter(1), inf).asStream;

p.dict['b'] = { PZ_layer(~bd, 0, 1).rhythm([1],[1],[1],[1]) };
p.dict['s'] = { PZ_layer(~sn, 0, 1).rhythm(0,[0],0,[0,1,0, 1]) };
p.dict['h'] = { PZ_layer(~hh, 0, 1).rhythm([1],[1,2],[1,2],[1]) };
p.dict['c'] = { PZ_layer(~cl, 0, 1).rhythm(1,[0, 0.rrand(2)],[1],0) };

(
c.dict['iSeq1'] = ();
c.dict['ch'] = { PZ_layer(~harm, {~chorus.next}, 0, {~chorusrl.next.postln}).rhythm(1, 0, 0, 0, 1, 0, 0 ,0, 1, 1, 1, 1); };
);


p.dict['sy'] = { PZ_layer(~synth, {~synthMel.next}, 2, {~panned.next}, 0.4.rrand(0.1)).rhythm([2.rrand(0),1], [1.rrand(0),1], [1.rrand(0),1], [1,1.rrand(2)]); };


c.dict = ();
p.dict = ();

//////
~notesOff.();
~allOpen.();

"pkill scsynth".unixCmd;


//// prince guitar
~princeDrums = {
p.dict['b'] = { PZ_layer(~bd, 0, 1).rhythm([1],[1],[1],[1]) };
p.dict['s'] = { PZ_layer(~sn, 0, 1).rhythm(0,[0],0,[0,1,0, 1]) };
p.dict['h'] = { PZ_layer(~hh, 0, 1).rhythm([1],[1,2],[1,2],[1]) };
p.dict['c'] = ();
}
~princeDrums.();
p.ignite;
c.ignite;

~princeCh = Pseq([~em].stutter(1), inf).asStream;
~princeRl = Pseq([0.2].stutter(1), inf).asStream;
c.dict['princeCh'] = { PZ_layer(~harm, {~princeCh.next}, 0, {~princeRl.next} ).rhythm(1,1,1,1,0,1,0,1,0,1,1,0,0,0,1,1) };

b = Scale.minorPentatonic

Pdef(\guitar, { Pbind(\dur, Pseq([1/1], inf), \stepsPerOctave, b.stepsPerOctave, \degree, Pwalk((0..7), Pfunc{1.rrand(2)}), \root, 4, \ctranspose,0, \legato, 0.5, \chan, Pseq([0], inf), \type, \midi, \midiout, m)}).stop;


Ndef(\r).stop(4);
~allOpen.();
(
b = Scale.minorPentatonic;
~princeGuitar = { arg num, val;
	var deg = b.degrees[num-1];
	var note = b.degreeToFreq(num, "e-7".namecps, 0).cpsmidi.round(1).postln;
	if (val == 0) { m.noteOff(0, note) } { m.noteOn(0, note) }
};

9.do{arg i;
	var iplus = i + 1;
	OSCdef(('guitar'++iplus).asSymbol, {arg msg;
		var str = msg[0].asString;
		var num = str.at(str.size-1);
		msg.postln;
		~princeGuitar.(num.asInteger, msg[1]);
	}, '/syntien/sweelinckprince/1/button' ++ iplus);
};
)



