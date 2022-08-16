class Client < ApplicationRecord

        validates :number_auto, presence: true
        validates :brand_auto, presence: true
        validates :model_auto, presence: true
        validates :km, presence: true


end
