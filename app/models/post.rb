class Post < ApplicationRecord
    def self.search(search)
     if search
       Post.where('title LIKE ?', "%#{search}%")
     end
    end
end
