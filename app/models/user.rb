class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :profile_pic
  has_many :likes

  has_many :comments

  has_many :follow_requests, -> {where(accepted: false)}, class_name: "Follow", foreign_key: "followed_id"

  has_many :accepted_received_requests, -> {where(accepted: true)}, class_name: "Follow", foreign_key: "followed_id"

  has_many :accepted_sent_requests, -> {where(accepted: true)}, class_name: "Follow", foreign_key: "follower_id"

  # has_many :received_requests, class_name: "Follow", foreign_key: "followed_id"
  # has_many :sent_requests, class_name: "Follow", foreign_key: "follower_id"
  # has_many :awaiting_sent_requests, -> {where(accepted: false)}, class_name: "Follow", foreign_key: "follower_id"

  has_many :followers, through: :accepted_received_requests, source: :follower
  has_many :followings, through: :accepted_sent_requests, source: :followed
end
