defmodule ExamWeb.PirateHTML do
  use ExamWeb, :html

  embed_templates "pirate_html/*"

  @doc """
  Renders a pirate form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def pirate_form(assigns)
end
