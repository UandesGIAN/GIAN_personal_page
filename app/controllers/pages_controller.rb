class PagesController < ApplicationController
  def home
  end

  def about_me
  end

  def proyectos
    @section = params[:section]
    @sub_section = params[:sub_section]

    @subsections = {
      "Youtube" => ["Origen", "Contenidos y Eras", "Mejores Trabajos", "GIAN Random", "Tier List"],
      "MikuMikuDance" => ["Origen", "WoomyGIAN", "EL TUTORIAL DE MMD SPLATOON DEFINITIVO"],
      "Videojuegos" => ["Origen", "BrinCalamar", "SquidBeatz3"],
      "Dibujos" => ["2015", "2016", "2017", "2018-19", "2023-24"],
      "Música" => ["Remixes que he imaginado en mi cabeza", "Mashups realizados"],
      "Rankings" => ["Los MEJORES capítulos de algunas series que he visto", "TOP 3 Canciones X Tipo", "Todos los Videojuegos que he PROBADO y COMPLETADO", "Mis Canales de Youtube Preferidos", "Asignaturas de mi Universidad"],
      "PC" => ["Mi setup (historia)", "Montaje de computadoras", "Reparación de componentes", "Dual Boot", "Wake-On-Lan y control remoto"],
      "Electrónica" => ["Reparar enchufes y cables", "Adaptadores y Extensores", "Enchufe 220V portátil", "Luces LED"],
      "Scripts" => ["Aplicaciones concretas", "Aplicaciones con IA"],
      "Universidad" => ["Sistemas Embebidos", "Reconocimiento de gestos para apertura de casilleros"],
      "Consolas" => ["Xbox 360", "Nintendo DS", "Wii U", "Nintendo Switch"],
      "Celulares" => ["Iphone 4s", "Iphone 5c", "Samsung J1 Ace", "Iphone SE", "Iphone 12 Mini"]
    }
    

    @indice_content = render_to_string(partial: "shared/indice", locals: {
      type_url: "proyectos",
      section: @subsections.keys,
      sub_section: @sub_section,
      subsections: @subsections
    })

    if @section
      if @sub_section
        template_path = "pages/proyectos/#{@section}/#{@sub_section}"
        render template: template_path
      else
        @current_section_subsections = @subsections[@section] || []
        render template: "pages/proyectos/#{@section}"
      end
    else
      @sections = @subsections.keys
      render template: "pages/proyectos"
    end
  rescue ActionView::MissingTemplate
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def computacion
    @section = params[:section]
    @sub_section = params[:sub_section]

    @subsections = {
      "Python" => [ "Introducción", "Listas, funciones y archivos", "Algebra Lineal", "Ecuaciones Diferenciales", "Estadística" ]
    }

    @indice_content = render_to_string(partial: "shared/indice", locals: {
      type_url: "computacion",
      section: @subsections.keys,
      sub_section: @sub_section,
      subsections: @subsections
    })

    if @section
      if @sub_section
        template_path = "pages/computacion/#{@section}/#{@sub_section}"
        render template: template_path
      else
        @current_section_subsections = @subsections[@section] || []
        render template: "pages/computacion/#{@section}"
      end
    else
      @sections = @subsections.keys
      render template: "pages/computacion"
    end
  rescue ActionView::MissingTemplate
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def filosofia
    @section = params[:section]
    @sub_section = params[:sub_section]

    @subsections = {
    "EL MÉTODO DE GIAN" => [ "Las Bases", "Los Principios", "Las Opciones", "Los Consejos" ],
    "LAS MANERAS" => ["Teoría", "Aplicaciones"],
    "LOS ELEMENTOS DE VIDA" => ["Las Definiciones", "Los Apartados Esenciales de Vida", "Las Sub-formas de vida", "Los Estados Compuestos", "El Ser Total", "Sobre la Amistad"],
    "Ética" => ["Universidad", "Por Gian"],
    "Teología" => ["Universidad I (Teologia I)", "Universidad II (Teologia II)", "Universidad III (Teologia III Desafios Sociales del Cristianismo)"],
    "Arte" => ["Universidad (La belleza del Arte)"],
    "Psicología" => ["Universidad I (Los afectos y su relación con la construcción de una personalidad madura y saludable)", "Universidad II (Sociedad y Personalidad)", "Universidad III (Psicología Positiva)"],
    }

    @indice_content = render_to_string(partial: "shared/indice", locals: {
      type_url: "filosofia",
      section: @subsections.keys,
      sub_section: @sub_section,
      subsections: @subsections
    })

    if @section
      if @sub_section
        template_path = "pages/filosofia/#{@section}/#{@sub_section}"
        render template: template_path
      else
        @current_section_subsections = @subsections[@section] || []
        render template: "pages/filosofia/#{@section}"
      end
    else
      @sections = @subsections.keys
      render template: "pages/filosofia"
    end
  rescue ActionView::MissingTemplate
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
