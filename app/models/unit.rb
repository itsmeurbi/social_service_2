# frozen_string_literal: true

# == Schema Information
#
# Table name: units
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  name       :string(255)
#  level_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Unit < ApplicationRecord
  belongs_to :level
  has_many :multiple_question
end
