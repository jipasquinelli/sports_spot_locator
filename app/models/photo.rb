class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :spot

  belongs_to :sport,
             :required => false

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

  validates :image, :presence => true

  validates :user_id, :presence => true

end
