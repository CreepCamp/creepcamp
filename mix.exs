defmodule Creepcamp.Mixfile do
  # Ce fichier decris l'application que nous sommes entrain de développer
  # Il s'agit d'une application OTP, comme je vous l'indiquerai plus tard cela veux dire qu'il s'agit d'une application ERLANG, qui s'integrera dans la framework OTP. 
  # Cela prend en charge entre autre, des script de demarage et d'arret, des methodes de controle de dépendances, configuration,  etc ...
  # Somme tout c'est tres pratique et demande juste un peu d'entretient de notre part, dont par exemple ce fichier.
  use Mix.Project


  # Cette fonction definit concretement quel est notre application,
  # C'est des meta informations globalement volatile et purement documentaire.
  # Mais on dois noté par exemple que le projet s'appel :creepcamp
  # C'est une information importante dans d'autre contextes.
  # On peux noté qu'elle s'appuis sur la version d'Elixir d'au moins 1.0
  # Et dont les dependances sont indiqué par la fonction deps.
  def project do
    [app: :creepcamp,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web", "exemples"],  # On notera juste qu'exemples est rajouté a la compilation pour le rendre disponible dans IEX.
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Comme indiqué par le commentaire créer par le generateur de projet
  # si vous taper la commande `$ mix help compile.app`
  # Vous obtiendrez un tas d'informations complementaire sur cette fonction.
  # Mais afin de faire sa rapidement en francais voici ce qu'il y est dit en deux mots:
  # application retourne un Dictionnaire qui peux contenir ces informations:
  # * mod: (obligatoire) c'est le point de depart du projet il dois contenir une fonction start() 
  #       qui peux eventuellement demander des parametres (que vous pouvé entré ici entre [] ). mod: {Module, [Parametre]}
  # * applications: indique les autres applications OTP que vous voullez demarré 
  # * registered: ce champs indique le nom des processus unique, c'est important pour evité
  #   certains conflits entre application. Nous reviendrons la dessus quand nous aborderont le communication interprocess et OTP 
  def application do
    [mod: {Creepcamp, []},
     applications: [:phoenix, :cowboy, :postgrex, :ecto, :logger]]
  end

  # Cette fonction permet de decrire les dependances de l'applications.
  # C'est son contenu qui va permettre a mix deps.* de cherché le contenu approprier.
  # Elle retourne une liste de tuple qui suivent a peu pret cette logique :
  # { :nomdeladependance, {:source, addresse}, "version"}
 defp deps do
  [
    # Par exemple, ici on recupere la derniere version de phoenix via github.
    {:phoenix, github: "phoenixframework/phoenix"},
    # Ici nous récuperons cowboy, une framework de serveur web via hex, le gestionnaire de packet d'elixir
    {:cowboy, "~> 1.0.0"},
    # De même pour postgrex, le client postgres pour elixir
    {:postgrex, ">= 0.0.0"},
    # Et pour finir Ecto.
    {:ecto, "~> 0.10.2"}
  ]
 end 
end
