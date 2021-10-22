/// sweelinck rap/hip-hop
t.tempo_(85/60);
p.ignite;
a.ignite;

/// 3taal
t.tempo_(80/60);
p.dict['bd'] = { PZ_layer(~bd, 0, 1).rhythm(1,1,1,1) };
p.dict['sn'] = { PZ_layer(~sn, 0, 1).rhythm(0,1,0,1) };


// samples
~rap = ();
//~midisamples=();

~tm = TempoClock.new;
~tmt = TempoClock.new;
~tmb = TempoClock.new;

PZ_layer.debug = true

(
6.do{ arg i;
	// 3 is 4 bars
	var num = (i + 1).asSymbol;
	var name = "rap_sample" ++ num ++".MID";
	~midisamples[('r'++num).asSymbol] = SimpleMIDIFile.read(~midipath ++ name);
	~midisamples[('r'++num++'b').asSymbol] = SimpleMIDIFile.read(~midipath ++ "rap_sample" ++ num ++ "_bass.MID");
}
);

~rap = {arg sample, transpose, speed, clock, chan=0; ( ~midisamples[sample].p <> (type: \midi, stepsPerOctave: 31, midiout: m, tempo: (85*speed)/60, ctranspose: transpose, chan: chan) ).play(clock: clock) }

~rap.('r1', 0, 1, ~tm);

a.beats=16; // 16 also cool
p.beats = 4;
a.dict = ();
p.dict = ();

// remote




p.ignite;
a.ignite;

// drums verse
~dv = { arg state;
	switch(state, 
	0, { ~allClose.(); p.dict = (); a.dict = (); },
	1, { 	~allOpen.(); n.sendMsg("stop");
t.tempo_(85/60);
		p.dict['hh'] = { PZ_layer(~hh, 0, 0.5.rrand(0.6)).rhythm(1,[2],1,[0,1,0,1]) };
		p.dict['bd'] = { PZ_layer(~bd, 0, 0.5).rhythm(1,0,[2],0) };
		p.dict['sn'] = { PZ_layer(~sn, 1, 0.5).rhythm(0,1,0,[1]) };
		p.dict['hh2'] = { PZ_layer(~hh2, 0, 0.5.rrand(0.7)).rhythm([0,0,1,1],[0,2],0,[0,1,0,1]) };
	},
	2, {// verse
		~allOpen.();
a.ignite;
		(
		a.dict['rapt'] = ();
		//a.dict['d'] = { ~dv.() };
		// a.dict['rap'] = { PZ_layer(~rap, ~v1.next, 0, ~v1s.next, ~tm).rhythm([4], 1, 0, [0,1], 0, 0, [2], 1) };
		a.dict['rap'] = { PZ_layer(~rap, ~v1.next.postln, 0, ~v1s.next, ~tm).rhythm([4]) };
		a.dict['rapb'] = { PZ_layer(~rap, 'r1b', 0, 1/4, ~tmb).rhythm(1,0,0,0,0) };
		);
	},
	3, {// chorus 
	
		(
		a.dict['rap'] = { PZ_layer(~rap, {~ch.next}, {~chs.next}, 8, ~tm).rhythm(0, 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1) };
		a.dict['rapt'] = { PZ_layer(~rap, 'r3', -24, 1/2, ~tmt).rhythm(1) };
		a.dict['rapb'] = { PZ_layer(~rap, 'r6b', 0, 2, ~tmb).rhythm(1,0,0,0,1,0,0,0,1,0,0,0,1) };
	
		a.dict['d'] = { ~dch.() };
		);
	},
	4, {
		~dv.(2);	
	}
);
};

~dv.(0);

// prince moment
p.dict['sy'] = { PZ_layer(~synth, {~synthMel.next}, 2, {~panned.next}, 0.4.rrand(0.1)).rhythm([2.rrand(0),1], [1.rrand(0),1], [1.rrand(0),1], [1,1.rrand(2)]); };
p.dict['sy'] = (); 
~notesOff.();
~v1 = Pseq(['r1', 'r5'].stutter(1), inf).asStream;
~v1s = Pseq([2,4], inf).asStream;
~up = Pseq([-24, -24, -12, 0], inf).asStream;

// organ verse 1
~dv.();

// all stop
(
p.dict = ();
a.dict=();
~notesOff.();
// ~allClose.();
);

~allOpen.();

(
a.dict['rapt'] = ();
a.dict['d'] = { ~dv.() };
// a.dict['rap'] = { PZ_layer(~rap, ~v1.next, 0, ~v1s.next, ~tm).rhythm([4], 1, 0, [0,1], 0, 0, [2], 1) };
a.dict['rap'] = { PZ_layer(~rap, ~v1.next.postln, 0, ~v1s.next, ~tm).rhythm([4]) };
a.dict['rapb'] = { PZ_layer(~rap, 'r1b', 0, 1/4, ~tmb).rhythm(1,0,0,0,0) };
);

// bridge
// a.dict['rap'] = { PZ_layer(~rap, 'r2', 0, 1, ~tm).rhythm(1,0,0,0,0,0,0,0,1) };
// a.dict['rapb'] = { PZ_layer(~rap, 'r3', {~up.next}, 4, ~tmb).rhythm(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0 ,0 ,0) };

// organ chorus
~ch = Pseq(['r3', 'r5'].stutter(1), inf).asStream;
~chs = Pseq([-12, 0, 7], inf).asStream;

(
a.dict['rap'] = { PZ_layer(~rap, {~ch.next}, {~chs.next}, 8, ~tm).rhythm(0, 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1) };
a.dict['rapt'] = { PZ_layer(~rap, 'r3', -24, 1/2, ~tmt).rhythm(1) };
a.dict['rapb'] = { PZ_layer(~rap, 'r6b', 0, 2, ~tmb).rhythm(1,0,0,0,1,0,0,0,1,0,0,0,1) };
a.dict['d'] = { ~dch.() };
);

~dch.();
p.dict = ();

~dch = {
p.dict['hh'] = { PZ_layer(~hh, 0, 0.5.rrand(0.6)).rhythm(1,[0],1,[0,1,0,2.rrand(0)]) };
p.dict['hh2'] = { PZ_layer(~hh2, 0, 0.5.rrand(0.7)).rhythm([0,0,1,2],[0,2],0,[0,1,0,1]) };
p.dict['bd'] = { PZ_layer(~bd, 0, 0.5).rhythm([[4, 1].choose],1,[2],[0,1.rrand(0)]) };
p.dict['sn'] = { PZ_layer(~sn, 0, 0.5).rhythm(0,[1,0, 0,1],0,[0,0,0,1.rrand(0)]) };
p.dict['cl'] = { PZ_layer(~cl, 0, 0.5).rhythm(0,[2],0,[1]) };
};

p.dict = ();
a.dict = ();

a.dict['bass'] = { PZ_layer(~chords).rhythm(1,0,[2],0) };
a.dict['mel'] = { PZ_layer(~melodic1, 0.2, 0).rhythm([4],[2],1,[2]) };
a.dict['mel'] = { PZ_layer(~melodic, 0.5, 12).rhythm(1,[0,1,1,1],1,1) }; // v2

~harm0 = {arg chord; Pdef(\h, {Pbind(\dur, 10, \stepsPerOctave, 31, \midinote, chord, \ctranspose, 0, \legato, 1/20, \chan, 0, \type, \midi, \midiout, m)}).play; }

~harm = {arg chord, chan, rl=0.1; chord.do{|n|
	{ m.noteOn(chan, n); rl.wait; m.noteOff(chan, n) }.fork;
	}
};

~mel = {arg chord, chan, rl=0.1;
	{
		chord.do{|n, i|
			m.noteOn(chan, chord[i]); rl.wait; m.noteOff(chan, chord[i]);
			rl.wait;
		}
	}.fork;
};

~melodic.()

l = [ 31.0, 47.0, 38.0 ]
{
l.do{|item, i|
		l[i].postln;
	1.wait;
	};
}.fork;

Pdef(\h).stop;
~chords = {~harm.(~progkr.next, 1, 0.1.rrand(0.8)); };

~melodic1 = {arg rl, tr; ~mel.(~oneNote.next, 1, rl); };

~melodic = {arg rl, tr; ~mel.(~progkr.next+tr, 1, rl); };
~progkr = Pseq([~dM7, ~e5, ~gM7M].stutter(1), inf).asStream;
~oneNote = Pseq([["a4".namemidi], ["f#3".namemidi, "f#4".namemidi], ["B4".namemidi] ].stutter(8), inf).asStream;



~notesOff.();

// fantasia


