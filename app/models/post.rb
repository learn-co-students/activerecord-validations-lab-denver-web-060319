class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait?
  
  
  def clickbait?
    clickbait = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
    if clickbait.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
    end
  end
#   @@array = ["Won't Believe", "Secret", "Top", "Guess"]

#   def click_bait
#     if @@array.any? { |word| word.include?(:title.to_s) }
#         errors.add(:title, "must be clickbait")
#     end
#   end
end
