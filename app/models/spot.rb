class Spot < ApplicationRecord
  # Direct associations

  has_many   :sports,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
