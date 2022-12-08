class Like < ApplicationRecord
    belongs_to :author_id, class_name: "User", foreign_key: :author_id
    belongs_to :post
end
