class Post < ApplicationRecord

    # validates title cannot be empty (posts have title)
    validates :title, presence: true

    # post content has at least 250 characters
    validates :content, length: { minimum:250 }

    # post summary has at most 250 characters
    validates :summary, length: { maximum:250 }

    # post category is either 'Fiction' or 'Non-Fiction'. This requires inclusion validator, refer to the Rails guide Links to an external site
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    # custom validations
    validate :clickbait?

    def clickbait?
        if title && !title.match(/Won't Believe |secret| Top \d|Guess/)
            errors.add(:title, "must be clickbait")
        end
    end

end
