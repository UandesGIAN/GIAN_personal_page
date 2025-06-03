# config/sitemap.rb
SitemapGenerator::Sitemap.default_host = "https://gian-personal-page.onrender.com"

SitemapGenerator::Sitemap.create do
  def normalize(text)
    text.downcase
        .gsub(/[áéíóúñ]/, 'á' => 'a', 'é' => 'e', 'í' => 'i', 'ó' => 'o', 'ú' => 'u', 'ñ' => 'n')
        .gsub(' ', '_')
        .gsub(',', '')
  end
  
  urls = []

  # Rutas estáticas
  urls << ["/", {changefreq: "weekly", priority: 1.0}]
  urls << ["/sobre-mi", {}]
  urls << ["/versiones", {}]
  urls << ["/publicaciones", {}]

  # PROYECTOS
  proyectos = {
    "Youtube" => ["Origen", "Contenidos y Eras", "Mejores Trabajos", "GIAN Random", "Tier List"],
    "MikuMikuDance" => ["Origen", "WoomyGIAN", "EL TUTORIAL DE MMD SPLATOON DEFINITIVO"],
    "Videojuegos" => ["Origen", "BrinCalamar", "SquidBeatz3"],
    "Dibujos" => ["2015", "2016", "2017", "2018-19", "2023-24", "Dígitales"],
    "Música" => ["Remixes que he imaginado en mi cabeza", "Mashups realizados"],
    "Rankings" => ["Los MEJORES capítulos de algunas series que he visto", "TOP 3 Canciones X Tipo", "Todos los Videojuegos que he PROBADO y COMPLETADO", "Mis Canales de Youtube Preferidos", "Asignaturas de mi Universidad"],
    "PC" => ["Mi setup (historia)", "Montaje de computadoras", "Reparación de componentes", "Dual Boot", "Wake-On-Lan y control remoto"],
    "Electrónica" => ["Reparar enchufes y cables", "Adaptadores y Extensores", "Enchufe 220V portátil", "Luces LED"],
    "Scripts" => ["Aplicaciones concretas", "Aplicaciones con IA"],
    "Universidad" => ["Sistemas Embebidos", "Reconocimiento de gestos para apertura de casilleros"],
    "Consolas" => ["Xbox 360", "Nintendo DS", "Wii U", "Nintendo Switch"],
    "Celulares" => ["Iphone 4s", "Iphone 5c", "Samsung J1 Ace", "Iphone SE", "Iphone 12 Mini"]
  }

  proyectos.each do |section, subsections|
    section_fix = normalize(section)
    section_url = "/proyectos/#{section_fix}"
    urls << [section_url, {}]
    subsections.each do |sub|
      sub_fix = normalize(sub)
      urls << ["#{section_url}/#{sub_fix}", {}]
    end
  end

  # COMPUTACIÓN
  computacion = {
    "Python" => ["Introducción", "Listas, funciones y archivos", "Algebra Lineal", "Ecuaciones Diferenciales", "Estadística"]
  }

  computacion.each do |section, subsections|
    section_fix = normalize(section)
    section_url = "/computacion/#{section_fix}"
    urls << [section_url, {}]
    subsections.each do |sub|
      sub_fix = normalize(sub)
      urls << ["#{section_url}/#{sub_fix}", {}]
    end
  end

  # FILOSOFÍA
  filosofia = {
    "EL MÉTODO DE GIAN" => ["Las Bases", "Los Principios", "Las Opciones", "Los Consejos", "Aplicaciones"],
    "LAS MANERAS" => ["Teoría", "Aplicaciones"],
    "LOS ELEMENTOS DE VIDA" => ["Las definiciones", "Los Apartados Esenciales de Vida", "Las Sub-formas de vida", "Los Estados Compuestos", "El Ser Total", "Sobre la Amistad"],
    "Ética" => ["Universidad", "Por Gian"],
    "Teología" => ["Universidad I (Teología I)", "Universidad II (Teología II)", "Universidad III (Teología III Desafios Sociales del Cristianismo)"],
    "Arte" => ["Universidad (La belleza del Arte)"],
    "Psicología" => ["Universidad I (Los afectos y su relación con la construcción de una personalidad madura y saludable)", "Universidad II (Sociedad y Personalidad)", "Universidad III (Psicología Positiva)"]
  }

  filosofia.each do |section, subsections|
    section_fix = normalize(section)
    section_url = "/filosofia/#{section_fix}"
    urls << [section_url, {}]
    subsections.each do |sub|
      sub_fix = normalize(sub)
      urls << ["#{section_url}/#{sub_fix}", {}]
    end
  end

  # Elimina URLs duplicadas
  urls.uniq.each do |url, options|
    add url, options
  end
end