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
  has_one :editorial, through: :level
  has_many :multiple_questions
  has_many :comprehension_questions

  def multiple_questions_qty_array
    (0..multiple_questions.count).to_a.collect do |n|
      [n, n]
    end
  end

  def comprehension_questions_qty_array
    (0..comprehension_questions.count).to_a
  end
end
