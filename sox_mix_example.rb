#!/usr/bin/env ruby

#
# Sox Mix test script
#

require 'sox_mix'

#
# configuration
#
mix_path = "mix.mp3"
mix_bpm = 120
samples = [
  {
    :path => "samples/808_rim.mp3",
    :sequence => [0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0],
    :effects => [:trim]
  },
  {
    :path => "samples/808_hihat.mp3",
    :sequence => [1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1],
    :effects => [:trim]
  },
  {
    :path => "samples/808_bell.mp3",
    :sequence => [0,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0],
    :effects => [:trim]
  },
  {
    :path => "samples/808_kick.mp3",
    :sequence => [1,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0],
    :effects => [:trim]
  }
]

#
# mixing
#
mix = SoxMix::Base.new(mix_path, mix_bpm)

samples.each do |sample|
  mix.add_track(sample[:sequence],  sample[:path], sample[:effects])
end

mix.run