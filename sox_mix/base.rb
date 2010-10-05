module SoxMix
  class Base
    def initialize(mix_path, bpm)
      @mix_path = mix_path
      @bpm = bpm
      @tracks = []
    end
  
    def add_track(data, sample_path)
      @tracks << SoxMix::Track.new(@bpm, data, SoxMix::Sample.new(sample_path))
    end
  
    def run
      cmd = to_cmd
      puts "running: #{cmd}"
      system(cmd)
    end
  
    private

    def to_cmd
      cmd = "#{SoxMix::SOX_COMMAND} --combine mix "

      @tracks.each do |track|
        cmd << "#{track.to_cmd} "
      end

      cmd << "-t mp3 #{@mix_path}"
    end
  end
end