module SoxMix
  class Sample
    def initialize(sample_path)
      @sample_path = sample_path
    end
  
    def to_s
      "#{@sample_path}"
    end
  end
end