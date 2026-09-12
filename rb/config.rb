# ArulsIp SDK configuration

module ArulsIpConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "ArulsIp",
        "slug" => "aruls-ip",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://api.aruljohn.com",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "ip_address" => {},
          "ipn" => {},
        },
      },
      "entity" => {
        "ip_address" => {
          "fields" => [
            {
              "name" => "ip",
              "req" => true,
              "short" => "The client's IP address",
              "type" => "`$STRING`",
            },
          ],
          "name" => "ip_address",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/ip/json",
                  "segments" => [
                    {
                      "lit" => "ip",
                    },
                    {
                      "lit" => "json",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "ip",
                    "json",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "ipn" => {
          "fields" => [],
          "name" => "ipn",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/ip",
                  "segments" => [
                    {
                      "lit" => "ip",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "ip",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    ArulsIpFeatures.make_feature(name)
  end
end
