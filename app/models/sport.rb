class Sport < ApplicationRecord
  # Direct associations

  belongs_to :spot,
             :required => false,
             :counter_cache => true

  has_many   :photos,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
