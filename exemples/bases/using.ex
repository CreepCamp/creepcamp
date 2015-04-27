
# Pour le moment nous n'avons pas besoin d'externalisé la fonction generate_weight
# Mais si cela devais s'averé utile, nous pourrions le faire comme suit:

defmodule Tools.GenerateWeight do 
  # defmacro permet de generé des macros (ahah)
  # comprendre, cela permet de definir des nouveaux mot clé.
  # Le cas de __using__ est spécial, je n'entrerai pas trop dans les details.
  # mais en guise de complement, vous aurez noté la syntaxe particuliere de 
  # "test" que nous utilisons tout le long du fichier
  # il s'agit d'une macro definie dans le module ExUnit.Case
  defmacro __using__(_opts) do
    # quote indique que le code n'est pas évalué ici
    # mais qu'il le sera ... plus tard :)
    # Si on veux rendre une partie de ce qu'il y a entre quote
    # dynamique ou reactif, il suffit d'indiqué les zones 
    # qui doivent etre compilée avec unquote.
    # Plus de detail dans un prochain ticket, peut etre :)
    quote do
      def generate_weight(vector_length) do 
      generate_weight(vector_length, [])
      end

      def generate_weight(0, acc), do: acc

      def generate_weight(vl, acc) do
        generate_weight(vl-1,[:random.uniform() - 0.5| acc])
      end
    end
  end

end
