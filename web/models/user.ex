defmodule Creepcamp.User do 
 use Ecto.Model # Indique qu'il s'agit bien d'un model (et inclu tout un tas de fonction pratique )

 # Ceci indique que le model dois se calqué comme suit : 
 # Table "users"
 schema "users" do
    # Un champs username de type string
    field :username, :string
    # Un champs password de type string
    field :password, :string
    # Un champs email de type string
    field :email, :string
    # Un champs created_at et un autre updated_at de type datetime. 
    # La fonction timestamps créé les deux.
    timestamps
    # Ce n'est pas toujours tres utile, mais quand ces champs existes, lors des insertions et mises a jour, le champs est automatiquement mis a jours. 
  end
end
