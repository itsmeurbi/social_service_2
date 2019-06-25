# frozen_string_literal: true

# == Schema Information
#
# Table name: certificate_parts
#
#  id         :bigint(8)        not null, primary key
#  header     :string(255)
#  body       :text(65535)
#  footer     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class CertificatePart < ApplicationRecord
end
