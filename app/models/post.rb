class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :clickbaity_title?

    CLICKBAIT = [/Won't Believe/, /Secret/, /Top [number]/, /Guess/]

    def clickbaity_title?
       if CLICKBAIT.none? { |word| word.match title }
        errors.add(:title, "More clickbait!")
       end
    end
end
