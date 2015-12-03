class FarmCat < ActiveRecord::Base
  belongs_to :has_farm_cats, :polymorphic => true
  
  # has_many :events
  
  belongs_to :farm_cat
  has_many :sub_cats, :class_name => 'FarmCat', :foreign_key => 'farm_cat_id'
  
  validates :name, :presence => true
  
  def FarmCat.for_class(klass)
    FarmCat.where(:master_class => klass)
  end
end