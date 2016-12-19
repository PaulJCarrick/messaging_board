class User < ActiveRecord::Base
  has_many :posts,    dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    if first_name.present? && last_name.present?
      first_name + ' ' + last_name
    elsif first_name.present?
      first_name
    elsif last_name.present?
      last_name
    else
      email
    end
  end
end
