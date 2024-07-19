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
            padding: 10px;
            color: white;
            text-align: center;
            position: relative;
        }

        .nav-bar .dropdown {
            position: relative;
            display: inline-block;
        }

        .nav-bar .dropbtn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .nav-bar .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            text-align: left;
            top: 100%; /* Position below the button */
            left: 0;
        }

        .nav-bar .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .nav-bar .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .nav-bar .dropdown:hover .dropdown-content {
            display: block;
        }

        .nav-bar .sub-dropdown {
            position: relative;
            display: inline-block;
        }

        .nav-bar .sub-dropdown-content {
            display: none;
            position: absolute;
            top: 0;
            left: 100%;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            text-align: left;
        }

        .nav-bar .sub-dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .nav-bar .sub-dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .nav-bar .sub-dropdown:hover .sub-dropdown-content {
            display: block;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
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

        /* Responsive adjustments */
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
            color: red;
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
        // Function to fetch and display player details based on role
        function fetchPlayerDetails(role) {
            $.get("/player/players", function(data) {
                $("#details-container").empty();
                $("#details-container").append("<h3>Player Details (" + role + ")</h3>");
                var tableHtml = "<table><thead><tr><th>Name</th><th>Role</th><th>Village</th><th>Photo</th></tr></thead><tbody>";
                data.forEach(function(player) {
                    if (player.role === role || role === "All") { // Filter by selected role or show all
                        var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                        tableHtml += "<tr><td>" + player.name + "</td><td>" + player.role + "</td><td>" + player.village + "</td><td><img src='" + imageSrc + "' height='100' width='100'></td></tr>";
                    }
                });
                tableHtml += "</tbody></table>";
                $("#details-container").append(tableHtml);
            });
        }

        $(document).ready(function() {
            // Function to show dropdown menu and fetch player details
            $(".player-details").click(function(event) {
                event.preventDefault();
                $("#player-dropdown").toggle(); // Toggle player dropdown visibility
            });

            // Event listener for role selection
            $("#player-dropdown a").click(function(event) {
                event.preventDefault();
                var selectedRole = $(this).text(); // Get the text of the clicked link
                fetchPlayerDetails(selectedRole); // Fetch player details based on selected role
            });

            // Load player details by default when page loads
            fetchPlayerDetails("All");
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
                    <a href="#" class="player-details">Player Details</a>
                    <div id="player-dropdown" class="sub-dropdown-content">
                        <a href="#">All</a>
                        <a href="#">Bowler</a>
                        <a href="#">Batsman</a>
                        <a href="#">All Rounder</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="details-container" id="details-container">
            <!-- Details will be fetched and displayed here -->
        </div>
    </div>

    <div class="container">
        <div class="marquee"><span>Important Updates: खेळाडूंचा लिलाव १३ ऑक्टोबर २०२४ ला श्री जगदंबा हायस्कूल उरुल येथे ठीक १०:०० वाजता सुरू होईल. तरी सर्व टीम मालक आणि कॅप्टन यांनी उपस्थित राहावे ही विनंती. तसेच, लिलावाचे लाईव्ह चित्रिकरण आपणाला इथे पाहता येईल.</span></div>
    </div>
</body>
</html>
