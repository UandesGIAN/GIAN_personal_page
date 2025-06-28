# config/initializers/page_stats.rb
require "yaml"

class PageStatsMiddleware
  STATS_FILE = Rails.root.join("tmp", "page_stats.yml")

  def initialize(app)
    @app = app
  end

  def call(env)
    path = env["PATH_INFO"]
    ip = env["REMOTE_ADDR"]
    now = Time.now

    stats = File.exist?(STATS_FILE) ? YAML.load_file(STATS_FILE) : {}

    stats[path] ||= {
      "visits" => 0,
      "current_users" => {},
      "last_visit" => nil
    }

    stats[path]["visits"] += 1
    stats[path]["last_visit"] = now.to_s
    stats[path]["current_users"][ip] = now.to_s

    # Limpiar usuarios inactivos hace más de 5 minutos
    stats[path]["current_users"].delete_if do |_, t|
      Time.parse(t) < now - 300
    end

    File.write(STATS_FILE, stats.to_yaml)

    @app.call(env)
  end
end

Rails.application.config.middleware.use PageStatsMiddleware
