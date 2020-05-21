defmodule MyWebsocketApp.Router do
  use Plug.Router

  plug Plug.Static,
    at: "/",
    from: :my_websocket_app
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  plug :dispatch

  match _ do
    send_resp(conn, 200, "woohoo we made it\n")
  end
end