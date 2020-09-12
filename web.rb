require 'uri'
require 'net/http'
require 'json' 
require 'openssl'

def request(url, key)
    adress = url + key
    url = URI(adress)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl =true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)
    return JSON.parse(response.read_body)
    
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a")

# print data["photos"].to_a
#No funciona con variables,definir directamente el contenido a los argumentos
# variable fotos .class hash

#Metodo 2

# print data.keys = ["Photos"], 

# new_data=[]
# data["photos"].each do |data| 
#    new_data << data["img_src"]
# end 
# puts new_data

#q = new_data.count

new_data=[]
data["photos"].each do |data| 
new_data << data["img_src"]
end 

def buid_web_page(new_data)

li = ''
new_data.each do |new_data|
li += "\t\t <li><img src='#{new_data}'></li>\n"
end

return li
end


#Pregunta bonus / # Como cantidad de id hay cantidad de fotos si preguntamos por camaras

camera_fhaz = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=','uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')
fhaz = []
camera_fhaz["photos"].each do |camera_fhaz|
    fhaz << camera_fhaz["id"] 
end

name = ["FHAZ"]
fhaz = fhaz.length # Fhaz = 2 
final = name.zip(fhaz).to_a

camera_rhaz = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=rhaz&api_key=','uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')
rhaz = []
camera_rhaz["photos"].each do |camera_rhaz|
    rhaz << camera_rhaz["id"] 
end

rhaz = rhaz.length   # Rhaz = 2 
# print rhaz

camera_mast = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=mast&api_key=','uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')
mast = []
camera_mast["photos"].each do |camera_mast|
    mast << camera_mast["id"] 
end

mast = mast.length   # MAST = 838
# print mast

camera_chemcam = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=chemcam&api_key=','uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')
chemcam = []
camera_chemcam["photos"].each do |camera_chemcam|
    chemcam << camera_chemcam["id"] 
end

chemcam = chemcam.length   # chemcam = 4
# print chemcam

camera_navcam = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=NAVCAM&api_key=','uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')
navcam = []
camera_navcam["photos"].each do |camera_navcam|
    navcam << camera_navcam["id"] 
end

navcam = navcam.length # 10 NAVCAM

total_ = navcam + chemcam + mast + rhaz + fhaz
puts total_

# rovers1 = curiosity ( fhaz, rhaz, mastil, chemcam, mahli, mardi, navcam)
# rovers2 = opportunity (fhaz, rhaz, navcam, pancam,minitos)
# rovers3 = spirit (fhaz,rhaz, navcam, pancam, minitos)



def head
    '<!DOCTYPE html>
    <html lang="es">
    
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/png" href="./assets/img/favicon.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Sebastian Venegas">
        <meta name="description" content="Photos Rovers Mars, API NASA">
        <meta name="keywords" content="Mars, Nasa, Rovers, Photo Nasa">
    
        <title>Mars Rover</title>
        <!--Bootstrap 4.5.0-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
            integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
        <!--Font Awe-->
        <script src="https://kit.fontawesome.com/6a3cb15231.js" crossorigin="anonymous"></script>
    
        <!--Google Font-->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;500&display=swap" rel="stylesheet">
        <!--CSS-->
        <link rel="stylesheet" href="./assets/css/style.css">
    </head>
    
    <body>'
end

    def nav
        '<nav class="navbar navbar-expand-lg bg-dark navbar-light py-2 ">
            <div class="container">
                <a class="navbar-brand py-0" href="#" style="color: white; font-weight: 700;">MARS ROVERS</a>
                <button class="navbar-toggler change" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav ml-auto">
                        <a class="nav-link text-white" href="#contact">CONTACTO</a>
                    </div>
                </div>
            </div>
        </nav>'
    end

    def header
        '<header>
    
            <div class="container-fluid px-0">
                <figure>
                    <img src="./assets/img/header-img.jpg" alt="bg-hero" class="img-fluid">
                </figure>
            </div>
        </header>'
    end

    def section
        '<section>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6">
                        <hr class="d-none d-sm-block d-md-none d-block d-sm-none">
                        <figure>
                            <img class="w-100 pb-0" src="./assets/img/bg-hero.jpg" alt="ROVERS">
                        </figure>
    
                    </div>
    
                    <div class="col-md-6">
    
                        <p class="text-md-center pt-5 mt-5 text-white ">Un Mars rover es un vehículo motorizado que se
                            desplaza por la superficie de Marte a su llegada. Estos vehículos tienen varias ventajas
                            respecto los módulos de aterrizaje estacionarios: son capaces de examinar áreas de territorio
                            más amplio, pueden ser dirigidos a zonas con interés científico, pueden situarse en posiciones
                            donde reciben luz solar durante los meses de invierno y son capaces de obtener conocimiento del
                            entorno para ser controlados de forma remota.
                        </p>
                        <hr style="border: solid 1px white;">
                        <p class="porciones-pizza mb-4"> CURIOSITY - OPPORTUNITY - SPIRIT</p>
    
                    </div>
                </div>
    
    
    
            </div>
        </section>

        <ul>'
        
    end

   

    def scripts
        "\t\s"'</ul>

        <!--JQuery 3.5.1 uncompressed-->
        <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
        <!--Popper.js 1.16.0-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
        <!--Bootstrap JS 4.5.0-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
        <!--My script-->
        <script src=""></script>
    
    </body>
    
    <html>'
    end

    index = head() + nav() + header() + section() + "\n" + buid_web_page(new_data)+ scripts()
    
    File.write("./index.html", index)