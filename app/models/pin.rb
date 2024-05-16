class Pin < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  has_one_attached :image do |image|
    image.variant :large, resize_to_fit: [1000, nil]
    image.variant :medium, resize_to_fit: [300, nil]
    image.variant :thumb, resize_to_fit: [nil, 300]
    image.variant :exibition, resize_to_fit: [nil, 750]
  end

  include ActionView::RecordIdentifier

  after_create_commit do 
    broadcast_prepend_later_to [user, :pins], target: dom_id(user, :pins), partial: "pins/pin", locals: { pin: self }
    # broadcast_prepend_to [user, :pins], target: ActionView::RecordIdentifier.dom_id(user, :pins)
  end

  after_update_commit do
    broadcast_update_later_to [user, :pins], target: self, partial: "pins/pin", locals: { pin: self }
  end

  after_destroy_commit do
    broadcast_remove_to [user, :pins], target: self
  end

end
