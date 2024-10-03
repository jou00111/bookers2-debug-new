class Book < ApplicationRecord
  belongs_to :user,   dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(word, search)
    if search == 'perfect'
      User.where(title: word)
    elsif search == 'forward'
      User.where('title LIKE ?', word + '%')
    elsif search == 'backward'
      User.where('title LIKE ?','%'+ word)
    else
      User.where('title LIKE ?','%' + word + '%')
    end
  end  
end
