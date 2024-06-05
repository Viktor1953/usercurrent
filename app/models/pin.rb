class Pin < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  has_one_attached :image do |image|
    image.variant :large, resize_to_fit: [1000, nil]
    image.variant :medium, resize_to_fit: [300, nil]
    image.variant :thumb, resize_to_fit: [nil, 150]
    image.variant :exibition, resize_to_fit: [nil, 750]
  end



  after_create_commit { broadcast_to_user }
  after_destroy_commit { broadcast_remove_to_user }

  private

  def broadcast_to_user
  user_name = "user_#{user.id}"
  # user_name = user.id

  broadcast_prepend_to user_name,
            target: 'pins',
            partial: 'pins/pin',
            locals: { pin: self }

  # broadcast_append_to ['admin', user_name],
  #           target: "controls_pin_#{id}",
  #           partial: 'pins/admin_controls',
  #           locals: { pin: self }

  broadcast_append_to [user&.to_gid_param],
              target: "controls_pin_#{id}",
              partial: 'pins/user_controls',
              locals: { pin: self, user:  }

  end

  def broadcast_remove_to_user
    user_name = "user_#{user.id}"

    broadcast_remove_to user_name,
    target: "pin_#{id}"
  end


end
