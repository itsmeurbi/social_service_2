# frozen_string_literal: true

# == Schema Information
#
# Table name: editorials
#
#  id           :bigint(8)        not null, primary key
#  id_editorial :string(255)
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class Editorial < ApplicationRecord
  has_many :levels
  has_many :periods

  has_many :multiple_questions, through: :levels

end
