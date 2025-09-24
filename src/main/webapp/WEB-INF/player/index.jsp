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
    padding-left: 100%; /* This can remain as is */
    animation: marquee 20s linear infinite; /* Shorten the duration to make it faster */
    /* You can also adjust the animation delay if needed */
}

      /* Add keyframes to adjust the starting position */
@keyframes marquee {
    0% {
        transform: translateX(0); /* Start from the right edge */
    }
    100% {
        transform: translateX(-100%); /* End at the left edge */
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
.blink {
    animation: blink-animation 1s steps(5, start) infinite;
}

@keyframes blink-animation {
    0%, 100% {
        visibility: visible;
    }
    50% {
        visibility: hidden;
    }
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
    // Show sponsor details by default on page load
    fetchSponsorDetails();
    $("#details-container").hide(); // Hide details container initially
    $("#about-us-container").hide(); // Hide about us container initially

    // Bind event handlers to dropdown functionality
    $(".dropbtn").on("click", function(event) {
        event.preventDefault();
        toggleDropdown(this);
    });

    // Close dropdowns if clicked outside
    $(document).on("click", function(event) {
        if (!$(event.target).closest('.dropdown').length) {
            $(".dropdown-content").hide();
        }
    });

    // Bind event handlers to dropdown links
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
        // Close the dropdown after selection
        $(".dropdown-content").hide();
    });
});


function toggleDropdown(element) {
    const dropdownContent = $(element).siblings('.dropdown-content');
    
    // Hide all dropdowns first
    $('.dropdown-content').hide();

    // Show the current dropdown only if it was not already visible
    if (!dropdownContent.is(':visible')) {
        dropdownContent.show();
    }
}
function groupBLots() {
    showLoader(); // Show loader when fetching data

    $.get("/owner/owners/groupB", function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Group B Matches</h3>");

        // Check if data has enough elements for matches
        if (data.length < 4) {
            $("#details-container").append("<p>Not enough data for matches.</p>");
            hideLoader(); // Hide loader if not enough data
            return;
        }

        // Declare variables for each owner
        var nir = data[0];
        var ran = data[1];
        var san = data[2];
        var sun = data[3];

        // Define all possible matches
        var allMatches = [
            [sun, ran], // Match 1: Owner1 vs Owner2
            [san, nir], // Match 2: Owner3 vs Owner4
            [sun, san], // Match 3: Owner1 vs Owner3
            [ran, nir], // Match 4: Owner2 vs Owner4
            [sun, nir], // Match 5: Owner1 vs Owner4
            [ran, san]  // Match 6: Owner2 vs Owner3
        ];

        var scheduledMatches = [];
        var lastPlayed = {};
        var matchStartTime = new Date('2023-11-01T10:30:00'); // Starting time for matches

        // Schedule matches ensuring no consecutive games
        for (var match of allMatches) {
            var [owner1, owner2] = match;

            // Check if neither owner played in the last match
            if (lastPlayed[owner1.name] !== owner2.name && lastPlayed[owner2.name] !== owner1.name) {
                scheduledMatches.push({ owners: match, time: matchStartTime.toLocaleString() });
                lastPlayed[owner1.name] = owner2.name; // Update last played
                lastPlayed[owner2.name] = owner1.name; // Update last played

                // Increment match start time by 1 hour for the next match
                matchStartTime.setHours(matchStartTime.getHours() + 1.5);
            }
        }

        // Build HTML for the scheduled matches
        var tableHtml = "<table><thead><tr><th>Owner 1</th><th>Image</th><th>VS</th><th>Image</th><th>Owner 2</th></tr></thead><tbody>";

        scheduledMatches.forEach(function(match) {
            var [owner1, owner2] = match.owners;

            // Use old logic for images
            var owner1ImageSrc = owner1.image ? "data:image/png;base64," + owner1.image : "https://via.placeholder.com/100";
            var owner2ImageSrc = owner2.image ? "data:image/png;base64," + owner2.image : "https://via.placeholder.com/100";

            // Build table row using concatenation
            tableHtml += "<tr>" +
                "<td colspan='5' style='text-align: center;'>" + match.time + "</td>" + // Display match time
                "</tr><tr>" +
                "<td>" + owner1.name + "</td>" +
                "<td><img src='" + owner1ImageSrc + "' height='100' width='100' onclick='openModal(\"" + owner1ImageSrc + "\")' style='cursor: pointer;'></td>" +
                "<td>VS</td>" +
                "<td><img src='" + owner2ImageSrc + "' height='100' width='100' onclick='openModal(\"" + owner2ImageSrc + "\")' style='cursor: pointer;'></td>" +
                "<td>" + owner2.name + "</td>" +
                "</tr>";
        });

        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching Group A owner details.");
        hideLoader(); // Hide loader if there's an error
    });
}
function groupALots() {
    showLoader(); // Show loader when fetching data

    $.get("/owner/owners/groupA", function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Group A Matches</h3>");

        // Check if data has enough elements for matches
        if (data.length < 4) {
            $("#details-container").append("<p>Not enough data for matches.</p>");
            hideLoader(); // Hide loader if not enough data
            return;
        }

        // Declare variables for each owner
        var nir = data[0];
        var ran = data[1];
        var san = data[2];
        var sun = data[3];

        // Define all possible matches
        var allMatches = [
            [nir, ran], // Match 1: Owner1 vs Owner2
            [san, sun], // Match 2: Owner3 vs Owner4
            [nir, san], // Match 3: Owner1 vs Owner3
            [ran, sun], // Match 4: Owner2 vs Owner4
            [nir, sun], // Match 5: Owner1 vs Owner4
            [ran, san]   // Match 6: Owner2 vs Owner3
        ];

        var scheduledMatches = [];
        var lastPlayed = {};
        var matchStartTime = new Date('2023-10-31T10:30:00'); // Starting time for matches

        // Schedule matches ensuring no consecutive games
        for (var match of allMatches) {
            var [owner1, owner2] = match;

            // Check if neither owner played in the last match
            if (lastPlayed[owner1.name] !== owner2.name && lastPlayed[owner2.name] !== owner1.name) {
                scheduledMatches.push({ owners: match, time: matchStartTime.toLocaleString() });
                lastPlayed[owner1.name] = owner2.name; // Update last played
                lastPlayed[owner2.name] = owner1.name; // Update last played

                // Increment match start time by 1 hour for the next match
                matchStartTime.setHours(matchStartTime.getHours() + 1.5);
            }
        }

        // Build HTML for the scheduled matches
        var tableHtml = "<table><thead><tr><th>Owner 1</th><th>Image</th><th>VS</th><th>Image</th><th>Owner 2</th></tr></thead><tbody>";

        scheduledMatches.forEach(function(match) {
            var [owner1, owner2] = match.owners;

            // Use old logic for images
            var owner1ImageSrc = owner1.image ? "data:image/png;base64," + owner1.image : "https://via.placeholder.com/100";
            var owner2ImageSrc = owner2.image ? "data:image/png;base64," + owner2.image : "https://via.placeholder.com/100";

            // Build table row using concatenation
            tableHtml += "<tr>" +
                "<td colspan='5' style='text-align: center;'>" + match.time + "</td>" + // Display match time
                "</tr><tr>" +
                "<td>" + owner1.name + "</td>" +
                "<td><img src='" + owner1ImageSrc + "' height='100' width='100' onclick='openModal(\"" + owner1ImageSrc + "\")' style='cursor: pointer;'></td>" +
                "<td>VS</td>" +
                "<td><img src='" + owner2ImageSrc + "' height='100' width='100' onclick='openModal(\"" + owner2ImageSrc + "\")' style='cursor: pointer;'></td>" +
                "<td>" + owner2.name + "</td>" +
                "</tr>";
        });

        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
        hideLoader(); // Hide loader after fetching data
    }).fail(function() {
        alert("Error fetching Group A owner details.");
        hideLoader(); // Hide loader if there's an error
    });
}
function fetchPlayersByOwner(ownerName) {
    showLoader(); // Show loader when fetching data

    // Create the endpoint using the owner name
    var endpoint = "/owner/players/" + encodeURIComponent(ownerName); // Use ownerName as a path variable

    $.get(endpoint, function(data) {
        $("#details-container").show();
        $("#about-us-container").hide();
        $("#details-container").empty();
        $("#details-container").append("<h3>Players for " + ownerName + "</h3>");

        // Check if data is empty
        if (!data || Object.keys(data).length === 0) {
            $("#details-container").append("<p>No players found for " + ownerName + ".</p>");
            hideLoader(); // Hide loader if no data
            return;
        }

        // Build HTML for the players list
        var tableHtml = "<table><thead><tr><th>S.No</th><th>Name</th><th>Role</th></tr></thead><tbody>";

        // Initialize a counter for serial number
        let srNo = 1;

        // Iterate through the map
        for (var playerName in data) {
            if (data.hasOwnProperty(playerName)) {
                var playerRole = data[playerName]; // Get role
                // Build table row using concatenation
                tableHtml += "<tr>" +
                    "<td>" + srNo++ + "</td>" + // Serial number
                    "<td>" + playerName + "</td>" + // Player's name
                    "<td>" + playerRole + "</td>" + // Player's role
                    "</tr>";
            }
        }

        tableHtml += "</tbody></table>";
        $("#details-container").append(tableHtml);
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error fetching players:", textStatus, errorThrown);
        console.error("Response Text:", jqXHR.responseText); // Log the response text
        alert("Error fetching players for " + ownerName + ".");
    })
    .always(function() {
        hideLoader(); // Hide loader after fetching data (whether success or failure)
    });
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
            <p style="margin: 10px 0 0; font-size: 1.2em;">Welcome to URUL PREMIER LEAGUE Parv-2</p>
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
               
            </div>
        </div>
        
    </div>
    <div id="image-modal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="modal-image">
        <div id="caption"></div>
    </div>
    <div class="container">
        
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
             <p>जर लीगमधील काही संघांचे पॉइंट्स समान असतील, तर नेट रनरेटला प्राधान्य दिले जाईल.</p>
             <p> सेमीफायनल्समध्ये गट A आणि गट B मधील प्रत्येक गटातील २-२ संघामध्ये मॅचेस खेळवली जातील. </p>

            <p><b>Owner</b> - Owner होण्यासाठी आपल्याला UPL समितीकडे 5000 जमा करावे लागतील (प्रथम 8 टीम्स नोंदविल्या जातील, त्यापेक्षा जास्त टीम्स घेतल्या जाणार नाहीत.) आणि इथे लिस्टेड असलेल्या खेळाडूंपैकी आपल्याला खेळाडू निवडावे लागतील. लीगसाठी आपण कोणत्याही खेळाडूसाठी इच्छा दाखवू शकता आणि त्यासाठी आपल्याला काही पॉइंट्स खर्च करावे लागतील. आपल्या कडे एकूण 500 पॉइंट्स असतील, त्यातून आपल्याला 12 खेळाडू निवडावे लागतील. आपल्याला कॅप्टन निवडण्याची मुभा असेल आणि त्यासाठी आपल्याला कोणतीच बोली लावावी लागणार नाही. Owner प्लेइंग 11 मध्ये सुद्धा खेळू शकतो.</p>
            <p><b>Player</b> - आपल्याला UPL मध्ये भाग घेण्यासाठी पहिल्यांदा फॉर्म भरावा लागेल. UPL समिती फॉर्म प्रदान करेल आणि प्रत्येक फॉर्मची फी 100 रुपये असेल. आपली निवड जो कोणी Owner करेल त्या टीममध्ये आपल्याला प्रामाणिकपणे खेळावे लागेल 
                <b>जर आपली निवड कोणत्याच टीममध्ये झाली नसेल तर फॉर्म फी परत केली जाणार नाही, याची खेळाडूने नोंद घ्यावी</b>. आपल्याला प्रत्येक मॅचमध्ये मॅन ऑफ द मॅच मिळेल आणि सोबत मेडल देखील मिळेल आणि आपला खेळ दाखवण्याची संधी मिळेल. अधिक माहितीसाठी UPL समितीशी संपर्क साधा.</p>
        </div>
    </div>

</body>

</html>
