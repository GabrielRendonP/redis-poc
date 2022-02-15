class MatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{uuid}"
    Match.create(uuid)
  end

  def unsubscribed
    Match.remove(uuid)
  end

  def notify
    p 'whats this?'
  end

  def make_move
    Game.make_move(uuid)
  end
end
