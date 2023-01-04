class Subscribe < ApplicationRecord

  belongs_to :user
  belongs_to :subscribable, class_name: "User"

end
