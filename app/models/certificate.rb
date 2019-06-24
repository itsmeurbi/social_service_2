# == Schema Information
#
# Table name: certificates
#
#  id                   :bigint(8)        not null, primary key
#  date                 :date
#  exam_id              :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  certificate_parts_id :bigint(8)
#

class Certificate < ApplicationRecord
end
