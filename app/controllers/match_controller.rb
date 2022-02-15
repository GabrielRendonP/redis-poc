class MatchController < ApplicationController
  def home; end

  def do_something
    p $redis.get('game')
    # ActionCable.server.broadcast('MatchChannel', 'this is a move')
  end
end
