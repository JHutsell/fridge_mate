class User < ApplicationRecord
    has_many :ingredients
    has many :recipes, through: :user_recipes

    has_secure_password
    validates_presence_of :user_name
    validates_uniqueness_of :user_name
end
