import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :opa_chat, OpaChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Fl00ul895lDq0+tizWCXElrOhEP95S/7EuD0HWuNayU/1a4Vx31ojals7oWFuY5t",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
