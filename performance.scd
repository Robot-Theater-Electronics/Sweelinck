"/Users/narcodeb/Desktop/The\ Sweelinck\ Experience/setup.scd".load;
"/Users/narcodeb/Desktop/The\ Sweelinck\ Experience/preload.scd".load;
"/Users/narcodeb/Desktop/The\ Sweelinck\ Experience/remote.scd".load;

// TODO:
// better interface, adem haling, overgang to 2 fluiten, emergency buttons

p.ignite;
c.ignite;

// intro
Ndef(\adem, {BPF.ar(WhiteNoise.ar(0.8), LFTri.kr(1/8).range(100, 450), 0.1) * LFTri.kr(1/8).range(0.01, 0.5)}).play(0,2);

// machine 
c.dict = ();
Pdef(\m, { Pbind(\dur, 1, \stepsPerOctave, 31, \midinote, Pseq((35..91), inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
Pdef(\m3, { Pbind(\dur, 2, \stepsPerOctave, 31, \midinote, Pwhite((35..91), inf), \ctranspose,0, \legato, 0.2, \chan, Pseq([6,7,8], inf), \type, \midi, \midiout, m)}).play;
Pdef(\mb, { Pbind(\dur, 1/4, \stepsPerOctave, 31, \midinote, Pwhite((36..45), inf), \ctranspose,0, \legato, 0.2, \chan, Pseq([5,8,7], inf), \type, \midi, \midiout, m)}).play;

// live coding
Pdef(\m, { Pbind(\dur, 1/3, \stepsPerOctave, 31, \midinote, Pseq((35..91), inf), \ctranspose,0, \legato, 0.4, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
Pdef(\m3, { Pbind(\dur, 1/4, \stepsPerOctave, 31, \midinote, Pwhite((35..91), inf), \ctranspose,0, \legato, 0.2, \chan, Pseq([6,7,8], inf), \type, \midi, \midiout, m)}).play;
Pdef(\mb, { Pbind(\dur, 1, \stepsPerOctave, 31, \midinote, Pwhite((36..45), inf), \ctranspose,0, \legato, 0.2, \chan, Pseq([3,4,5], inf), \type, \midi, \midiout, m)}).play;

Pdef.all.do{|p| p.stop;}
~notesOff.();
/// taal polifonie
t.tempo=85/60
~allClose.();
//[40,43,47,52, 55, 59, 64, 67]
p.dict[0] = { PZ_layer(~harm, [40,43,47,52, 55, 59, 64, 67], 0, 0.9).rhythm(1,1,1,1) };
p.dict[1] = { PZ_layer(~harm, [40, 43, 47, 52, 55, 59, 64, 67], 3, 0.3).rhythm(1,1,1,1) };
p.dict[2] = { PZ_layer(~harm, [40, 43, 47, 52, 55, 59], 6, 0.3).rhythm(1, 1, 1, 1) };
p.dict[3] = { PZ_layer(~harm, (36..78), 2, 1).rhythm(1,1,1,1) };
p.dict[3]=();
p.dict=();
// live coding
p.dict[0] = { PZ_layer(~harm, [40,43,47,52, 55, 59, 64, 67], 0, 0.9).rhythm(1,1,1,1) };
p.dict[1] = { PZ_layer(~harm, [40, 43, 47, 52, 55, 59, 64, 67], 3, 0.3).rhythm(1,1,1,1) };
p.dict[2] = { PZ_layer(~harm, [40, 43, 47, 52, 55, 59], 6, 0.3).rhythm(1, 1, 1, 1) };
p.dict[3] = { PZ_layer(~harm, (36..78), 2, 1).rhythm(1,1,1,1) };
p.dict[0]=();


// na 2 fluiten:
// bell
({6.do{
Ndef(\bell2, { 2*PlayBuf.ar(2, ~buffers['bell'], loop:0, startPos:BufFrames.kr(~buffers['bell'])*0.86)}).play(0,2);
		2.wait;
	}
}.fork);


c.dict=();

// moment supreme & dialogue
"/Users/narcodeb/Desktop/The\ Sweelinck\ Experience/remote.scd".load;
~allOpen.();


// prince
(
~allOpen.();
t.tempo = 85/60;
b = Scale.minorPentatonic;
~oct = -9;
~princeGuitar = { arg num, val;
	var deg = b.degrees[num-1];
	var note = b.degreeToFreq(num, "e0".namecps, ~oct).cpsmidi.round(1).clip2(91).postln;
	if (val == 0) { m.noteOff(0, note); 
		if (note < 55) { m.noteOff(3,note) } 
	} { m.noteOn(0, note); 
		if (note < 55) { m.noteOn(3, note) }
	};
};

OSCdef(\tempo, {arg msg;
	msg.postln;
	~oct = msg[1].linlin(0,1,-9,-6).round(1).postln;
}, '/1/fader1');

9.do{arg i;
	var iplus = i + 1;
	OSCdef(('guitar'++iplus).asSymbol, {arg msg;
		var str = msg[0].asString;
		var num = str.at(str.size-1);
		msg.postln;
		~princeGuitar.(num.asInteger, msg[1]);
	}, '/1/push' ++ iplus);
};
)


// end
(
p.dict=();
c.dict=();
~allClose.();
);
