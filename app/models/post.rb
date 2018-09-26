class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, length: {minimum: 1}
  validates :content, length: {minimum: 1}


  def blogger_name
    self.blogger.name
  end

  def destination_name
    self.destination.name
  end
  
end
