# config/initializers/page_stats.rb
require "yaml"
require "tempfile"
require "fileutils"

class PageStatsMiddleware
  STATS_FILE = Rails.root.join("tmp", "page_stats.yml")

  def initialize(app)
    @app = app
  end

  def call(env)
    path = env["PATH_INFO"]
    ip   = env["REMOTE_ADDR"]
    now  = Time.now

    # Leer YAML de forma segura
    stats = if File.exist?(STATS_FILE)
              begin
                YAML.load_file(STATS_FILE) || {}
              rescue Psych::SyntaxError
                {}
              end
    else
              {}
    end

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

    # Escritura atómica para evitar corrupción
    tmpfile = Tempfile.new("page_stats")
    tmpfile.write(stats.to_yaml)
    tmpfile.close
    FileUtils.mv(tmpfile.path, STATS_FILE)

    @app.call(env)
  end
end

Rails.application.config.middleware.use PageStatsMiddleware
