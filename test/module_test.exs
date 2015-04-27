defmodule ModuleTest do 
  use ExUnit.Case
  
  # Vous trouverez dans le dossier exemples/bases/ un fichier appelé neuron.ex
  # Dedans ce trouve la definition actuelle d'un genotype de neurone
  # Nous reviendrons plus en detail sur le pourquoi du comment plus tard
  # Mais nous allons utilisé cette base pour les explications relative au modules.


  # Le module testé est Genotype.Neuron

  # on notera que les tests avec assert matchent sur 
  # _a,_b,_c 
  # c'est simplement parce que nous n'utiliseront pas ces variables
  # mais simplement que l'on attend d'elle leur existance.
  # Sans quoi nous verions des warning a chaque lancement du test.
  test "Exemple d'un appel de fonction d'un module Elixir" do 
    assert [_a,_b,_c] = Genotype.Neuron.generate_weight(3)
  end

  test "Un module Elixir peux etre appelé par un atom" do
    assert [_a,_b,_c] = :Genotype.Neuron.generate_weight(3)
  end

  test "Un module Elixir peux etre appelé par une variable" do
    module = Genotype.Neuron
    assert [_a,_b,_c] = module.generate_weight(3)
  end

  # Ceci sert surtout a assembler des choses qu'on ne controle pas au moment de la compilation
  # Ainsi cela permet de choisir des transformations au moment de l'execution.
  test "Un exemple de MFA " do
    assert [_a,_b,_c] = apply(Genotype.Neuron, :generate_weight, [3])
    # On notera que les arguments sont forcement dans un tableau ... 
    # Même si il n'y en a qu'un.
  end


  # le module a été ecris dans exemples/bases/using.ex
  use Tools.GenerateWeight

  test "Nous pouvons utiliser maintenant generate_weight comme si de rien n'etais" do
    assert [_a,_b,_c] =  generate_weight(3)
  end

end
