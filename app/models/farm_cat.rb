class FarmCat < ActiveRecord::Base
  belongs_to :has_farm_cats, :polymorphic => true
  
  belongs_to :farm_cat
  has_many :sub_cats, :class_name => 'FarmCat', :foreign_key => 'farm_cat_id'
  
  validates :name, :presence => true
end