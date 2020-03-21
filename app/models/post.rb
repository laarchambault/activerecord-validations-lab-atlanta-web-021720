class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        phrases = ["Won't Believe", "Secret", "Top ","Guess"]
        ans = nil
        phrases.each do |phrase|
            if @title.include? (phrase)
                ans = true
                break
            end
        end
        ans
    end
    #If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess",
end
