defmodule MagicWord.Application do
    use Application

    def start(_type, _args) do
        port =
            System.get_env("PORT")
            |> case do
                nil -> 3000
                num -> String.to_integer(num)
            end

        children = [
            {
                Plug.Cowboy,
                scheme: :http,
                plug: MagicWord,
                options: [
                    ip: {0, 0, 0, 0},
                    port: port
                ]
            }
        ]

        opts = [strategy: :one_for_one, name: MagicWord.Supervisor]
        Supervisor.start_link(children, opts)
    end
end