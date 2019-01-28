class User < ApplicationRecord
	attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :organization
  has_many :projects, dependent: :delete_all

  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :timeoutable, :trackable, :validatable, :lockable

  
  validates :name,:presence => true,
                 format: {  with: /\A[a-zA-Z\s]+\z/ },
                 :length => { :maximum => 30 }

  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }               

  accepts_nested_attributes_for :organization

  User.where(:gauth_secret => nil).find_each do |user|
  user.send(:assign_auth_secret)
  user.save!
  end
  
   #protected

   #def serializable_hash(options = nil) 
    #super(options).merge(sign_in_count: sign_in_count, current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at, current_sign_in_ip: current_sign_in_ip, last_sign_in_ip: last_sign_in_ip) # you can keep adding attributes here that you wish to expose
  #end

end
