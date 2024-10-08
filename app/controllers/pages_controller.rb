class PagesController < ApplicationController
  def home
  end

  def about_me
  end

  def proyectos
    @section = params[:section]
    @sub_section = params[:sub_section]

    @subsections = {
      "Youtube" => [ "Origen", "Contenidos", "Proyectos Principales", "Logros"],
      "MikuMikuDance" => [ "Origen", "Proyectos Principales", "Logros" ],
      "Por aburrimiento" => [ "Escritos", "Tier Lists", "Juegos" ],
      "Favores" => [ "Videos", "Documentos" ],
      "Experimentos" => [ "PC", "Electrónica" ],
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
      "Python" => [ "Historia y Origen", "Básico", "Intermedio", "Algebra Lineal", "Ecuaciones Diferenciales", "Estadística" ]
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
    "LAS MANERAS" => []
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
