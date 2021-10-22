//// remote:

OSCdef(\remote, {arg msg;
	msg.postln;
	msg[2].postln;
	if (msg[2] == 0 && msg[1] == 1) {
	"on".postln;
	t.tempo_(115/60);
	{c.dict = ();
	6.wait;
	~allOpen.();
	~momentsupreme.();
}.fork;
};

if (msg[2] == 1 && msg[1] == 1) {
"off".postln;

	{
	~allClose.();
	Ndef(\a, {PlayBuf.ar(2, ~buffers['cookies'].bufnum)*4}).play(0,2);
	5.5.wait;
	Ndef(\m0).stop(1);
	Tdef(\a).stop;
	Pdef.all.do{|p| p.stop; };
	p.dict=();
	}.fork;
}
}, '/syntien/sweelinck/2/button1');


OSCdef(\temposupreme, {arg msg;
	var val = msg[1].linlin(0, 1, 115/60, 270/60);
	msg.postln;
	t.tempo_(val);
}, '/syntien/sweelinck/2/knob1');


OSCdef(\toccata, { arg msg;
	if (msg[2] == 1) {
		p.dict=();
		~notesOff.();
		~registers.([2,8,12,14,16]);
	    	n.sendMsg("toccata");  
	} { 
		~allClose.();
		n.sendMsg("stop");
	}
}, '/syntien/sweelinck/1/button4');

OSCdef(\intro, {arg msg;
msg.postln;
~introTune.(msg[2]);
}, '/syntien/sweelinck/1/button1');

OSCdef(\rap, {arg msg;
msg.postln;
~dv.(msg[2]);
}, '/syntien/sweelinck/4/button1');

OSCdef(\rapAlt, {arg msg;
msg.postln;
if (msg[1] == 0) {
	~dv.(msg[2]);
}
}, '/syntien/sweelinckprince/2/button1');

OSCdef(\rev, { arg msg;
	if (msg[2] == 1) {
		~rvb = Ndef(\r, {GVerb.ar(SoundIn.ar(0,1),100,8)*0.5});
		~rvb.play(0,2);	
	} { 
		~rvb.stop(2);
	}
}, '/syntien/sweelinck/1/button5');

OSCdef(\revAlt, { arg msg;
	msg.postln;
	if (msg[2] == 1) {
		~rvb.play(0,2);	
	} { 
		~rvb.stop(2);
	}
}, '/syntien/sweelinckprince/1/button11');

OSCdef(\fantasia, { arg msg;
	if (msg[2] == 1) {
		~registers.([0,2,8,12,16]);
		Pdef.all.do{|p| p.stop;};
		Ndef(\adem).stop();
	    	n.sendMsg("fantasia");  
	} { 
		~allClose.();
		~notesOff.();
		n.sendMsg("stop");
Ndef(\adem).fadeTime_(4);
	Ndef(\adem, {BPF.ar(WhiteNoise.ar(1.5), LFTri.kr(1/8).range(100, 450), 0.1) * LFTri.kr(1/8).range(0.03, 0.7)}).play(0,2);
	}
}, '/syntien/sweelinck/1/button2');

OSCdef(\geschidenis, { arg msg;
	msg.postln;
	if (msg[1] == 0) {
		switch(msg[2],
		1, {
			~notesOff.();
			~registers.([2,8,16]);
			n.sendMsg("orgel"); 

		},
		2, { Ndef(\adem).stop(20); },
		3, { n.sendMsg("orgel"); },
		4, { n.sendMsg("unmute"); },
		0, { 
			~allClose.();

	//n.sendMsg("mute"); 
			{
				1.wait;
			//	p.dict[0] = { PZ_layer(~harm, [40,43,47], 0, 0.9).rhythm(1,1,1,1) };
				t.tempo=85/60;
			//	p.dict[0] = { PZ_layer(~sn, 0, 0.5).rhythm(1,1,1,1) };
			}.fork;
			Ndef(\adem).clear;
			n.sendMsg("stop");
		});
	}
}, '/syntien/sweelinck/1/button3');

OSCdef(\crowd, {
Ndef(\cr).fadeTime=1;
Ndef(\cr, { GVerb.ar(PlayBuf.ar(2, ~buffers['crowd'], loop:0, doneAction:2) * 0.25 * EnvGen.kr(Env.adsr(4), doneAction:2), 220, 18)}).play(0,2);
}, '/syntien/sweelinck/4/button2');

OSCdef(\crowdAlt, {
Ndef(\cr).fadeTime=1;
Ndef(\cr, { GVerb.ar(PlayBuf.ar(2, ~buffers['crowd'], loop:0, doneAction:2) * 0.25 * EnvGen.kr(Env.adsr(4), doneAction:2), 220, 18)}).play(0,2);
}, '/syntien/sweelinckprince/2/button3');

OSCdef(\end, {arg msg;
	~registers.([0,2,8,12,16]);
switch(msg[2], 
1, { n.sendMsg("end"); },
0, { n.sendMsg("stop") }
);
}, '/syntien/sweelinck/4/button3');

~chan = 0;
~pent = false;
OSCdef(\dial, {arg msg;
	msg.postln;
	if (~pent == 1) {
	~oneNote.(msg[2].linlin(0,1,91,36).round(3), ~chan, msg[1].linexp(0,1, 4, 0.1));
	} {
	~oneNote.(msg[2].linlin(0,1,91,36), ~chan, msg[1].linexp(0,1, 4, 0.1));
	}
}, '/3/xy');

OSCdef(\dialogue, {arg msg;
	msg.postln;
	~allOpen.();
	if (~pent == 1) {
	~oneNote.(msg[2].linlin(0,1,36,91).round(3), ~chan, msg[1].linexp(0,1, 4, 0.1));
	} {
	~oneNote.(msg[2].linlin(0,1,36,91), ~chan, msg[1].linexp(0,1, 4, 0.1));
	}
}, '/syntien/sweelinck/3/touchpad1/press');

OSCdef(\diminished, {arg msg;
	msg.postln;
	~pent = msg[2];
}, '/syntien/sweelinck/2/button2');


OSCdef(\stopAll, { arg msg;
		msg.postln;
		p.dict=();
		c.dict=();
		a.dict=();
		~notesOff.();
		~allClose.();
		n.sendMsg("stop");
		Ndef.all.do{|n| n.stop(1); };
		Tdef.all.do{|n| n.stop(1); };
		Pdef.all.do{|n| n.stop(1); };
}, '/syntien/sweelinck/5/button1');

OSCdef(\stopAllAlt, { arg msg;
		msg.postln;
		p.dict=();
		c.dict=();
		a.dict=();
		~notesOff.();
		~allClose.();
		n.sendMsg("stop");
		Ndef.all.do{|n| n.stop(1); };
		Tdef.all.do{|n| n.stop(1); };
		Pdef.all.do{|n| n.stop(1); };
}, '/syntien/sweelinckprince/2/button2');

OSCdef(\registers, { arg msg;
	switch(msg[2],
	1, {
		~allOpen.();
	},
	0, { 
		~allClose.();
	});
}, '/syntien/sweelinck/5/button2');


OSCdef(\stopMidi, { arg msg;
		msg.postln;
		n.sendMsg("stop");
}, '/syntien/sweelinck/5/button3');


9.do{arg i;
	var iplus = i + 1;
	OSCdef(('guitar'++iplus).asSymbol, {arg msg;
		var str = msg[0].asString;
		var num = str.at(str.size-1);
		msg.postln;
		~princeGuitar.(num.asInteger, msg[1]);
	}, '/syntien/sweelinckprince/1/button' ++ iplus);
};

OSCdef(\tempoAlt, {arg msg;
	msg.postln;
	switch(msg[2], 
	0, { ~oct = -9; ~allOpen.(); }, 
	1, { ~oct = -8; },
	2, { ~oct = -6; },
	3, { ~oct = -8; },
	);
//	~oct = msg[2].linlin(0,2,-9,-6).round(1).postln;
}, '/syntien/sweelinckprince/1/button10');


OSCdef(\endAlt, {arg msg;
	msg.postln;
		switch(msg[2],
	1, {
		~registers.([2,8]);
		n.sendMsg("end");
	},
	0, { 
		n.sendMsg("stop");
	});
}, '/syntien/sweelinckprince/2/button4');


//////////////////////////////////////////////////////////
// prince
~pdrums = false;
OSCdef(\remote10, {arg msg;
	msg.postln;
	if (msg[1] == 1) {
	if (~pdrums == false) {
	~pdrums.postln;
	~princeDrums.();
	~pdrums = true;
	} {
	~pdrums.postln;
	p.dict = ();
	c.dict = ();
	~pdrums = false;
	}
	}
}, '/1/push10');

~princech = false;
OSCdef(\remote11, {arg msg;
	msg.postln;
	if (msg[1] == 1) {
if (~princech == false) {
~princeCh = Pseq([~em, ~am].stutter(4), inf).asStream;
~princeRl = Pseq([0.2].stutter(1), inf).asStream;
c.dict['princeCh'] = { PZ_layer(~harm, ~princeCh.next, 0, {~princeRl.next} ).rhythm(1,1,1,1,0,1,0,1,0,1,1,0,0,0,1,1) };
~princech = true;
} { 
c.dict = ();
~princech = false;
};
};
}, '/1/push11');



// touchOSC
OSCdef(\remote2, {arg msg;
	msg.postln;
n.sendMsg("fantasia"); // play fanatsia
}, '/2/push2');

OSCdef(\remote3, {arg msg;
	msg.postln;
	Pdef(("machineSwing1").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((36..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
		Pdef(("machineSwing").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((56..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
		Pdef(("machineSwing3").asSymbol, { Pbind(\dur, Pseq([1/8], inf), \stepsPerOctave, 31, \midinote, Pseq((66..91), inf), \ctranspose,0, \legato, 0.8, \chan, Pseq([0,1,2], inf), \type, \midi, \midiout, m)}).play;
}, '/2/push3');

OSCdef(\remote4, {arg msg;
	msg.postln;
t.tempo_(185/60);
}, '/2/push4');

OSCdef(\remote5, {arg msg;
	msg.postln;
	{
	~allClose.();
	Ndef(\a, {PlayBuf.ar(2, ~buffers['cookies'].bufnum)*4}).play(0,2);
	5.5.wait;
	Ndef(\m0).stop(1);
	Tdef(\a).stop;
	Pdef.all.do{|p| p.stop; }

	}.fork;
}, '/2/push5');


OSCdef(\remote9, {arg msg;
	msg.postln;
	t.tempo_(115/60);
	Ndef(\m0).stop(1);
	Tdef(\a).stop;
	Pdef.all.do{|p| p.stop};
	p.dict = ();
	n.sendMsg("stop");
}, '/2/push9');

OSCdef(\remote10, {arg msg;
	msg.postln;
n.sendMsg("toccata"); // play fanatsia
}, '/2/push10');

// open close registers
OSCdef(\remote13, {arg msg;
	msg.postln;
	~allOpen.();
}, '/2/push13');

OSCdef(\remote14, {arg msg;
	msg.postln;
	~allClose.();
}, '/2/push14');


// control
OSCdef(\tempo, {arg msg;
	var val = msg[1].linlin(0, 1, 115/60, 250/60);
	msg.postln;
	t.tempo_(val);
}, '/1/fader1');




OSCdef(\dialz, {arg msg;
	msg.postln;
	~pent = msg[1];
}, '/3/toggle1');




// REAPER control
n = NetAddr("127.0.0.1", 8000); // local machine
