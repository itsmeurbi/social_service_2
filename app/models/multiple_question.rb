# frozen_string_literal: true
# == Schema Information
#
# Table name: multiple_questions
#
#  id              :bigint(8)        not null, primary key
#  content         :string(255)
#  value           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  correct_answ_id :bigint(8)
#

class MultipleQuestion < ApplicationRecord
end
