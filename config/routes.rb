Rails.application.routes.draw do
  get "pages/home"
  get "pages/about_me"
  get "pages/proyectos"
  get "pages/filosofia"
  get "pages/computacion"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "pages#home"
  get "about_me", to: "pages#about_me"
  get "proyectos(/:section(/:sub_section))", to: "pages#proyectos", as: "proyectos_subsection"
  get "computacion(/:section(/:sub_section))", to: "pages#computacion", as: "computacion_subsection"
  get "filosofia(/:section(/:sub_section))", to: "pages#filosofia", as: "filosofia_subsection"
end
