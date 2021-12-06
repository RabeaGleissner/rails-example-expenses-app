class User < ApplicationRecord
  include PgSearch::Model

  multisearchable against: :email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
