# frozen_string_literal: true

class Student < ApplicationRecord
  has_one :exam
end
