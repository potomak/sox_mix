#!/usr/bin/env ruby

#
# Sox Mix test script
#

require 'sox_mix'

mix = SoxMix::Base.new("mix.mp3", 240)

bell_data  = [0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1]
hihat_data = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
rim_data   = [0,0,1,0,0,0,1,1,0,0,1,0,0,0,1,1]
kick_data  = [1,1,0,0,0,1,0,0,1,1,0,0,0,1,0,0]

mix.add_track(bell_data,  "samples/808_bell.mp3")
mix.add_track(hihat_data, "samples/808_hihat.mp3")
mix.add_track(rim_data,   "samples/808_rim.mp3")
mix.add_track(kick_data,  "samples/808_kick.mp3")

mix.run