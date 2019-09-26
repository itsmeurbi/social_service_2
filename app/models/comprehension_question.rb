# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_questions
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  value      :integer
#  lecture    :text(4294967295)
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint
#

class ComprehensionQuestion < ApplicationRecord
  has_many :multiple_questions, dependent: :destroy
  accepts_nested_attributes_for :multiple_questions, reject_if: :all_blank, allow_destroy: true

  has_one_attached :file

  belongs_to :unit
  belongs_to :user
  has_one :editorial, through: :unit

  def print_q
    if file.attached?
      "Pregunta #{id} | Imagen | Unidad #{unit.id}"
    else
      "Pregunta #{id} | Texto | Unidad #{unit.id}"
    end
  end
end
