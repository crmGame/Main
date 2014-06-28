import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

// Instrument Definitions //

// Sine //
class Sine implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  Sine( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.SINE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.2f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

// Quarter Pulse //
class QPulse implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  QPulse( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.QUARTERPULSE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.2f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

// triangle //
class Tri implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  Tri( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.TRIANGLE  );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.2f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

// Saw //
class Saw implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  Saw( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.SAW  );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.2f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

// Square //
class Square implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  Square( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.SQUARE  );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.2f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}
void setup()
{
  size(512, 200, P3D);

  minim = new Minim(this);

  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();

  // Freq Pallette //
  //*tonal*//
  //**Major**//
  //  String[] freqPallette = {"F4","A4","C5","D5","E5","F5","G5","A5"};
  //**Minor**//
  String[] freqPallette = {
    "F#4", "A4", "C#5", "D#5", "E5", "F#5", "G#5", "A5"
  };

  //*whatevs*//

  // Rhythm Pallette //
  float[] ritPallette = {
    0.1, 0.5, 0.2, 0.33, 0.05, 1
  };

  // initial tempo
  int initTempo = 500;
  out.setTempo(initTempo);

  int numEvents = 160;
  // events we are sequencing
  for (int event = 0; event < numEvents; event++) {

    // micro-timing fluctuations..uses event # to determine
    float mt = random(0, 0.5);

    // duration of notes
    float dur = ritPallette[(int)random(0, ritPallette.length)];

    // freq of notes  
    String freq = freqPallette[(int)random(0, freqPallette.length)];

    // Volume of notes: trickle off after half way

    float vol = numEvents / (event + 1);

    // given start time, duration, and frequency
    out.playNote(event + dur + mt, dur, new QPulse( Frequency.ofPitch( freq ).asHz() ));
    out.playNote(event + dur + mt, dur, new Sine( Frequency.ofPitch( freq ).asHz() ));
    out.playNote(event + dur + mt, dur, new Saw( Frequency.ofPitch( freq ).asHz() ));
    out.playNote(event + dur + mt, dur, new Tri( Frequency.ofPitch( freq ).asHz() ));
    out.playNote(event + dur + mt, dur, new Square( Frequency.ofPitch( freq ).asHz() ));
    
    // accel or deccel

    //    out.setTempo(initTempo + (event * 2));
    out.pauseNotes();
    out.resumeNotes();
  }
}

void draw()
{
}

