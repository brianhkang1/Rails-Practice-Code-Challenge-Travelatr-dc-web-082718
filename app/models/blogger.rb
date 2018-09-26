class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :bio, length: {minimum: 30}
  validates :age, numericality: {greater_than: 0}

  def total_likes
    self.posts.sum(:likes)
  end

  def featured_post
    {title: self.posts.order(likes: :desc).limit(1).pluck(:title)[0],
    id: self.posts.order(likes: :desc).limit(1).pluck(:id)[0],
    content: self.posts.order(likes: :desc).limit(1).pluck(:content)[0] }
  end


end
