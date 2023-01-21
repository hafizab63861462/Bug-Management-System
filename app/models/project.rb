class Project < ApplicationRecord
    has_many :user_projects , dependent: :destroy
    has_many :users , through: :user_projects, dependent: :destroy
    has_many :bugs, dependent: :destroy

    validates :name , :description , :presence => true
    validates :name , :length => { :minimum => 2 }
    validates :name , :uniqueness => true

end
