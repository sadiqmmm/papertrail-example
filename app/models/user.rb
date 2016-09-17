class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :documents
  
  def self.find_version_author(version)
    find(version.terminator)   
  end     
  
  def find_version_author_name(version)
    user = User.find_version_author(version) 
    user ? user.name : ''
  end  
end
