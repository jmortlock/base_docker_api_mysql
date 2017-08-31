defmodule BaseDockerApiMysqlWeb.PageController do
  use BaseDockerApiMysqlWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
