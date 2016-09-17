class Document < ApplicationRecord
 
  belongs_to :user
  
  has_paper_trail class_name: 'DocumentVersion', 
                meta: { author_username: :user_name, word_count: :count_word } 

  def count_word
    content.split(' ').count
  end              
end
