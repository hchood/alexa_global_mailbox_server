defmodule AlexaGlobalMailboxServer.Web.AlexaController do
  use AlexaGlobalMailboxServer.Web, :controller
  use PhoenixAlexa.Controller, :post

  def launch_request(conn, request) do
    response = %Response{}
      |> set_output_speech(%TextOutputSpeech{text: "Welcome to The Fridge."})

    conn
      |> set_response(response)
  end

  def session_end_request(conn, request) do
    conn
  end

  def intent_request(conn, "LeaveMessage", request) do
    # TODO: Store in dynamo DB
    message = request.request.intent.slots["Message"]["value"]
    text = %TextOutputSpeech{text: "Thanks for leaving the message: #{message}"}
    response = %Response{}
      |> set_output_speech(text)
      |> set_should_end_session(true)

    conn
      |> set_response(response)
  end

  def intent_request(conn, "GetMessage", _request) do
    # TODO: Fetch message(s) from dynamo DB
    text = %TextOutputSpeech{text: "This is your message."}
    response = %Response{}
      |> set_output_speech(text)
      |> set_should_end_session(true)

    conn
      |> set_response(response)
  end
end
