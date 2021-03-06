class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email
  def full_name
    object.full_name
  end
  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
