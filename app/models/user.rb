class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :questions,dependent: :destroy
         has_many :answers,dependent: :destroy


    def feed
  	
  	users = User.all
  	Question.where(user_id: users).order(created_at: :desc)
  end
end
