require 'gosu'

autoload :Window, 'dungeon/window'
autoload :Start,  'dungeon/start'
autoload :Map,    'dungeon/map'
autoload :Tile,   'dungeon/tile'
autoload :Menu,   'dungeon/menu'
autoload :Player, 'dungeon/player'

module Commands
  autoload :Save, 'dungeon/commands/save'
  autoload :Load, 'dungeon/commands/load'
end
