class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_mode_light

  private

  def set_mode_light
    # Establecer el valor de la cookie en una variable de instancia
    @modo_luz = cookies[:modo_luz] || "claro"  # "claro" es el valor por defecto
  end

  helper :page_stats
end
