# Sox Mix
Sox Mix is a simple command line tool to mix sounds using [sox](http://sox.sourceforge.net/).

## How to
1. Require the `SoxMix` module.

   `require 'sox_mix'`

2. Create a new `Base` object, first parameter is a string representing the resulting mix path, second parameter represents the bpm.

   `mix = SoxMix::Base.new("mix.mp3", 120)`

3. Add a track to the mix, first parameter is an array representing the beats (`1` for beat, `0` for silence), second parameter is a string representing the sample path, last parameter is an array of effects to apply to the sample.

   `mix.add_track([1,1,0,1], "samples/808_bell.mp3", [:trim])`

4. Start to mix tracks.

   `mix.run`

### Example

Setup and run `./sox_mix_example.rb` to start an example script using `SoxMix`.