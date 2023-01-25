defmodule HelloPhoenixApiWeb.HelloView do
 use HelloPhoenixApiWeb, :view
 
    def render("index.json", %{}) do
    %{hello: "world"}
    end
end
