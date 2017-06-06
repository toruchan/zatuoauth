class Token < ApplicationRecord

  validates :user_id, uniqueness: true
  
  def create_token(user_id: )
    record = Token.new
    record.user_id = user_id
    record.access_token = SecureRandom.urlsafe_base64(32) 
    record.refresh_token = SecureRandom.urlsafe_base64(32)
    record.expire_access_token = DateTime.now + 1.month
    record.expire_refresh_token = DateTime.now + 6.month
    record.save!
  end

  def update_token(user_id:)
    token_ins = Token.new
    record = token_ins.find_user(user_id: user_id)
    record.access_token = SecureRandom.urlsafe_base64(32)
    record.refresh_token = SecureRandom.urlsafe_base64(32)
    record.expire_access_token = DateTime.now + 1.month
    record.expire_refresh_token = DateTime.now + 6.month
  end

  def find_user(user_id: )
    Token.find_by(user_id: user_id)
  end

  def check_expired_access_token(user_id: )
    token_ins = Token.new
    token = token_ins.find_user(user_id: user_id)
    if token.expire_access_token < Time.now
      return true
    end
    false
  end

  def check_expired_refresh_token(user_id: )
    token_ins = Token.new
    token = token_ins.find_user(user_id: user_id)
    if token.expire_refresh_token < Time.now
      return true
    end
    false
  end  
end
