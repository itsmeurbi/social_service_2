# frozen_string_literal: true

# == Schema Information
#
# Table name: levels
#
#  id           :bigint(8)        not null, primary key
#  number       :integer
#  editorial_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Level < ApplicationRecord
  belongs_to :editorial
  has_many :units
end
