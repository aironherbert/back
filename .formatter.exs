[
  line_length: 120,
  surface_line_length: 120,
  import_deps: [:ecto, :phoenix, :surface],
  inputs: [
    "lib/**/*.{ex,sface}",
    "apps/*/{lib,config,test}/**/*.{ex,exs}",
    "apps/*/mix.exs",
    "mix.exs"
  ],
  surface_inputs: ["**/*.sface"],
  subdirectories: ["priv/*/migrations"],
  plugins: [Surface.Formatter.Plugin]
]
