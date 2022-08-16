class Client < ApplicationRecord

        validates :number_auto, presence: true
        validates :brand_auto, presence: true
        validates :model_auto, presence: true
        validates :km, presence: true

        has_many :problem_users

        accepts_nested_attributes_for :problem_users

end

