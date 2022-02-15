class Match < ApplicationRecord
  has_many :moves

  broadcasts_to ->(_c) { 'test' }, inserts_by: :prepend, target: 'home'

  def self.create(uuid)
    if !$redis.get('game').blank?
      enemy = $redis.get('game')
      Game.start(uuid, enemy)
      $redis.set('game', nil)
    else
      $redis.set('game', uuid)
    end
  end

  def self.remove(uuid)
    $redis.set('game', nil) if uuid == $redis.get('game')
    Game.stop
  end
end
