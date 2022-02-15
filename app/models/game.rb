class Game < ApplicationRecord
  @@state = 'wait'
  @@p1 = ''
  @@p2 = ''

  broadcasts_to ->(_c) { 'test' }, inserts_by: :prepend, target: 'home'

  def self.start(p1, p2)
    ActionCable.server.broadcast('game_channel', 'Game ready to start')
    @@p1 = "player_#{p1}"
    @@p2 = "player_#{p2}"
    ActionCable.server.broadcast(@@p1, 'ready!')
    ActionCable.server.broadcast(@@p2, 'ready!')
    @@state = 'start'
  end

  def self.make_move(current)
    p 'should make move'
    ActionCable.server.broadcast(@@p1, "#{current} made a move")
    ActionCable.server.broadcast(@@p2, "#{current} made a move")
  end

  def self.stop
    ActionCable.server.broadcast('game_channel', 'Player left')
    @@state = 'wait'
    @@p1 = ''
    @@p2 = ''
  end

  def self.state
    @@state
  end
end
