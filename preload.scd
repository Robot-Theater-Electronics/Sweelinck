// pre-load
s.waitForBoot{
(
~path_samples = "/Users/narcodeb/Music/808/";
~midipath = thisProcess.nowExecutingPath.dirname ++ "/midichops/";
~midisamples = ();
~buffers = ();
~buffers['bd'] = Buffer.read(s, ~path_samples ++ "808bd.wav");
~buffers['hh'] = Buffer.read(s, ~path_samples ++ "808hh.wav");
~buffers['sn'] = Buffer.read(s, ~path_samples ++ "808sd.wav");
~buffers['cl'] = Buffer.read(s, ~path_samples ++ "808cl.wav");
~buffers['cookies'] = Buffer.read(s, "/Users/narcodeb/Downloads/cookies_ready.wav");
~buffers['m1'] = Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/160048__jorickhoofd__metal-heavy-mechanics.wav");
~buffers['m2'] = Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/245462__rhulk__mechanism.wav");
~buffers['m3'] = Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/268186__philippsfoleys__mechanics-wind-and-play.wav");
~buffers['m4'] = Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/460182__johanwestling__mechanic-old-cog-chain-medieval-gate-metal-wood-elevate-open-close-m10.wav");
);
	~buffers['rain']=Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/237729__flathill__rain-and-thunder-4.wav");
		~buffers['crowd']=Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/439896__lchapman1980__applause-1.aiff");
			~buffers['bell']=Buffer.read(s, "/Users/narcodeb/Desktop/The Sweelinck Experience/204103__maphill__kitchen-timer.wav");
s.sync;
// chord progression:
(
~gm7M = ["g0".namemidi, "b1".namemidi, "d1".namemidi];
~gm9M = ["g0".namemidi, "b1".namemidi, "d1".namemidi, "a1".namemidi];
~cm7 = ["c0".namemidi, "b1".namemidi, "eb1".namemidi];
~gM7M = ["g0".namemidi, "B1".namemidi, "d1".namemidi];
~gM9M = ["g0".namemidi, "B1".namemidi, "d1".namemidi, "a1".namemidi];
~cM7 = ["c0".namemidi, "B1".namemidi, "e1".namemidi];
~cM = ["c0".namemidi, "g1".namemidi, "e1".namemidi];
~fM = ["f1".namemidi, "a1".namemidi, "c2".namemidi];
~em = ["e1".namemidi, "g1".namemidi, "B1".namemidi];
~am = ["a1".namemidi, "c2".namemidi, "e2".namemidi];
~eb = ["eb1".namemidi, "g1".namemidi, "b1".namemidi];
~dm = ["d1".namemidi, "f1".namemidi, "a1".namemidi];
~dM7 = ["d1".namemidi, "f#1".namemidi, "a1".namemidi];
~d7 = ["d1".namemidi, "f#1".namemidi, "a1".namemidi, "c2".namemidi];
~am7 = ["c1".namemidi, "g1".namemidi, "a1".namemidi]; ~eb7 = ["c#1".namemidi, "g1".namemidi, "eb2".namemidi];
~c_dM7 = ["c1".namemidi, "f#1".namemidi, "d2".namemidi]; ~ab7 = ["c1".namemidi, "g1".namemidi, "ab2".namemidi];
~d_dM7 = ["d0".namemidi, "f#2".namemidi, "d2".namemidi];
~b_gm7 = ["b0".namemidi, "g2".namemidi, "d1".namemidi];
~a_dM7 = ["a0".namemidi, "f#1".namemidi, "d1".namemidi];
~a7 = ["a0".namemidi, "c1".namemidi, "e1".namemidi, "g1".namemidi];
~g_g = ["g0".namemidi, "g1".namemidi, "g1".namemidi];

~g5 = ["g0".namemidi, "g1".namemidi, "d0".namemidi];
~f5 = ["f0".namemidi, "f1".namemidi, "c0".namemidi];
~a5 = ["a0".namemidi, "a1".namemidi, "e0".namemidi];
~c5 = ["c0".namemidi, "c1".namemidi, "g0".namemidi];
~d5 = ["d0".namemidi, "d1".namemidi, "a0".namemidi];
~b5 = ["B0".namemidi, "B1".namemidi, "f#0".namemidi];
~fs5 = ["f#0".namemidi, "f#1".namemidi, "c#0".namemidi];
~a5 = ["a0".namemidi, "a1".namemidi, "e0".namemidi];
~e5 = ["e0".namemidi, "e1".namemidi, "B0".namemidi];
~cs5 = ["c#0".namemidi, "c#1".namemidi, "g#0".namemidi];

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

);
s.sync;
// beat functions
(
~bd = {arg out, amp; Synth(\sampleNarcode, [\buf, ~buffers['bd'], \amp, amp, \out, out])};
~cl = {arg out, amp; Synth(\sampleNarcode, [\buf, ~buffers['cl'], \amp, amp, \out, out])};
~hh = {arg out, amp; Synth(\sampleNarcode, [\buf, ~buffers['hh'], \amp, amp, \out, out, \rl, 0.01.rrand(0.1)])};
~hh2 = {arg out, amp; Synth(\sampleNarcode, [\buf, ~buffers['hh'], \amp, amp, \rate, 1.rrand(1.5), \at, 0.01.rrand(0.04), \rl, 0.1, \out, 0])};
~sn = {arg out, amp; Synth(\sampleNarcode, [\buf, ~buffers['sn'], \amp, amp, \out, 0])};
~synth = {arg freq, amp, out, rl; { [BPF.ar(WhiteNoise.ar*FSinOsc.ar(LFSaw.kr(7).range(1678, 2233))+Saw.ar([freq, freq+LFSaw.kr(1).range(-14, 50)]), LFTri.kr(t.tempo/4).range(200, 1789), 0.1)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum}.play(s, out) };
~iSeq1 = {arg sample, transpose; ( ~midisamples[sample].p <> (type: \midi, stepsPerOctave: 31, midiout: m, tempo: 102/60, ctranspose: transpose) ).play};
~sampler = {arg out, amp, buf, rl, rate, pos; Synth(\sampleNarcode, [\buf, buf, \amp, amp, \out, out, \rl, rl, \rate, rate, \pos, pos]) };
);
s.sync;
// synths
SynthDef(\sampleNarcode, {|out=0, at=0.01, rl=0.1, rate=1, pos=0, amp=1, buf|
	var env = EnvGen.kr(Env.perc(at, rl), doneAction:2);
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf)*rate, 1, BufFrames.kr(buf)*pos)*env;
	Out.ar(out, snd!2*amp);
}).store;
~funcs = ();
~funcs_a = ();
s.sync;
// special midi synth
~harm = {arg chord, chan, rl=0.1; chord.do{|n|
		{ m.noteOn(chan, n); rl.wait; m.noteOff(chan, n) }.fork;
	}
};
~oneNote = {arg note, chan, rl=0.1;
		{ m.noteOn(chan, note); rl.wait; m.noteOff(chan, note); }.fork;
};
~sampler = {arg out, amp, buf, rl, rate, pos; Synth(\sampleNarcode, [\buf, buf, \amp, amp, \out, out, \rl, rl, \rate, rate, \pos, pos]) };
s.sync;
p = PZ_machine(s);
a = PZ_machine(s);
c = PZ_machine(s); // chords
c.beats = 16;
a.beats=16;
a.ignite;p.ignite;c.ignite;
s.sync;
~tm = TempoClock.new;
~tmt = TempoClock.new;
~tmb = TempoClock.new;
~fx1 = Bus.audio(s, 2);
Ndef(\fx1, {CombN.ar(In.ar(~fx1), 1, t.tempo/2, 4)*0.4}).play(2,2);
s.sync;
(
~midisamples['i1'] = SimpleMIDIFile.read(~midipath ++ "i1.MID");
~midisamples['iSeq1'] = SimpleMIDIFile.read(~midipath ++ "iSeq1.MID");
~midisamples['iSeqBb'] = SimpleMIDIFile.read(~midipath ++ "iSeqBb.MID");
~chorus = Pseq([~bM, ~cm2, ~fM, ~ebM, ~cmCh, ~bMch].stutter(1), inf).asStream;
~chorusrl = Pseq([3, 3, 1, 1, 1, 2].stutter(1), inf).asStream;
~synthMel = Pseq(["g5".namecps, "b5".namecps, "d6".namecps, "f6".namecps].stutter(4)/1, inf).asStream;
~panned = Pseq([0,1], inf).asStream;
);
s.sync;
~introTune = { arg state;
	if (state == 1) {
		~registers.([8,12,14,16]);
		t.tempo = 102/60;
		(
		p.dict['b'] = { PZ_layer(~bd, 0, 1).rhythm([1],[1],[1],[1]) };
		p.dict['s'] = { PZ_layer(~sn, 0, 1).rhythm(0,[0],0,[0,1,0, 1]) };
		p.dict['h'] = { PZ_layer(~hh, 0, 1).rhythm([1],[1,2],[1,2],[1]) };
		p.dict['c'] = { PZ_layer(~cl, 0, 1).rhythm(1,[0, 0.rrand(2)],[1],0) };
		// intro:
		p.dict['sy'] = { PZ_layer(~synth, {~synthMel.next}, 4, {~panned.next}, 0.4.rrand(0.1)).rhythm([2.rrand(0),1], [1.rrand(0),1], [1.rrand(0),1], [1,1.rrand(2)]); };
		// organ
		c.dict['ch'] = { PZ_layer(~harm, {~chorus.next}, 0, {~chorusrl.next} ).rhythm(1, 0, 0, 0, 1, 0, 0 ,0, 1, 1, 1, 1); };
		);
	} { 
		p.dict=();
		~allClose.();

	}
};
s.sync;
~momentsupreme = {
{
(
Pdef("machine".asSymbol, { Pbind(\dur, Pseq([Pseq([1], 7), Pseq([1/2], 2)], inf), \stepsPerOctave, 31, \midinote, Pseq(["d1".namemidi, "eb1".namemidi], inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([2], inf), \type, \midi, \midiout, m)}).play;
Pdef("machineCue".asSymbol, { Pbind(\dur, Pseq([8/1], inf), \stepsPerOctave, 31, \midinote, Pseq([[36, 40], [36, 43]], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([3], inf), \type, \midi, \midiout, m)}).play;
);
20.wait;
p.dict[0] = { PZ_layer(~sampler, 0, 0.4, ~buffers['m1'], 2, 0.8, 0.2).rhythm(1,[2],1,[2]) };
10.wait;
Pdef(\machine2, { Pbind(\dur, Pseq([1/2], inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "c2".namemidi], inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0,1,2].stutter(3), inf), \type, \midi, \midiout, m)}).play;
16.wait;
p.dict[1] = { PZ_layer(~sampler, 0, 0.4, ~buffers['m4'], 2, 1, {0.rrand(0.9)} ).rhythm(1,1,1,1) };
16.wait;
Pdef(("machineSwing1").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((36..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
p.dict[2] = { PZ_layer(~sampler, 0, 0.4, ~buffers['cookies'], 2, {3.rrand(4)}, 0.65).rhythm([2,0,0,0],0,0) };
14.wait;
p.dict[3] = { PZ_layer(~oneNote, 76.rrand(91), 0, 0.2).rhythm([8], [0,4], 0, [0,3]) };
10.wait;
p.dict[4] = { PZ_layer(~oneNote, {36.rrand(45)}, 4, 0.7).rhythm(1,1,1,1) };
}.fork;
};
s.sync;
//rap
~rap = {arg sample, transpose, speed, clock, chan=0; ( ~midisamples[sample].p <> (type: \midi, stepsPerOctave: 31, midiout: m, tempo: (85*speed)/60, ctranspose: transpose, chan: chan) ).play(clock: clock) };
(
6.do{ arg i;
	// 3 is 4 bars
	var num = (i + 1).asSymbol;
	var name = "rap_sample" ++ num ++".MID";
	~midisamples[('r'++num).asSymbol] = SimpleMIDIFile.read(~midipath ++ name);
	~midisamples[('r'++num++'b').asSymbol] = SimpleMIDIFile.read(~midipath ++ "rap_sample" ++ num ++ "_bass.MID");
}
);
s.sync;
~dv = { arg state;
	switch(state, 
	0, { ~allClose.(); x.dict = (); y.dict = ();},
	1, { 	~allOpen.(); n.sendMsg("stop");
 x = PZ_machine(s); 
 y = PZ_machine(s); 
 y.beats=16;
t.tempo_(85/60);
//{
 x.ignite;
 y.ignite;
// ~bd.(0,0.5);
// 1.wait;
//~sn.(1, 0.5);:
// 1.wait;
		x.dict['hh'] = { PZ_layer(~hh, 0, 0.7.rrand(0.9)).rhythm(1,[2],1,[0,1,0,1]) };
		x.dict['bd'] = { PZ_layer(~bd, 0, 0.8).rhythm(1,0,[2],0) };
		x.dict['sn'] = { PZ_layer(~sn, 1, 0.8).rhythm(0,1,0,[1]) };
		x.dict['hh2'] = { PZ_layer(~hh2, 0, 0.7.rrand(0.9)).rhythm([0,0,1,1],[0,2],0,[0,1,0,1]) };
//	},
//	2, {// verse
	//	~allOpen.();
		(
		y.dict['rapt'] = ();
		//a.dict['d'] = { ~dv.() };
		// a.dict['rap'] = { PZ_layer(~rap, ~v1.next, 0, ~v1s.next, ~tm).rhythm([4], 1, 0, [0,1], 0, 0, [2], 1) };
		y.dict['rap'] = { PZ_layer(~rap, ~v1.next.postln, 0, ~v1s.next, ~tm).rhythm([4]) };
		y.dict['rapb'] = { PZ_layer(~rap, 'r1b', 0, 1/4, ~tmb).rhythm(1,0,0,0,0) };
		);
//	}.fork;
	},
	2, {// chorus 
	
		(
		y.dict['rap'] = { PZ_layer(~rap, {~ch.next}, {~chs.next}, 8, ~tm).rhythm(0, 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1) };
		y.dict['rapt'] = { PZ_layer(~rap, 'r3', -24, 1/2, ~tmt).rhythm(1) };
		y.dict['rapb'] = { PZ_layer(~rap, 'r6b', 0, 2, ~tmb).rhythm(1,0,0,0,1,0,0,0,1,0,0,0,1) };
	//	y.dict['rapb]	
		y.dict['d'] = { ~dch.() };
		);
	},
	3, {
		x.dict['hh'] = { PZ_layer(~hh, 0, 0.7.rrand(0.9)).rhythm(1,[2],1,[0,1,0,1]) };
		x.dict['bd'] = { PZ_layer(~bd, 0, 0.8).rhythm(1,0,[2],0) };
		x.dict['sn'] = { PZ_layer(~sn, 1, 0.8).rhythm(0,1,0,[1]) };
		x.dict['hh2'] = { PZ_layer(~hh2, 0, 0.7.rrand(0.9)).rhythm([0,0,1,1],[0,2],0,[0,1,0,1]) };
//	},
//	2, {// verse
	//	~allOpen.();
		(
		y.dict['rapt'] = ();
		//a.dict['d'] = { ~dv.() };
		// a.dict['rap'] = { PZ_layer(~rap, ~v1.next, 0, ~v1s.next, ~tm).rhythm([4], 1, 0, [0,1], 0, 0, [2], 1) };
		y.dict['rap'] = { PZ_layer(~rap, ~v1.next.postln, 0, ~v1s.next, ~tm).rhythm([4]) };
		y.dict['rapb'] = { PZ_layer(~rap, 'r1b', 0, 1/4, ~tmb).rhythm(1,0,0,0,0) };
		);
	}
);
};
s.sync;
~v1 = Pseq(['r1', 'r5'].stutter(1), inf).asStream;
~v1s = Pseq([2,4], inf).asStream;
~ch = Pseq(['r3', 'r5'].stutter(1), inf).asStream;
~chs = Pseq([-12, 0, 7], inf).asStream;
~dch = {
x.dict['hh'] = { PZ_layer(~hh, 0, 0.7.rrand(0.9)).rhythm(1,[0],1,[0,1,0,2.rrand(0)]) };
x.dict['hh2'] = { PZ_layer(~hh2, 0, 0.7.rrand(0.9)).rhythm([0,0,1,2],[0,2],0,[0,1,0,1]) };
x.dict['bd'] = { PZ_layer(~bd, 0, 0.8).rhythm([[4, 1].choose],1,[2],[0,1.rrand(0)]) };
x.dict['sn'] = { PZ_layer(~sn, 0, 0.8).rhythm(0,[1,0, 0,1],0,[0,0,0,1.rrand(0)]) };
x.dict['cl'] = { PZ_layer(~cl, 0, 0.8).rhythm(0,[2],0,[1]) };
};
s.sync;

~rvb = Ndef(\r, {GVerb.ar(SoundIn.ar(0,1),100,8)*0.5});
s.sync;
(
b = Scale.majorPentatonic;
~oct = -9;
~princeGuitar = { arg num, val;
	var deg = b.degrees[num-1];
	var note = b.degreeToFreq(num, "c#0".namecps, ~oct).cpsmidi.round(1).clip2(91).postln;
	if (val == 0) { m.noteOff(0, note); 
		if (note < 55) { m.noteOff(3,note) } 
	} { m.noteOn(0, note); 
		if (note < 55) { m.noteOn(3, note) }
	};
};
);
"Preload complete".postln;
}

//Scale.directory

