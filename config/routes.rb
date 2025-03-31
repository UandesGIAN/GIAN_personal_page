Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  # SPANISH
  root "pages#home"
  get "sobre-mi", to: "pages#about_me"
  get "versiones", to: "pages#versiones"
  get "publicaciones", to: "pages#publicaciones"
  get "proyectos(/:section(/:sub_section))", to: "pages#proyectos", as: "proyectos_subsection"
  get "computacion(/:section(/:sub_section))", to: "pages#computacion", as: "computacion_subsection"
  get "filosofia(/:section(/:sub_section))", to: "pages#filosofia", as: "filosofia_subsection"
end
