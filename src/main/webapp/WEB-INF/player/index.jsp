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
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .banner {
            text-align: center;
            margin-bottom: 20px;
        }

        .banner img {
            width: 200px;
            height: auto;
        }

        .filter-section {
            margin-bottom: 20px;
            text-align: center;
        }

        .filter-section label {
            font-weight: bold;
            margin-right: 10px;
        }

        .filter-section select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #fff;
            color: #555;
            width: 150px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Same font as body */
        }

        .filter-section button {
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Same font as body */
        }

        .details-container {
            width: 100%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Same font as body */
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

        .sidebar {
            width: 100%;
            text-align: left;
            padding: 20px;
            background-color: #343a40;
            border-radius: 10px;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Same font as body */
            margin-bottom: 20px;
        }

        .sidebar h3 {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-bottom: 2px solid #fff;
            padding-bottom: 10px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            margin-bottom: 15px;
        }

        .sidebar li a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
        }

        .sidebar li a:hover {
            text-decoration: underline;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Function to fetch and display player details
        function fetchPlayerDetails() {
            var selectedRole = $("#role-filter").val(); // Get selected role from dropdown
            $.get("/player/players", function(data) {
                $("#details-container").empty();
                $("#details-container").append("<h3>Player Details (" + selectedRole + ")</h3>");
                var tableHtml = "<table><thead><tr><th>Name</th><th>Role</th><th>Village</th><th>Photo</th></tr></thead><tbody>";
                data.forEach(function(player) {
                    if (player.role === selectedRole || selectedRole === "All") { // Filter by selected role or show all
                        var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                        tableHtml += "<tr><td>" + player.name + "</td><td>" + player.role + "</td><td>" + player.village + "</td><td><img src='" + imageSrc + "' height='100' width='100'></td></tr>";
                    }
                });
                tableHtml += "</tbody></table>";
                $("#details-container").append(tableHtml);
            });
        }

        // Function to fetch and display owner details
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

        // Function to fetch and display sponsor details
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
            fetchOwnerDetails(); // Call fetchOwnerDetails on document ready or as needed.
            
            // Event listener for dropdown change
            $("#role-filter").change(function() {
                fetchPlayerDetails(); // Call fetchPlayerDetails when dropdown selection changes
            });
        });
    </script>
</head>
<body>
    <div class="banner">
        
        <header style="background-color: #4CAF50; color: white; text-align: center; padding: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h1 style="margin: 0; font-size: 2.5em;">
                URUL PREMIER LEAGUE </h1>
            <p style="margin: 10px 0 0; font-size: 1.2em;">Welcome Player</p>
        </header>
    </div>

    <div class="container">
        <div class="filter-section">
            <label for="role-filter"><a href="#" onclick="fetchOwnerDetails()">Owner Details</a></label>
            <label for="role-filter"><a href="#" onclick="fetchSponsorDetails()">Sponsor Details</a></label>
        </br></br><label for="role-filter"><a>Player Role:</a></label>
            <select id="role-filter">
                <option value="All">All</option>
                <option value="Bowler">Bowler</option>
                <option value="Batsman">Batsman</option>
                <option value="All Rounder">All Rounder</option>
            </select>
        </div>
        
        <div class="details-container" id="details-container">
            <!-- Details will be fetched and displayed here -->
        </div>

    </div>
</body>
</html>
