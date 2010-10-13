module SoxMix
  class Track
    # data array elements are 1 if sound is present, 0 if not
    def initialize(bpm, data, sample)
      @beat = 60.0 / bpm
      @data = data
      @sample = sample
    end
  
    def to_cmd
      cmd = ""
    
      @data.each_with_index do |on, id|
        if 1 == on
          effects = []
          
          if @data[id+1] && 1 == @data[id+1]
            effects << " trim 0 #{@beat}"
          end
          effects << "pad #{id*@beat}@0"
          
          beat_cmd = "#{SoxMix::SOX_COMMAND} -t mp3 #{@sample} -t mp3 - #{effects.join(" ")}"
          
          cmd << "-t mp3 \"|#{beat_cmd}\" "
        end
      end
    
      cmd
    end
  end
end