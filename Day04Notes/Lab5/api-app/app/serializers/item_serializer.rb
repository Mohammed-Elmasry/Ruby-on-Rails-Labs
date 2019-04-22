class ItemSerializer < ActiveModel::Serializer
  attributes :Item_name, :Item_description
  def Item_name
    @object.name.upcase
  end

  def Item_description
    @object.description.upcase
  end

end
