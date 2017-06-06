class OauthCode < ApplicationRecord

  validates :user_id, uniqueness: true
  
  def create_oauth_code(user_id: )
    record = OauthCode.new
    record.user_id = user_id
    record.oauth_code = SecureRandom.urlsafe_base64(32) 
    record.expire_oauth_code = DateTime.now + 1.month
    record.save!
  end

  def update_oauth_code(user_id:)
    record = OauthCode.find_by(user_id: user_id)
    record.oauth_code = SecureRandom.urlsafe_base64(32)
    record.expire_oauth_code = DateTime.now + 1.month
    record.save!
  end

  def find_oauth_code(user_id: )
    record = OauthCode.find_by(user_id: user_id)
    record.oauth_code
  end

  def find_user(user_id:)
    OauthCode.find_by(user_id: user_id)
  end
end
