class Recipe < ActiveRecord::Base
  attr_accessible :title, :url, :directions, :image, :servings, :time, :rating, :reviewcount, :quantities_attributes
  has_many :quantities
  has_many :ingredients, :through => :quantities
  accepts_nested_attributes_for :quantities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |ing| ing[:content].blank? }

  validates :title, :directions, :url, :presence => true
  # ! Ensure that per recipe creation, you don't create duplicate ingredient records

  def self.has_ingredients?(ingredients)
    ingredients.each do |ingredient|
      self.ingredients.include?
      # boolean on if the recipe includes all ingredients
    end
  end
  
  def network
    "allrecipes.com" if self.url.include? "allrecipes"
  end
  
end


