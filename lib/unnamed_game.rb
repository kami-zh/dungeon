require 'gosu'

autoload :Window, 'unnamed_game/window'
autoload :Start,  'unnamed_game/start'
autoload :Map,    'unnamed_game/map'
autoload :Tile,   'unnamed_game/tile'
autoload :Menu,   'unnamed_game/menu'
autoload :Player, 'unnamed_game/player'

module Command
  autoload :Save, 'unnamed_game/commands/save'
end
