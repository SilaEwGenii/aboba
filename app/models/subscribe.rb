class Subscribe < ApplicationRecord

    belongs_to :user
    belongs_to :subcribable, class_name: "User"
    # validates :user_id, presence: true, uniqueness: {scope: :subscribable_id, message: "this user already followed"}
   
  
    
end
