class Post < ActiveRecord::Base
    validates :title, presence: true
    
    validates :summary, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
    
    validates :content, length: { minimum: 250,
    too_short: "%{count} characters is the minimum allowed" }

    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

    validate :clickbait

   def clickbait

        if title.present? && !title.include?("Won't Believe")
            errors.add(:title, "Not clickbait-y")
        end
   end
end
