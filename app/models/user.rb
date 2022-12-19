# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  self.primary_key = 'hash_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  include PublicUid::ModelConcern

  generate_public_uid column: :hash_id, generator: PublicUid::Generators::HexStringSecureRandom.new(20)

  enum role: { ghost: 0, candidate: 1, employer: 2 }

  validates :hash_id, uniqueness: true
end
