# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
