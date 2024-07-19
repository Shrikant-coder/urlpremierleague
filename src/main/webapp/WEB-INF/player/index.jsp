<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
        }

        .banner {
            text-align: center;
            margin-bottom: 20px;
        }

        .banner img {
            max-width: 100%;
            height: auto;
        }

        .nav-bar {
            background-color: #4CAF50;
            overflow: hidden;
        }

        .nav-bar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 17px;
        }

        .nav-bar a:hover {
            background-color: #3e8e41;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 17px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 20px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown .dropdown-content .sub-dropdown {
            position: relative;
        }

        .dropdown .dropdown-content .sub-dropdown .sub-dropdown-content {
            left: 100%;
            top: 0;
            position: absolute;
            display: none;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .dropdown .dropdown-content .sub-dropdown:hover .sub-dropdown-content {
            display: block;
        }

        .details-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            padding: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .details-container h3 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #343a40;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #555;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        tr:nth-child(even) {
            background-color: #f0f0f0;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .details-container {
                padding: 10px;
            }

            .banner img {
                width: 150px;
            }

            table {
                font-size: 0.8rem;
            }
        }

        /* Marquee effect using CSS animations */
        .marquee {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            background-color: #e9ecef;
            padding: 10px 0;
            color: #333;
            font-size: 1.2em;
            font-weight: bold;
        }

        .marquee span {
            display: inline-block;
            padding-left: 100%;
            color: red; /* Set text color to red */
            animation: marquee 25s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function fetchPlayerDetails() {
            var selectedRole = $("#role-filter").val();
            $.get("/player/players", function(data) {
                $("#details-container").empty();
                $("#details-container").append("<h3>Player Details (" + selectedRole + ")</h3>");
                var tableHtml = "<table><thead><tr><th>Name</th><th>Role</th><th>Village</th><th>Photo</th></tr></thead><tbody>";
                data.forEach(function(player) {
                    if (player.role === selectedRole || selectedRole === "All") {
                        var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                        tableHtml += "<tr><td>" + player.name + "</td><td>" + player.role + "</td><td>" + player.village + "</td><td><img src='" + imageSrc + "' height='100' width='100'></td></tr>";
                    }
                });
                tableHtml += "</tbody></table>";
                $("#details-container").append(tableHtml);
            });
        }

        function fetchOwnerDetails() {
            $.get("/owner/owners", function(data) {
                $("#details-container").empty();
                $("#details-container").append("<h3>Owner Details</h3>");
                var tableHtml = "<table><thead><tr><th>Name</th><th>Captain</th><th>Owner Photo</th><th>Captain Photo</th></tr></thead><tbody>";
                data.forEach(function(owner) {
                    var ownerimageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
                    var captainimageSrc = owner.captain.image ? "data:image/png;base64," + owner.captain.image : "";
                    tableHtml += "<tr><td>" + owner.name + "</td><td>" + owner.captain.name + "</td><td><img src='" + ownerimageSrc + "' height='100' width='100'></td><td><img src='" + captainimageSrc + "' height='100' width='100'></tr>";
                });
                tableHtml += "</tbody></table>";
                $("#details-container").append(tableHtml);
            }).fail(function() {
                alert("Error fetching owner details.");
            });
        }

        function fetchSponsorDetails() {
            $.get("/sponsors", function(data) {
                $("#details-container").empty();
                $("#details-container").append("<h3>Sponsor Details</h3>");
                var tableHtml = "<table><thead><tr><th>Name</th><th>Sneh</th><th>Amount</th><th>Photo</th></tr></thead><tbody>";
                data.forEach(function(sponsor) {
                    var imageSrc = sponsor.image ? "data:image/png;base64," + sponsor.image : "";
                    tableHtml += "<tr><td>" + sponsor.name + "</td><td>" + sponsor.post + "</td><td>" + sponsor.amount + "</td><td><img src='" + imageSrc + "' height='100' width='100'></td></tr>";
                });
                tableHtml += "</tbody></table>";
                $("#details-container").append(tableHtml);
            }).fail(function() {
                alert("Error fetching sponsor details.");
            });
        }

        $(document).ready(function() {
            fetchOwnerDetails();
            
            $("#role-filter").change(function() {
                fetchPlayerDetails();
            });
        });
    </script>
</head>
<body>
    <div class="banner">
        <header style="background-color: #4CAF50; color: white; text-align: center; padding: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h1 style="margin: 0; font-size: 2.5em;">URUL PREMIER LEAGUE</h1>
            <p style="margin: 10px 0 0; font-size: 1.2em;">Welcome to URUL PREMIER LEAGUE</p>
        </header>
    </div>

    <div class="nav-bar">
        <div class="dropdown">
            <button class="dropbtn">Menu</button>
            <div class="dropdown-content">
                <a href="#" onclick="fetchOwnerDetails()">Owner Details</a>
                <a href="#" onclick="fetchSponsorDetails()">Sponsor Details</a>
                <div class="sub-dropdown">
                    <a href="#">Player Role</a>
                    <div class="sub-dropdown-content">
                        <a href="#" onclick="$('#role-filter').val('All'); fetchPlayerDetails();">All</a>
                        <a href="#" onclick="$('#role-filter').val('Bowler'); fetchPlayerDetails();">Bowler</a>
                        <a href="#" onclick="$('#role-filter').val('Batsman'); fetchPlayerDetails();">Batsman</a>
                        <a href="#" onclick="$('#role-filter').val('All Rounder'); fetchPlayerDetails();">All Rounder</a>
                    </div>
                </div> 
            </div>
        </div>
    </div>

    <div class="container">
        <div class="marquee"><span>Important Updates: खेळाडूंचा लिलाव १३ ऑक्टोबर २०२४ ला श्री जगदंबा हायस्कूल, उरुळ येथे ठीक १०:०० वाजता सुरू होईल. तरी सर्व टीम मालक आणि कॅप्टन यांनी उपस्थित राहावे ही विनंती. तसेच, लिलावाचे लाईव्ह चित्रिकरण आपणाला इथे पाहता येईल.</span></div>
        <div class="details-container" id="details-container">
            <!-- Details will be fetched and displayed here -->
        </div>
    </div>
</body>
</html>
