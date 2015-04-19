defmodule Creepcamp.Repo do
  # Ceci finalement est notre "connexion" a la base de donnee.
  use Ecto.Repo, otp_app: :creepcamp
  # Par cette ligne, nous indiquons deux choses:
  # * Il s'agit d'un Repo (pour repository) c'est a dire notre lien vers la base de donnée.
  # * Ce repo ce sert de la configuration incluse dans l'application OTP nommé :creepcamp ( comme indiqué dans mix.exs )
end
