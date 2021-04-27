class Post < ApplicationRecord
    belongs_to :member
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

    def self.search(search)
     if search
       Post.where('title LIKE ?', "%#{search}%")
     end
    end
end
