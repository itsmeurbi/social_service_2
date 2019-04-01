# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_options
#
#  id                        :bigint(8)        not null, primary key
#  content                   :string(255)
#  type                      :integer
#  correct                   :boolean          default(FALSE)
#  comprehension_question_id :bigint(8)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class ComprehensionOption < ApplicationRecord
  belongs_to :comprehension_question
end
