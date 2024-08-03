<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            margin: 0;
            padding: 0;
            color: #333;
            text-align: center;
        }

        .banner {
            margin-bottom: 20px;
        }

        .banner img {
            max-width: 100%;
            height: auto;
        }

        .nav-bar {
            background: #4CAF50;
            color: white;
            padding: 10px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .nav-bar .dropdown {
            position: relative;
            display: inline-block;
        }

        .nav-bar .dropbtn {
            background-color: #b4d816; /* Purple background */
    border: none; /* Remove border */
    color: white; /* White text */
    padding: 20px 40px; /* Larger padding */
    font-size: 24px; /* Bigger font size */
    font-weight: bold; /* Bold font */
    cursor: pointer; /* Pointer cursor */
    border-radius: 10px; /* Rounded corners */
    transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Slight shadow */
    margin: 10px; /* Margin for spacing */
    box-sizing: border-box; /* Include padding and border in element's width and height */
    width: 160px; /* Fixed width */
           
        }


        .nav-bar .dropdown-content {
            display: none;
            position: absolute;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
            top: 100%; /* Position below the button */
            left: 0;
            text-align: left;
        }

        .nav-bar .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            border-bottom: 1px solid #ddd;
        }

        .nav-bar .dropdown-content a:hover {
            background: #f1f1f1;
        }

        .nav-bar .dropdown:hover .dropdown-content {
            display: block;
        }

        .nav-bar .sub-dropdown-content {
            display: none;
            position: absolute;
            top: 0;
            left: 100%;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
            text-align: left;
        }

        .nav-bar .sub-dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
        }

        .nav-bar .sub-dropdown-content a:hover {
            background: #f1f1f1;
        }

        .nav-bar .sub-dropdown:hover .sub-dropdown-content {
            display: block;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
        }

        .details-container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            padding: 20px;
            text-align: left;
            font-family: 'Roboto', sans-serif;
        }

        .details-container h3 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #333;
            font-weight: 700;
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
        }

        th {
            background: #4CAF50;
            color: white;
            font-weight: 700;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #f1f1f1;
        }

        img {
            border-radius: 5px;
            transition: transform 0.3s;
        }

        img:hover {
            transform: scale(1.05);
        }

        /* Responsive adjustments */
        @media (max-width: 1024px) {
            .nav-bar .dropbtn {
                padding: 10px;
                font-size: 14px;
            }

            .nav-bar .dropdown-content {
                min-width: 140px;
            }

            .nav-bar .sub-dropdown-content {
                min-width: 140px;
            }

            .container {
                padding: 15px;
            }

            .details-container {
                padding: 15px;
            }
        }

        @media (max-width: 768px) {
            .nav-bar .dropdown-content,
            .nav-bar .sub-dropdown-content {
                position: static;
                box-shadow: none;
                display: none;
            }

            .nav-bar .dropdown:hover .dropdown-content,
            .nav-bar .sub-dropdown:hover .sub-dropdown-content {
                display: block;
            }

            .nav-bar .dropbtn {
                width: 100%;
                font-size: 25px;
            }

            .container {
                padding: 10px;
            }

            .details-container {
                padding: 10px;
            }

            table {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .nav-bar .dropbtn {
                font-size: 25px;
                padding: 8px;
            }

            .details-container {
                padding: 8px;
            }

            table {
                font-size: 0.8rem;
            }

            img {
                height: 80px;
                width: 80px;
            }
        }

        /* Marquee effect using CSS animations */
        .marquee {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            background: #343a40;
            color: #fff;
            padding: 10px;
            font-size: 1.2em;
            font-weight: 700;
            position: relative;
            box-sizing: border-box;
        }

        .marquee span {
            display: inline-block;
            padding-left: 100%;
            animation: marquee 70s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        /* About Us Section */
        #about-us-container {
            display: none;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
            text-align: left;
            font-family: 'Roboto', sans-serif;
        }

        #about-us-container h3 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 15px;
            font-weight: 700;
        }

        #about-us-container p {
            font-size: 1.2rem;
            line-height: 1.6;
            color: #555;
        }
        #overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Black background with 50% opacity */
    z-index: 1000; /* Place overlay behind the loader */
    display: none; /* Hidden by default */
}

#loader {
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 1001; /* Place loader above the overlay */
    display: none; /* Hidden by default */
}

.spinner {
    border: 16px solid #f3f3f3;
    border-top: 16px solid #3498db;
    border-radius: 50%;
    width: 120px;
    height: 120px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
       // Function to show the loader
       function showLoader() {
    $("#overlay").show(); // Show the overlay
    $("#loader").show();  // Show the loader
}

function hideLoader() {
    $("#overlay").hide(); // Hide the overlay
    $("#loader").hide();  // Hide the loader
}

// Function to fetch and display player details based on role
function fetchPlayerDetails(role) {
    showLoader(); // Show loader when fetching data
    $.get("/player/players", function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
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
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching player details.");
        hideLoader(); // Hide loader if there's an error
    });
}

// Function to fetch and display owner details
function fetchOwnerDetails() {
    showLoader(); // Show loader when fetching data
    $.get("/owner/owners", function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Owner Details</h3>");
        var tableHtml = "<table><thead><tr><th>Name</th><th>Captain</th><th>Owner Photo</th><th>Captain Photo</th></tr></thead><tbody>";
        data.forEach(function(owner) {
            var ownerimageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
            var captainimageSrc = owner.captain.image ? "data:image/png;base64," + owner.captain.image : "";
            tableHtml += "<tr><td>" + owner.name + "</td><td>" + owner.captain.name + "</td><td><img src='" + ownerimageSrc + "' height='100' width='100'></td><td><img src='" + captainimageSrc + "' height='100' width='100'></td></tr>";
        });
        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching owner details.");
        hideLoader(); // Hide loader if there's an error
    });
}

// Function to fetch and display sponsor details
function fetchSponsorDetails() {
    showLoader(); // Show loader when fetching data
    $.get("/sponsors", function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Sponsor Details</h3>");
        var tableHtml = "<table><thead><tr><th>Name</th><th>Sneh</th><th>Amount</th><th>Photo</th></tr></thead><tbody>";
        data.forEach(function(sponsor) {
            var imageSrc = sponsor.image ? "data:image/png;base64," + sponsor.image : "";
            tableHtml += "<tr><td>" + sponsor.name + "</td><td>" + sponsor.post + "</td><td>" + sponsor.amount + "</td><td><img src='" + imageSrc + "' height='100' width='100'></td></tr>";
        });
        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching sponsor details.");
        hideLoader(); // Hide loader if there's an error
    });
}

$(document).ready(function() {
    // Load sponsor details by default
    fetchSponsorDetails();

    // Function to show dropdown menu and fetch player details
    $(".sub-dropdown-content a").on("click", function() {
        var role = $(this).text();
        fetchPlayerDetails(role);
    });

    // Function to show About Us section
    $(".dropdown-content a[href='#about']").on("click", function() {
        $("#details-container").hide();
        $("#about-us-container").show();
    });
});
$(document).ready(function() {
    // Function to toggle dropdown visibility
    function toggleDropdown(element) {
        var dropdownContent = $(element).siblings('.dropdown-content');
        var isVisible = dropdownContent.is(':visible');
        $('.dropdown-content').hide(); // Hide all dropdowns
        if (!isVisible) {
            dropdownContent.show(); // Show the clicked dropdown
        }
    }

    // Toggle dropdown on button click
    $(".dropbtn").on("click", function(event) {
        event.stopPropagation(); // Prevent click from propagating to document
        toggleDropdown(this);
    });

    // Close dropdowns when clicking outside
    $(document).on("click", function(event) {
        if (!$(event.target).closest('.dropdown').length) {
            $('.dropdown-content').hide();
        }
    });

    // Prevent closing main dropdown when clicking on items with sub-dropdowns
    $(".dropdown-content > a").on("click", function(event) {
        var subDropdown = $(this).siblings('.sub-dropdown-content');
        if (subDropdown.length > 0) {
            event.stopPropagation(); // Prevent closing
        } else {
            $('.dropdown-content').hide(); // Close dropdown if no sub-dropdown
        }
    });

    // Close main dropdown when clicking on sub-dropdown items
    $(".sub-dropdown-content a").on("click", function(event) {
        $('.dropdown-content').hide(); // Close main dropdown
    });

    // Prevent closing of sub-dropdown when clicking inside
    $(".sub-dropdown-content").on("click", function(event) {
        event.stopPropagation(); // Prevent closing of parent dropdown
    });
});


$(document).ready(function() {
    console.log("jQuery is working!");
});
    </script>
</head>
<body>
    <div id="loader">
        <div class="spinner"></div>
    </div>
    <div id="overlay"></div>
<div id="loader">
    <div class="spinner"></div>
</div>
    <div class="banner">
        <header style="background-color: #4CAF50; color: white; padding: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h1 style="margin: 0; font-size: 2.5em;">URUL PREMIER LEAGUE</h1>
            <p style="margin: 10px 0 0; font-size: 1.2em;">Welcome to URUL PREMIER LEAGUE</p>
        </header>
    </div>
    <div class="nav-bar">
        <div class="dropdown">
            <button class="dropbtn"><b>Menu</b></button>
            <div class="dropdown-content">
                <a href="#" onclick="fetchOwnerDetails()">Owner Details</a>
                <a href="#" onclick="fetchSponsorDetails()">Sponsor Details</a>
                <div class="sub-dropdown">
                    <a href="#">Player Details</a>
                    <div class="sub-dropdown-content">
                        <a href="#">All</a>
                        <a href="#">Bowler</a>
                        <a href="#">Batsman</a>
                        <a href="#">All Rounder</a>
                    </div>
                </div>
                <a href="#about" onclick="showAboutUs()">About Tournament</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="marquee">
            <span>Important Updates: खेळाडूंचा लिलाव १३ ऑक्टोबर २०२४ ला श्री जगदंबा हायस्कूल उरुल येथे ठीक १०:०० वाजता सुरू होईल. तरी सर्व टीम मालक आणि कॅप्टन यांनी उपस्थित राहावे ही विनंती. तसेच, लिलावाचे लाईव्ह चित्रिकरण आपणाला इथे पाहता येईल.</span>
        </div>
        <div class="details-container" id="details-container">
            <!-- Details will be fetched and displayed here -->
        </div>
        <div id="about-us-container">
            <h3>About Tournament</h3>
            <p><b>Owner</b> - Owner होण्यासाठी आपल्याला UPL समितीकडे 5000 जमा करावे लागतील (प्रथम 8 टीम्स नोंदविल्या जातील, त्यापेक्षा जास्त टीम्स घेतल्या जाणार नाहीत.) आणि इथे लिस्टेड असलेल्या खेळाडूंपैकी आपल्याला खेळाडू निवडावे लागतील. लीगसाठी आपण कोणत्याही खेळाडूसाठी इच्छा दाखवू शकता आणि त्यासाठी आपल्याला काही पॉइंट्स खर्च करावे लागतील. आपल्या कडे एकूण 500 पॉइंट्स असतील, त्यातून आपल्याला 12 खेळाडू निवडावे लागतील. आपल्याला कॅप्टन निवडण्याची मुभा असेल आणि त्यासाठी आपल्याला कोणतीच बोली लावावी लागणार नाही. Owner प्लेइंग 11 मध्ये सुद्धा खेळू शकतो.प्रत्येक टीममध्ये कमीत कमी १ खेळाडू थॉमसे किंवा मोरेवाडीचा, १ खेळाडू उरुल किंवा शिवाजीनगरचा, १ खेळाडू पांडवनगरचा, आणि १ खेळाडू गाणेवाडीचा असणे आवश्यक आहे.</p>
            <p><b>Player</b> - आपल्याला UPL मध्ये भाग घेण्यासाठी पहिल्यांदा फॉर्म भरावा लागेल. UPL समिती फॉर्म प्रदान करेल आणि प्रत्येक फॉर्मची फी 100 रुपये असेल. आपली निवड जो कोणी Owner करेल त्या टीममध्ये आपल्याला प्रामाणिकपणे खेळावे लागेल 
                <b>जर आपली निवड कोणत्याच टीममध्ये झाली नसेल तर फॉर्म फी परत केली जाणार नाही, याची खेळाडूने नोंद घ्यावी</b>. आपल्याला प्रत्येक मॅचमध्ये मॅन ऑफ द मॅच मिळेल आणि सोबत मेडल देखील मिळेल आणि आपला खेळ दाखवण्याची संधी मिळेल. अधिक माहितीसाठी UPL समितीशी संपर्क साधा.</p>
        </div>
    </div>
    <script>
        function showAboutUs() {
            document.getElementById("about-us-container").style.display = "block";
            document.getElementById("details-container").style.display = "none";
        }
    </script>
     <style>
        /* Basic styling */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            margin: 0;
            padding: 0;
            color: #333;
            text-align: center;
        }
        .dropbtn {
    background-color: #4d0298; /* Green background */
    border: none; /* Remove border */
    color: white; /* White text */
    padding: 20px 40px; /* Larger padding */
    font-size: 24px; /* Bigger font size */
    font-weight: bold; /* Bold font */
    cursor: pointer; /* Pointer cursor */
    border-radius: 10px; /* Rounded corners */
    transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Slight shadow */
    margin: 10px; /* Margin for spacing */
}
        /* Nav-bar styling */
        .nav-bar {
            background: #4CAF50;
            color: white;
            padding: 10px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        

        .dropbtn .bar {
            display: block;
            width: 25px;
            height: 3px;
            margin: 5px 0;
            background-color: white;
            transition: 0.3s;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
            text-align: left;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            border-bottom: 1px solid #ddd;
        }

        .dropdown-content a:hover {
            background: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</body>
</html>
