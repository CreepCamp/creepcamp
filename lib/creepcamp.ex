defmodule Creepcamp do
  # Ceci indique qu'il s'agit d'un module d'Application OTP
  # C'est notre point de depart !
  use Application

  # Cette fonction est le `main`que l'ont trouverai dans d'autre langages.
  # Les arguments donné sont ignoré ( a cause du _ qui précede le nom de l'argument)
  # Ceci dit, ils seront transmit par mix au lancement de l'application
  # type: refere au type d'application ( si elle est lancer de maniere temporaire ou permanente )
  #       cela fait surtout reference a la maniere dont elle doit etre geré par OTP
  #       qui se chargera du relancement en cas de besoin
  def start(_type, _args) do
    # Ici il est question d'importé des fonction de supervisions.
    # warn: false est un passdroit, nous ne sommes pas supposé utiliser ces fonctions de cette maniere ...
    import Supervisor.Spec, warn: false

    # Nous definission ici les differents processus OTP qui doivent etre demaré au lancement de l'applications
    # Nous reviendront la dessus plus en detail dans le ticket #4
    children = [
      # Il s'agit de demaré le serveur
      # supervisor: c'est un processus qui va surveillé l'execution d'autre processus dont il aura la charge.
      # Creepcamp.Endpoint est un module fournis par Phoenix, que vous retrouver dans lib/creepcamp/endpoint.ex
      supervisor(Creepcamp.Endpoint, []),
      # worker: c'est un processus qui va etre lancer
      # Creepcamp.Repo : il s'agit du module de connexion a la base de donnée !
      worker(Creepcamp.Repo, []),
    ]

    # Nous definissons la maniere dont va etre supervisé le systeme.
    # strategy: one_for_one indique que si un des "children" venais a s'arreté il dois etre redemaré.
    # name: Creepcamp.Supervisor indique que le module qui se tachera de faire tout ceci est Creepcamp.Supervisor.
    opts = [strategy: :one_for_one, name: Creepcamp.Supervisor]
    # Supervisor.start_link(children, opts) indique le demarage de cet arbre de supervision.
    # Le fait qu'il soit start_`link` indique que si le processus demarant venais a s'arrete, celui ci aussi devrai s'arreter.
    # Nous y reviendront plus tard.
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  # Ceci est une fonction specifiquement mise a jour pour l'usage de Phoenix
  def config_change(changed, _new, removed) do
    Creepcamp.Endpoint.config_change(changed, removed)
    :ok
  end
end
