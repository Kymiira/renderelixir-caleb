defmodule MagicWord.MixProject do
    use Mix.Project

    def project do
        [
            app: :magic_word,
            version: "0.1.0",
            elixir: "~> 1.16",
            start_permanent: Mix.env() == :prod,
            deps: deps()
        ]
    end

    def application do
        [
            extra_applications: [:logger],
            mod: {MagicWord.Application, []}
        ]
    end
    
    defp deps do
        [
            {:plug, "~> 1.15"},
            {:plug_cowboy, "~> 2.6"},
            {:jason, "~> 1.4"} # JSON parser
        ]
    end

end
