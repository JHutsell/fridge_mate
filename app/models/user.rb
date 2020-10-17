class User < ApplicationRecord
    has_many :ingredients
    has_many :recipes, through: :user_recipes

    has_secure_password
    validates_presence_of :username, :name, :password
    validates_uniqueness_of :username
end
