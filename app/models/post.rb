class Post < ApplicationRecord
    belongs_to :member
    has_many :post_comments, dependent: :destroy

    def self.search(search)
     if search
       Post.where('title LIKE ?', "%#{search}%")
     end
    end
end
