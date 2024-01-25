defmodule BlockScoutWeb.SocialMedia do
  @moduledoc """
  This module provides social media links
  """

  @services %{
    facebook: "https://www.facebook.com/eronproject",
    instagram: "https://www.instagram.com/eron_project",
    twitter: "https://www.twitter.com/EronProject",
    telegram: "https://t.me/eroncoin"
  }

  def links do
    :block_scout_web
    |> Application.get_env(__MODULE__, [])
    |> Enum.reverse()
    |> filter_and_build_links()
  end

  defp filter_and_build_links(configured_services) do
    for {name, account} <- configured_services, Map.has_key?(@services, name) do
      {name, @services[name] <> account}
    end
  end
end
