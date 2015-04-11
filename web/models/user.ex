defmodule Creepcamp.User do 
 use Ecto.Model # Indique qu'il s'agit bien d'un model (et inclu tout un tas de fonction pratique )

 schema "users" do
    field :username, :string
    field :password, :string
    field :email, :string
    timestamps
  end
end
