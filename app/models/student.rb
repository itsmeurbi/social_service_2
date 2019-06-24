# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  no_control :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  has_one :exam
end
