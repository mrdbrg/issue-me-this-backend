class Issue < ApplicationRecord
  has_many :comments
  belongs_to :user

  def comment_details 
    self.comments.collect { |com|
      {
        id: com.id,
        user: {
          id: com.user.id,
          name: com.user.name,
          profession: com.user.profession,
          avatar: com.user.avatar
        },
        comment_body: com.comment_body,
        title: com.title
      }
    }
  end
  
  def user_info
    {
      id: self.user.id,
      name: self.user.name,
      age: self.user.age,
      profession: self.user.profession,
      avatar: self.user.avatar
    }
  end
end
