require 'json'

module Commands
  class Load
    # TODO: Enable multiple files
    FILE_PATH = 'data/1.json'

    def initialize(window)
      @window = window
    end

    def call
      @window.player.x = data['player']['x']
      @window.player.y = data['player']['y']
    end

    private

    def data
      JSON.parse(file)
    end

    def file
      open(FILE_PATH).read
    end
  end
end
