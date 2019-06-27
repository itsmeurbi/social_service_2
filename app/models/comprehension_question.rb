# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_questions
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)
#  value      :integer
#  lecture    :text(4294967295)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint(8)
#

class ComprehensionQuestion < ApplicationRecord
  has_many :multiple_questions
  accepts_nested_attributes_for :multiple_questions, reject_if: :all_blank, allow_destroy: true

  has_one_attached :file

  belongs_to :unit
  has_one :editorial, through: :unit

  def print_q
    if file.attached?
      "Pregunta #{id} | Imagen | Unidad #{unit.id}"
    else
      "Pregunta #{id} | Texto | Unidad #{unit.id}"
    end
  end
end
