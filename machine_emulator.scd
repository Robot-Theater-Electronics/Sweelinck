// emulator

Pdef(\na, { Pbind(\instrument, \sampleNarcode, \dur, 4, \amp, 0.2, \out, 0, \rate, 1, \rl, Pkey(\dur), \buf, Pfunc{~buffers['m1']}) }).play;
Pdef(\n, { Pbind(\instrument, \sampleNarcode, \dur, 4, \amp, 0.2, \out, 0, \rate, 2, \rl, Pkey(\dur), \buf, Pfunc{~buffers['m4']}) }).play;

// live coding
Pdef(\na, { Pbind(\instrument, \sampleNarcode, \dur, 4, \amp, 0.1, \out, 0, \rate, 2, \rl, Pkey(\dur), \buf, Pfunc{~buffers['m3']}) }).play;
Pdef(\n, { Pbind(\instrument, \sampleNarcode, \dur, 8, \amp, 0.1, \out, 0, \rate, 2, \rl, Pkey(\dur), \buf, Pfunc{~buffers['m4']}) }).play;

Pdef.all.do{|p| p.stop;}

// stoom cursus
t.tempo=0.8
p.dict[0] = { PZ_layer(~sampler, 0, 0.2, ~buffers['m1'], 2, 0.8, 0.2).rhythm([1, 2],[1, 2],[1,2],[1,2]) };
p.dict[1] = { PZ_layer(~sampler, 0, 0.2, ~buffers['m4'], 2, 1, {0.rrand(0.9)} ).rhythm(1,1,1,1) };
p.dict[2] = { PZ_layer(~sampler, 0, 0.2, ~buffers['cookies'], 2, {2.rrand(1)}, 0.65).rhythm([2,0,0,0],0,0) };

p.dict=();
p.dict[0]=();
p.dict[1]=();


// machine 1
c.dict[0] = { PZ_layer(~sampler, 0, 1, ~buffers['m1'], 20, 0.8, 0).rhythm(1,0,0,0,0,1) };
c.dict[1] = { PZ_layer(~sampler, 0, 0.4, ~buffers['m4'], 20, 0.8, 0).rhythm(0,0,1,0,0,0) };

c.dict = ();
~oneNote.(40, 0, 10);
~harm.()

~notesOff.();

p.ignite
t.tempo=1

~sampler.(0,1,~buffers['m1'],1, 1,0)

// taal polyphonie

t.tempo= 85/60;
p.ignite;
p.dict[0] = { PZ_layer(~sampler, 0, 0.3, ~buffers['m4'], 2, 1, {0.1} ).rhythm([1],1,1,1) };
p.dict[1] = { PZ_layer(~sampler, 0, 0.4, ~buffers['m2'], 1, 1, {0.3} ).rhythm([0],1,0,1) };
p.dict = ();


/// rain

~sampler.(0,1,~buffers['rain'], 30, 1, 0);
Ndef(\r).fadeTime_(5);
Ndef(\r, { PlayBuf.ar(2, ~buffers['rain'], loop:1)*1.1}).play(0,2);

// machine
p.dict[0] = { PZ_layer(~sampler, 0, 0.5, ~buffers['m4'], 0.1, 1, {0.1} ).rhythm([0,1],0,[2],0) };
p.dict[1] = { PZ_layer(~sampler, 0, 0.5, ~buffers['m2'], 0.2, 1, {0.3} ).rhythm([2],1,0,[2,1]) };
p.dict = ();

// crowd
Ndef(\cr).fadeTime=1;
Ndef(\cr, { GVerb.ar(PlayBuf.ar(2, ~buffers['crowd'], loop:0) * 0.05 * EnvGen.kr(Env.adsr(4), doneAction:2), 220, 18)}).play(0,2);
Ndef(\cr).stop(4);
Ndef(\r).stop(4);


// na 2 fluiten:
// bell
{4.do{
Ndef(\bell, { PlayBuf.ar(2, ~buffers['bell'], loop:0, startPos:BufFrames.kr(~buffers['bell'])*0.86)}).play(0,2);
		1.wait;
	}
}.fork;


/// machine phase 2:
t.tempo=1
p.dict[0] = { PZ_layer(~sampler, 0, 1, ~buffers['m1'], 2, 0.8, 0.2).rhythm([1, 2],[1, 2],[1,2],[1,2]) };
p.dict[1] = { PZ_layer(~sampler, 0, 1, ~buffers['m4'], 2, 1, {0.rrand(0.9)} ).rhythm([8],1,1,1) };
p.dict[2] = { PZ_layer(~sampler, 0, 1, ~buffers['m2'], 2, 1, {0.rrand(0.9)} ).rhythm([0,1],1,[0,3],[3]) };


