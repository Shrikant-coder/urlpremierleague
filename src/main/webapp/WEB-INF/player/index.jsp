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
            box-sizing: border-box;
        }

        *, *::before, *::after {
            box-sizing: inherit;
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
    display: flex;
    justify-content: center; /* Center buttons horizontally */
    gap: 10px; /* Space between buttons using flexbox gap */
    flex-wrap: wrap; /* Allow wrapping on smaller screens */
    box-sizing: border-box;
}
        .nav-bar .dropdown {
            position: relative;
            display: inline-block;
        }

        .nav-bar .dropbtn {
    background-color: #b4d816;
    border: none;
    color: white;
    padding: 20px 40px;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 10px;
    transition: background-color 0.3s, transform 0.3s;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 10px; /* Add horizontal space between buttons */
    width: auto; /* Allow buttons to resize based on content */
    display: inline-block; /* Ensure buttons are inline and spacing is applied */
}

.nav-bar .dropdown-content {
    display: none;
    position: absolute;
    background: #ffffff;
    border-radius: 5px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    min-width: 160px;
    top: 100%;
    left: 0;
    text-align: left;
    padding: 0;
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
            overflow: hidden;
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
            max-width: 100%;
            height: auto;
        }

        img:hover {
            transform: scale(1.05);
        }
        
/* Responsive adjustments */
@media (max-width: 768px) {
            .nav-bar .dropdown-content {
                position: static;
                box-shadow: none;
                display: none;
            }

            .nav-bar .dropdown:hover .dropdown-content {
                display: block;
            }

            .nav-bar .dropbtn {
                width: 100%;
                font-size: 18px;
                padding: 10px;
                margin: 5px 0;
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

            img {
                max-width: 100%;
                height: auto;
            }
        }

        @media (max-width: 480px) {
            .nav-bar .dropbtn {
                font-size: 15px;
                padding: 8px;
            }

            .details-container {
                padding: 8px;
            }

            table {
                font-size: 0.8rem;
            }

            img {
                max-width: 100%;
                height: auto;
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
/* Modal container */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 9999; /* High z-index to sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgba(0, 0, 0, 0.7); /* Black background with opacity */
}

/* Modal content */
.modal-content {
    margin: auto;
    display: block;
    width: 80%; /* Adjust based on needs */
    max-width: 700px; /* Adjust based on needs */
}

/* Caption of modal */
#caption {
    margin: 10px auto;
    text-align: center;
    color: #ccc;
}

/* The close button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #fff;
    font-size: 40px;
    font-weight: bold;
    cursor: pointer;
}

/* Close button hover effect */
.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
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
// Function to open the modal
function openModal(imageSrc) {
    var modal = document.getElementById("image-modal");
    var modalImg = document.getElementById("modal-image");
    var captionText = document.getElementById("caption");
    modal.style.display = "block";
    modalImg.src = imageSrc;
    captionText.innerHTML = ""; // Optionally set caption
}

// Function to close the modal
function closeModal() {
    var modal = document.getElementById("image-modal");
    modal.style.display = "none";
}

// Add event listener to close button
document.addEventListener('DOMContentLoaded', function() {
    var closeBtn = document.querySelector("#image-modal .close");
    closeBtn.addEventListener('click', closeModal);
    
    // Close the modal when clicking outside of it
    window.addEventListener('click', function(event) {
        var modal = document.getElementById("image-modal");
        if (event.target === modal) {
            closeModal();
        }
    });
});
function filterPlayers() {
        // Get the value of the search input
        var searchTerm = $("#player-search").val().toLowerCase();
        
        // Filter rows based on the search term
        $("#details-container table tbody tr").each(function() {
            var rowText = $(this).text().toLowerCase();
            if (rowText.indexOf(searchTerm) > -1) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
    
    // Modified fetchPlayerDetails function to include the search input
    function fetchPlayerDetails(role) {
        showLoader(); // Show loader when fetching data
        $.get("/player/players", function(data) {
            $("#details-container").show();
            $("#about-us-container").hide();
            $("#details-container").empty();
            $("#details-container").append('<input type="text" id="player-search" placeholder="Search players..." onkeyup="filterPlayers()">');
            $("#details-container").append("<h3>Player Details (" + role + ")</h3>");
            var tableHtml = "<table><thead><tr><th>Name</th><th>Role</th><th>Village</th><th>Photo</th></tr></thead><tbody>";
            data.forEach(function(player) {
                if (player.role === role || role === "All") { // Filter by selected role or show all
                    var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                    tableHtml += "<tr><td>" + player.name + "</td><td>" + player.role + "</td><td>" + player.village + "</td><td><img src='" + imageSrc + "' height='100' width='100' onclick='openModal(\"" + imageSrc + "\")'></td></tr>";
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
            var ownerImageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
            var captainImageSrc = owner.captain.image ? "data:image/png;base64," + owner.captain.image : "";
            tableHtml += "<tr><td>" + owner.name + "</td><td>" + owner.captain.name + "</td><td><img src='" + ownerImageSrc + "' height='100' width='100' onclick='openModal(\"" + ownerImageSrc + "\")'></td><td><img src='" + captainImageSrc + "' height='100' width='100' onclick='openModal(\"" + captainImageSrc + "\")'></td></tr>";
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
            tableHtml += "<tr><td>" + sponsor.name + "</td><td>" + sponsor.post + "</td><td>" + sponsor.amount + "</td><td><img src='" + imageSrc + "' height='100' width='100' onclick='openModal(\"" + imageSrc + "\")'></td></tr>";
        });
        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching sponsor details.");
        hideLoader(); // Hide loader if there's an error
    });
}
// Function to fetch and display Group A owner details
function fetchGroupAOwnerDetails() {
    showLoader(); // Show loader when fetching data
    $.get("/owner/owners/groupA", function(data) {  // Assuming the endpoint for Group A owners is '/owner/groupAowners'
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Group A Owner Details</h3>");
        var tableHtml = "<table><thead><tr><th>Name</th><th>Captain</th><th>Owner Photo</th><th>Captain Photo</th></tr></thead><tbody>";
        data.forEach(function(owner) {
            var ownerImageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
            var captainImageSrc = owner.captain.image ? "data:image/png;base64," + owner.captain.image : "";
            tableHtml += "<tr><td>" + owner.name + "</td><td>" + owner.captain.name + "</td><td><img src='" + ownerImageSrc + "' height='100' width='100' onclick='openModal(\"" + ownerImageSrc + "\")'></td><td><img src='" + captainImageSrc + "' height='100' width='100' onclick='openModal(\"" + captainImageSrc + "\")'></td></tr>";
        });
        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching Group A owner details.");
        hideLoader(); // Hide loader if there's an error
    });
}

// Function to fetch and display Group B owner details
function fetchGroupBOwnerDetails() {
    showLoader(); // Show loader when fetching data
    $.get("/owner/owners/groupB", function(data) {  // Assuming the endpoint for Group B owners is '/owner/groupBowners'
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Group B Owner Details</h3>");
        var tableHtml = "<table><thead><tr><th>Name</th><th>Captain</th><th>Owner Photo</th><th>Captain Photo</th></tr></thead><tbody>";
        data.forEach(function(owner) {
            var ownerImageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
            var captainImageSrc = owner.captain.image ? "data:image/png;base64," + owner.captain.image : "";
            tableHtml += "<tr><td>" + owner.name + "</td><td>" + owner.captain.name + "</td><td><img src='" + ownerImageSrc + "' height='100' width='100' onclick='openModal(\"" + ownerImageSrc + "\")'></td><td><img src='" + captainImageSrc + "' height='100' width='100' onclick='openModal(\"" + captainImageSrc + "\")'></td></tr>";
        });
        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching Group B owner details.");
        hideLoader(); // Hide loader if there's an error
    });
}
$(document).ready(function() {
    // Bind event handlers to buttons and links
    $("#groupA-link").on("click", function(event) {
        event.preventDefault();
        fetchGroupAOwnerDetails(); // Fetch Group A owners
    });

    $("#groupB-link").on("click", function(event) {
        event.preventDefault();
        fetchGroupBOwnerDetails(); // Fetch Group B owners
    });

    $(".dropdown-content a").on("click", function(event) {
        event.preventDefault();
        const role = $(this).text();
        if (role === "Group A") {
            fetchGroupAOwnerDetails();
        } else if (role === "Group B") {
            fetchGroupBOwnerDetails();
        } else {
            $("#details-container").hide();
            $("#about-us-container").show();
        }
    });

    $(".dropbtn").on("click", function(event) {
        event.preventDefault();
        toggleDropdown(this);
    });

    // Fetch sponsor details by default on page load
    fetchSponsorDetails();
});

function toggleDropdown(element) {
    const dropdownContent = $(element).siblings('.dropdown-content');
    const isVisible = dropdownContent.is(':visible');
    $('.dropdown-content').hide();
    if (!isVisible) {
        dropdownContent.show();
    }
   
}
    </script>
</head>
<body>
    <div id="loader">
        <div class="spinner"></div>
    </div>
    <div id="overlay"></div>
    <div class="banner">
        <header style="background-color: #4CAF50; color: white; padding: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h1 style="margin: 0; font-size: 2.5em;">URUL PREMIER LEAGUE</h1>
            <p style="margin: 10px 0 0; font-size: 1.2em;">Welcome to URUL PREMIER LEAGUE</p>
        </header>
    </div>
    <div class="nav-bar">
        <div class="dropdown">
            <button class="dropbtn" onclick="fetchOwnerDetails()">Owners</button>
        </div>
        <div class="dropdown">
            <button class="dropbtn">Players</button>
            <div class="dropdown-content">
                <a href="#" onclick="fetchPlayerDetails('All')">All</a>
                <a href="#" onclick="fetchPlayerDetails('Batsman')">Batsman</a>
                <a href="#" onclick="fetchPlayerDetails('Bowler')">Bowler</a>
                <a href="#" onclick="fetchPlayerDetails('All Rounder')">All Rounder</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="dropbtn" onclick="fetchSponsorDetails()">Sponsors</button>
        </div>
        <div class="dropdown">
            <button class="dropbtn">About</button>
            <div class="dropdown-content">
                <a href="#" onclick="showAboutUs()">About Tournament</a>
                <a href="#" onclick="fetchGroupAOwnerDetails()">Group A</a>
                <a href="#" onclick="fetchGroupBOwnerDetails()">Group B</a>
            </div>
        </div>
        
    </div>
    <div id="image-modal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="modal-image">
        <div id="caption"></div>
    </div>
    <div class="container">
        <div class="marquee">
            <span>Important Updates: खेळाडूंचा लिलाव १३ ऑक्टोबर २०२४ ला श्री जगदंबा हायस्कूल उरुल येथे ठीक १०:०० वाजता सुरू होईल. तरी सर्व टीम मालक आणि कॅप्टन यांनी उपस्थित राहावे ही विनंती. तसेच, लिलावाचे लाईव्ह चित्रिकरण आपणाला इथे पाहता येईल.</span>
        </div>
        <div class="details-container" id="details-container">
            <div class="search-box-container">
                <input type="text" id="search-box" placeholder="Search players..." onkeyup="searchPlayers()">
            </div>

            <!-- Details will be fetched and displayed here -->
        </div>
        <div id="about-us-container" style="display:none;">
            <h3>About Tournament</h3>
            <p><b>Rules</b> - लीगमधील मॅचेस ६ (२,२,१,१) ओव्हर्सच्या असतील, ज्यात २ ओव्हर्स बॅटिंग पॉवरप्ले असतील (फक्त २ खेळाडू ३० यार्ड्सच्या बाहेर ठेवता येतील) आणि उरलेले ४ ओव्हर्स बॉलिंग पॉवरप्ले असतील (या वेळेस फक्त ५ खेळाडू ३० यार्ड्सच्या बाहेर असतील). </p>
            <p>फायनल मॅच ८ (२,२,२,२) ओव्हर्सची असेल , ज्यात ३ ओव्हर्स बॅटिंग पॉवरप्ले असतील आणि उरलेले ५ ओव्हर्स बॉलिंग पॉवरप्ले असतील </p>
            <p>ग्राउंडच्या दोन्ही बाजूला ५:४ खेळाडू खेळले जातील, अन्यथा नो बॉल मानला जाईल.</p>
            <p><b>Matches</b> - सर्व मॅचेस लीगच्या पद्धतीने खेळवण्यात येतील. प्रत्येक संघ आपल्या गटातील इतर संघांसोबत लीग मॅचेस खेळतील. 
            </p><p>प्रत्येक मॅचसाठी २ पॉइंट्स दिले जातील. प्रत्येक गटातील टॉप २ संघ सेमीफायनलसाठी पात्र ठरतील. </p>
             <p>जर लीगमधील काही संघांचे पॉइंट्स समान असतील, तर ज्या संघाचे सर्वात जास्त "सिक्स" आहेत त्यास प्राधान्य दिले जाईल. "सिक्स" देखील समान असल्यास, "फोर"च्या गणनेला प्राधान्य दिले जाईल.</p>
             <p> सेमीफायनल्समध्ये गट A आणि गट B मधील प्रत्येक गटातील २-२ संघामध्ये मॅचेस खेळवली जातील. </p>

            <p><b>Owner</b> - Owner होण्यासाठी आपल्याला UPL समितीकडे 5000 जमा करावे लागतील (प्रथम 8 टीम्स नोंदविल्या जातील, त्यापेक्षा जास्त टीम्स घेतल्या जाणार नाहीत.) आणि इथे लिस्टेड असलेल्या खेळाडूंपैकी आपल्याला खेळाडू निवडावे लागतील. लीगसाठी आपण कोणत्याही खेळाडूसाठी इच्छा दाखवू शकता आणि त्यासाठी आपल्याला काही पॉइंट्स खर्च करावे लागतील. आपल्या कडे एकूण 500 पॉइंट्स असतील, त्यातून आपल्याला 12 खेळाडू निवडावे लागतील. आपल्याला कॅप्टन निवडण्याची मुभा असेल आणि त्यासाठी आपल्याला कोणतीच बोली लावावी लागणार नाही. Owner प्लेइंग 11 मध्ये सुद्धा खेळू शकतो.प्रत्येक टीममध्ये कमीत कमी १ खेळाडू थॉमसे किंवा मोरेवाडीचा, १ खेळाडू उरुल किंवा शिवाजीनगरचा, १ खेळाडू पांडवनगरचा, आणि १ खेळाडू गाणेवाडीचा असणे आवश्यक आहे.</p>
            <p><b>Player</b> - आपल्याला UPL मध्ये भाग घेण्यासाठी पहिल्यांदा फॉर्म भरावा लागेल. UPL समिती फॉर्म प्रदान करेल आणि प्रत्येक फॉर्मची फी 100 रुपये असेल. आपली निवड जो कोणी Owner करेल त्या टीममध्ये आपल्याला प्रामाणिकपणे खेळावे लागेल 
                <b>जर आपली निवड कोणत्याच टीममध्ये झाली नसेल तर फॉर्म फी परत केली जाणार नाही, याची खेळाडूने नोंद घ्यावी</b>. आपल्याला प्रत्येक मॅचमध्ये मॅन ऑफ द मॅच मिळेल आणि सोबत मेडल देखील मिळेल आणि आपला खेळ दाखवण्याची संधी मिळेल. अधिक माहितीसाठी UPL समितीशी संपर्क साधा.</p>
        </div>
    </div>

</body>

</html>
