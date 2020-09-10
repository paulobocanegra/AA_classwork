# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  details    :string           not null
#  status     :boolean          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
    validates :name, :details, presence: true
    validates :status, inclusion: {in: [true, false] }
    belongs_to :user
end
