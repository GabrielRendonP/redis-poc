class User < ApplicationRecord
  broadcasts_to ->(_c) { 'test' }, inserts_by: :prepend, target: 'home'
end
