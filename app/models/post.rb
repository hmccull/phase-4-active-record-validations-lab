class Post < ApplicationRecord

    # all posts have a title
    validates :title, presence: true
    # content is at least 250 chars
    validates :content, length: { minimum: 250 }
    # summary is a maximum of 250 chars
    validates :summary, length: { maximum: 250 }
    # category is either Fiction or Non-Fiction
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # custom validator --> title is clickbait-y -> must contain provided list of words... 
    validate :title_is_clickbaity

    def title_is_clickbaity
        if title && unless title.include?("Won't Believe" || "Secret" || "Top %[number]" || "Guess")
                errors.add(:title, "Your title isn't clickbait-y!")
            end
        end
    end

end
