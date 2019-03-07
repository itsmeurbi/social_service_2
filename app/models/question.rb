# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint(8)
#

class Question < ApplicationRecord
end
