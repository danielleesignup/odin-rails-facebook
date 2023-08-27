class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :notifications
  after_create :create_default_profile

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts
  has_many :comments, dependent: :destroy
 

  def friends_with?(other_user)
    Friendship.exists?(other_user.id)
  end

  # def send_friend_request(to_user)
  #   Friendship.create(friend: to_user)
  # end
  def posts_and_friends_posts
    friends = friendships.map(&:friend) # Assuming friendships has been defined
    puts "Friends IDs: #{friends.pluck(:id)}"

    Post.where(user_id: friends.pluck(:id).push(id) + [self.id])
  end

  def accept_friend_request(from_user)
    friendship = friendships.find_or_initialize_by(friend: from_user)
    friendship.update(accepted: true)
    Friendship.create(user: from_user, friend: current_user, accepted: true).save!
  end

  def decline_friend_request(from_user)
    friendship = friendships.find_by(friend: from_user)
    friendship.destroy if friendship
  end

  def cancel_friend_request(to_user)
    friendship = friendships.find_by(friend: to_user)
    friendship.destroy if friendship
  end

  def pending_friend_request?(other_user)
    Friendship.exists?(friend_id: other_user, accepted: false)
  end

  def create_default_profile
    build_profile(
      name: 'insert name here',
      bio: 'insert bio here',
      avatar: 'insert avatar here'
    ).save
  end

  def create_friend_request(user_id, sender_id)
    @user = User.find(user_id)
    @user.friendships.create(user_id: user_id, friend_id: sender_id).save!
  end
end
