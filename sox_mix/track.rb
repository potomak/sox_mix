module SoxMix
  class Track
    EFFECTS = [:trim]
    
    # data array elements are 1 if sound is present, 0 if not
    def initialize(bpm, data, sample, effects)
      @beat    = 60.0 / bpm
      @data    = data
      @sample  = sample
      @effects = effects
    end
  
    def to_cmd
      cmd = ""
    
      @data.each_with_index do |on, id|
        if 1 == on
          beat_cmd = "#{SoxMix::SOX_COMMAND} -t mp3 #{@sample} -t mp3 - #{apply_effects(id)}"
          
          cmd << "-t mp3 \"|#{beat_cmd}\" "
        end
      end
    
      cmd
    end
    
    private
    
    def apply_effects(id)
      effects = []
      
      #
      # trim effect
      #
      if @effects.include? :trim
        trim_factor = 2
        beat_found = false
        i = id + 1
        while i < @data.size && !beat_found do
          if 1 == @data[i]
            trim_beat_length = i - id
            effects << " trim 0 #{(@beat*trim_beat_length) + (@beat*trim_factor)}"
            beat_found = true
          end
          
          i += 1
        end
      end
      
      #
      # pad effect
      #
      effects << "pad #{id*@beat}@0"
      
      effects.join(" ")
    end
  end
end