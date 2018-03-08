class Spot < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :sports,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
