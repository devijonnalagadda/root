class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :organization
  has_many :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :timeoutable, :trackable, :validatable, :lockable

  
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }

  accepts_nested_attributes_for :organization
  
   #protected

   #def serializable_hash(options = nil) 
    #super(options).merge(sign_in_count: sign_in_count, current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at, current_sign_in_ip: current_sign_in_ip, last_sign_in_ip: last_sign_in_ip) # you can keep adding attributes here that you wish to expose
  #end

end
