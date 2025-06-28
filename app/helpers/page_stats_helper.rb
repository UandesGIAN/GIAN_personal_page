# app/helpers/page_stats_helper.rb
module PageStatsHelper
  def stats_for_page(path)
    stats = YAML.load_file(Rails.root.join("tmp", "page_stats.yml")) rescue {}
    stats[path] || { "visits" => 0, "current_users" => {}, "last_visit" => nil }
  end
end
