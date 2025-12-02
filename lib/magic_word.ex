defmodule MagicWord do
    use Plug.Router

    plug Plug.Parsers,
        parsers: [:urlencoded, :multipart, :json],
        pass: ["*/*"],
        json_decoder: Jason

    plug :match
    plug :dispatch

    @html """
    <!DOCTYPE html>
    <html>
    <head>
        <title>elixirisbad</title>
    </head>
    <body>
        <h3 align=center>Render-submit-caleb.exs</h3>
        <form action="/" method="post">
            <label for="myText01">Enter Text:</label>
            <input type="text" id="myText01" name="myText01" value="caleb">
            <input type="submit" value="Submit">
        </form>
        REPLACE_ME
    </body>
    </html>
    """

    defp page(result) do
        String.replace(@html, "REPLACE_ME", result)
    end

    get "/" do
        result = "<span style=`color:red`> Try the magic word \"caleb\"</span>"
        send_resp(conn, 200, page(result))
    end

    post "/" do
        word = conn.params["myText01"]

        result =
            if word == "caleb" do
                "<b style='color:green'> Cool! </b>"
            else
                "<span style='color:red'> Try the magic word \"caleb\"</span>"
            end
        send_resp(conn, 200, page(result))
    end

    match _ do
        send_resp(conn, 404, "Not found")
    end

end
