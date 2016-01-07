defmodule Mailman.PlainComposer do
  @moduledoc "Provides functions for rendering just from strings"

  def compile_part(config, :html, %{html: html}) do
    html
  end

  def compile_part(config, :text, %{text: text}) do
    text
  end

  def compile_part(_config, :attachment, attachment) do
    attachment.data
  end
end

defmodule Mailman.PlainComposeConfig do
  @moduledoc "Defines the config for the Plain composer"
    defstruct markdown: false
end

defimpl Mailman.Composer, for: Mailman.PlainComposeConfig do
  def compile_part(config, mode, email) do
    Mailman.PlainComposer.compile_part(config, mode, email)
  end
end
