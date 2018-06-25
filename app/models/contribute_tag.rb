class ContributeTag < ApplicationRecord
  has_many :contributes, through: :contributes_to_tags
  has_many :contributes_to_tags, dependent: :destroy
end
