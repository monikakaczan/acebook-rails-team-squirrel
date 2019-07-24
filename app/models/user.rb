class User < ApplicationRecord
  has_many :posts, dependent: :destroy



  validates :email, presence: true, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, :presence => true,
                      :confirmation => true,
                      :length => { :within => 6..10 },
                      :on => :create
  validates :password, :confirmation => true,
                       :length => { :within => 6..10 },
                       :allow_blank => true,
                       :on => :update


 has_secure_password

end
