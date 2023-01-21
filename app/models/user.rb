class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :user_projects
  has_many :projects , through: :user_projects
  has_many :created_bugs, class_name:"bugs"
  has_many :developed_bugs, class_name:"bugs"
  enum user_types: {Manager: 'Manager' , Developer: 'Developer' , TestEngineer: 'TestEngineer'}
  accepts_nested_attributes_for :projects

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable ,
         :confirmable ,
         :trackable

end
