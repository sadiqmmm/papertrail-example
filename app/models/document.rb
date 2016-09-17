class Document < ApplicationRecord
  belongs_to :user
  
  has_paper_trail

  def user_name
    user ? user.name : ''
  end

  def find_version_author_name(version)
    user = User.find_version_author(version) 
    user ? user.name : ''
  end

end
