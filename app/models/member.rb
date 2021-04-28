class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users

  has_many :post, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  #フォローしているかを確認するメソッド
  def following?(member)
    following_relationships.find_by(following_id: member.id)
  end

  #フォローするときのメソッド
  def follow(member)
    following_relationships.create!(following_id: member.id)
  end

  #フォローを外すときのメソッド
  def unfollow(member)
    following_relationships.find_by(following_id: member.id).destroy
  end

end
