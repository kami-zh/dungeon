require 'json'

module Commands
  class Save
    # TODO: Enable multiple files
    FILE_PATH = 'data/1.json'

    def initialize(window)
      @window = window
    end

    def call
      open(FILE_PATH, 'w') { |io| JSON.dump(data, io) }
    end

    private

    def data
      {
        player: {
          x: @window.player.x,
          y: @window.player.y
        }
      }
    end
  end
end
