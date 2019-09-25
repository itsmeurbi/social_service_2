# frozen_string_literal: true

# == Schema Information
#
# Table name: certificates
#
#  id                   :bigint           not null, primary key
#  date                 :date
#  exam_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  certificate_parts_id :bigint
#

class Certificate < ApplicationRecord
end
