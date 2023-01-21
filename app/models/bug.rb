class Bug < ApplicationRecord
     belongs_to :user
     belongs_to :project
     belongs_to :creator, class_name: "User", foreign_key: "user_id"
     belongs_to :developer , class_name: "User", foreign_key: "dev_id" , optional: true

     mount_uploader :image, ImageUploader
      Type = ["Feature", "Bug" ]
      Bug_status = ["New" , "Started" , "Completed" ]


     validates :title , :status , :bug_type , :presence => true
     validates :title , :length => { :minimum => 2 }
     validates :title , :uniqueness => true
   

end
