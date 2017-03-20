class Blog < ApplicationRecord
	enum status: { draft: 0, published: 1 }
	  extend FriendlyId
  friendly_id :title, use: :slugged

  #how to check for data validations in rails
  validates_presence_of :title, 
  											:body

  has_many :comments, dependent: :destroy

  belongs_to :topic 

  def self.recent
  	order("created_at DESC")
  end
end
