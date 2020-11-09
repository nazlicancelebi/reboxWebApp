<%@ Page Title="Home Page" Language="C#" AutoEventWireup="false" CodeBehind="Default.aspx.cs" Inherits="WebApplicatio._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Homepage / ReBox</title>
    <meta charset="utf-8">
    <link rel="icon" href="resources/icon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.css" rel="stylesheet">
    <link href="Content/Site.css" rel="stylesheet">
    <style>
        html,
        body {
            background-repeat: repeat;
            background-image: url('resources/background2.png');
            box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
            overflow: auto;
        }

        body {
            color: #fff;
            text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
        }
        .map-text{
            color:#000;
        }
        .map-div{
            text-align: center;
        }

    </style>
</head>
<body>
    <form class="customForm" runat="server">
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <nav class="navbar fixed-top navbar-dark navbar-expand-md">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.html">
                                <img src="Resources/main.png" alt="main icon">
                            </a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarCollapse">
                            <div class="nav navbar-nav ml-auto">
                                <a class="nav-item nav-link active" href="index.html">HOME<span class="sr-only">(current)</span></a>
                                <a class="nav-item nav-link" href="about.html">ABOUT</a>
                                <a class="nav-item nav-link" href="contact.html">CONTACT</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>

            <main role="main" class="cover text-center" runat="server">
                <h1>ReBox</h1>
                <p class="lead">Find the recycle bin closest to your location.</p>
                <form>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="inputLocation" readonly="readonly" placeholder="Your location">
                    </div>
                    <div class="mb-3">
                        <a class="btn btn-lg" data-toggle="collapse" role="button" href="#maparea" aria-controls="maparea" aria-expanded="false">Find the Box</a>
                    </div>
                </form>

            </main>
            

                    <div class="collapse" id="maparea">
                        <div class="card card-body">
                            <div id="embedMap" class="maps" runat="server" style="width: 600px; height: 400px"></div>
                        </div>
                    </div>

            <footer class="mastfoot mt-auto text-center">
                <div class="inner">
                    <p>Made by <a href="https://github.com/re-box">@re-box</a>.</p>
                </div>
            </footer>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEPrOLNaCMXPAkj-imxYe1QgqMFJ6zZeg"></script>

        <script type="text/javascript">  
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (p) {
                    var LatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
                    document.getElementById("inputLocation").value = "Your location: latitude=" + p.coords.latitude + ", " + "longitude=" + p.coords.longitude;
                    var mapOptions = {
                        center: LatLng,
                        zoom: 15,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var map = new google.maps.Map(document.getElementById("embedMap"), mapOptions);
                    var marker = new google.maps.Marker({
                        position: LatLng,
                        map: map,
                        title: "<div class='map-div'><p class='map-text'>Your location</p></div>"
                    });
                    (function (marker) {
                        google.maps.event.addListener(marker, "click", function (e) {
                            infoWindow.setContent(marker.title);
                            infoWindow.open(map, marker);
                        });
                    })(marker);

                    const image = "Resources/recycle-bin.png";
                    var points = <%= WebApplicatio._Default.getBinsJson()%>;
                    var infoWindow = new google.maps.InfoWindow();
                    for (var i = 0; i < points.length; i++) {
                        var bin = points[i];
                        const bins = { lat: bin.latitude, lng: bin.longitude };
                        var marker = new google.maps.Marker({
                            position: bins,
                            animation: google.maps.Animation.DROP,
                            map: map,
                            icon: image,
                        });

                        (function (marker, bin) {

                            if (bin.type == "battery") {
                                var x = "<img src='Resources/type_battery.png'>"
                            }
                            google.maps.event.addListener(marker, "click", function (e) {
                                infoWindow.setContent(
                                    "<div class='map-div'><p class='map-text'>" + bin.name + "</p><p class='map-text'>" + x + "</p></div>"
                                );
                                infoWindow.open(map, marker);
                            });
                        })(marker,bin);
                        marker.addListener("click", toggleBounce);

                    }

                });
                    
                
            } else {
                alert('Geo Location feature is not supported in this browser.');
            }
            function toggleBounce() {
                if (marker.getAnimation() !== null) {
                    marker.setAnimation(null);
                } else {
                    marker.setAnimation(google.maps.Animation.BOUNCE);
                }
            }
            
        </script>
    </form>
</body>
</html>

