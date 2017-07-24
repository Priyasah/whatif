class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
   validates :content, presence: true
      has_many :votes,dependent: :destroy
end
