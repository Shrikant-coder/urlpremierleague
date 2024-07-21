<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Urul Premier League - Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .header, .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        .section {
            background: #fff;
            margin: 20px 0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h3 {
            margin-top: 0;
        }
        .form-group {
            margin: 10px 0;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .form-group input[type="file"] {
            padding: 5px;
        }
        .form-group button {
            background: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }
        .form-group button:hover {
            background: #555;
        }
        .data-list {
            margin: 10px 0;
            padding: 10px;
            background: #e9e9e9;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .data-list img {
            max-height: 100px;
            margin-left: 10px;
            border-radius: 5px;
        }
        .data-list button {
            background: #ff4d4d;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 3px;
        }
        .data-list button:hover {
            background: #ff1a1a;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            fetchPlayers();
            fetchOwners();
            fetchSponsors();
            populateOwnerAndPlayerDropdowns();
        });

        function fetchPlayers() {
            $.get("/admin/players")
                .done(function(data) {
                    console.log("Players fetched:", data);
                    $("#players-container").empty().append("<h3>All Players</h3>");
                    data.forEach(function(player) {
                        var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                        $("#players-container").append(
                            "<div class='data-list'><p>Name: " + player.name + ", Role: " + player.role + 
                            ", Village: " + player.village + 
                            "<img src='" + imageSrc + "' alt='Player Image'></p>" +
                            "<button onclick='deletePlayer(" + player.id + ")'>Delete</button></div>"
                        );
                    });
                })
                .fail(function(xhr, status, error) {
                    console.error("Error fetching players:", error);
                });
        }

        function fetchOwners() {
            $.get("/admin/owners")
                .done(function(data) {
                    console.log("Owners fetched:", data);
                    $("#owners-container").empty().append("<h3>All Owners</h3>");
                    data.forEach(function(owner) {
                        var captainName = owner.captain ? owner.captain.name : "None";
                        var imageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
                        $("#owners-container").append(
                            "<div class='data-list'><p>Name: " + owner.name + ", Captain: " + captainName + 
                            "<img src='" + imageSrc + "' alt='Owner Image'></p>" +
                            "<button onclick='deleteOwner(" + owner.id + ")'>Delete</button></div>"
                        );
                    });
                })
                .fail(function(xhr, status, error) {
                    console.error("Error fetching owners:", error);
                });
        }

        function fetchSponsors() {
            $.get("/admin/sponsors")
                .done(function(data) {
                    console.log("Sponsors fetched:", data);
                    $("#sponsors-container").empty().append("<h3>All Sponsors</h3>");
                    data.forEach(function(sponsor) {
                        var imageSrc = sponsor.image ? "data:image/png;base64," + sponsor.image : "";
                        $("#sponsors-container").append(
                            "<div class='data-list'><p>Name: " + sponsor.name + ", Post: " + sponsor.post + 
                            ", Amount: " + sponsor.amount + 
                            "<img src='" + imageSrc + "' alt='Sponsor Image'></p>" +
                            "<button onclick='deleteSponsor(" + sponsor.id + ")'>Delete</button></div>"
                        );
                    });
                })
                .fail(function(xhr, status, error) {
                    console.error("Error fetching sponsors:", error);
                });
        }

        function addPlayer() {
            var formData = new FormData();
            formData.append("name", $("#player-name").val());
            formData.append("role", $("#player-role").val());
            formData.append("village", $("#player-village").val());
            formData.append("image", $("#player-image")[0].files[0]);

            $.ajax({
                type: "POST",
                url: "/admin/addPlayer",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    alert(response);
                    fetchPlayers();
                },
                error: function(xhr, status, error) {
                    console.error("Error adding player:", error);
                }
            });
        }

        function addOwner() {
            var formData = new FormData();
            formData.append("name", $("#owner-name").val());
            formData.append("image", $("#owner-image")[0].files[0]);

            $.ajax({
                type: "POST",
                url: "/admin/addOwner",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    alert(response);
                    fetchOwners();
                },
                error: function(xhr, status, error) {
                    console.error("Error adding owner:", error);
                }
            });
        }

        function addSponsor() {
            var formData = new FormData();
            formData.append("name", $("#sponsor-name").val());
            formData.append("post", $("#sponsor-post").val());
            formData.append("amount", $("#sponsor-amount").val());
            formData.append("image", $("#sponsor-image")[0].files[0]);

            $.ajax({
                type: "POST",
                url: "/admin/addSponsor",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    alert(response);
                    fetchSponsors();
                },
                error: function(xhr, status, error) {
                    console.error("Error adding sponsor:", error);
                }
            });
        }

        function deletePlayer(playerId) {
            if (confirm("Are you sure you want to delete this player?")) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/deletePlayer/" + playerId,
                    success: function(response) {
                        alert(response);
                        fetchPlayers();
                    },
                    error: function(xhr, status, error) {
                        console.error("Error deleting player:", error);
                    }
                });
            }
        }

        function deleteOwner(ownerId) {
            if (confirm("Are you sure you want to delete this owner?")) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/deleteOwner/" + ownerId,
                    success: function(response) {
                        alert(response);
                        fetchOwners();
                    },
                    error: function(xhr, status, error) {
                        console.error("Error deleting owner:", error);
                    }
                });
            }
        }

        function deleteSponsor(sponsorId) {
            if (confirm("Are you sure you want to delete this sponsor?")) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/deleteSponsor/" + sponsorId,
                    success: function(response) {
                        alert(response);
                        fetchSponsors();
                    },
                    error: function(xhr, status, error) {
                        console.error("Error deleting sponsor:", error);
                    }
                });
            }
        }

        function setCaptainForOwner() {
            var ownerId = $("#owner-select").val();
            var playerId = $("#player-select").val();

            $.ajax({
                url: '/admin/setCaptain',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ ownerId: ownerId, playerId: playerId }),
                success: function(response) {
                    alert('Player set as Captain successfully!');
                    fetchOwners();
                },
                error: function(xhr, status, error) {
                    console.error('Error setting captain for owner:', error);
                }
            });
        }

        function populateOwnerAndPlayerDropdowns() {
            $.get("/admin/owners")
                .done(function(data) {
                    $("#owner-select").empty();
                    data.forEach(function(owner) {
                        $("#owner-select").append(
                            "<option value='" + owner.id + "'>" + owner.name + "</option>"
                        );
                    });
                });

            $.get("/admin/players")
                .done(function(data) {
                    $("#player-select").empty();
                    data.forEach(function(player) {
                        $("#player-select").append(
                            "<option value='" + player.id + "'>" + player.name + "</option>"
                        );
                    });
                });
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>URUL PREMIER LEAGUE</h1>
    </div>
    <div class="container">
        <div class="section">
            <h3>Add Player</h3>
            <div class="form-group">
                <label for="player-name">Name</label>
                <input type="text" id="player-name" name="player-name">
            </div>
            <div class="form-group">
                <label for="player-role">Role:</label>
                <select id="player-role" name="player-role">
                    <option value="Batsman">Batsman</option>
                    <option value="Bowler">Bowler</option>
                    <option value="All Rounder">All Rounder</option>
                </select>
            </div>
            <div class="form-group">
                <label for="player-village">Village</label>
                <input type="text" id="player-village" name="player-village">
            </div>
            <div class="form-group">
                <label for="player-image">Image</label>
                <input type="file" id="player-image" name="player-image">
            </div>
            <div class="form-group">
                <button onclick="addPlayer()">Add Player</button>
            </div>
        </div>
        <div id="players-container" class="section"></div>
        <div class="section">
            <h3>Add Owner</h3>
            <div class="form-group">
                <label for="owner-name">Name</label>
                <input type="text" id="owner-name" name="owner-name">
            </div>
            <div class="form-group">
                <label for="owner-image">Image</label>
                <input type="file" id="owner-image" name="owner-image">
            </div>
            <div class="form-group">
                <button onclick="addOwner()">Add Owner</button>
            </div>
        </div>
        <div id="owners-container" class="section"></div>
        <div class="section">
            <h3>Add Sponsor</h3>
            <div class="form-group">
                <label for="sponsor-name">Name</label>
                <input type="text" id="sponsor-name" name="sponsor-name">
            </div>
            <div class="form-group">
                <label for="sponsor-post">Post</label>
                <input type="text" id="sponsor-post" name="sponsor-post">
            </div>
            <div class="form-group">
                <label for="sponsor-amount">Amount</label>
                <input type="text" id="sponsor-amount" name="sponsor-amount">
            </div>
            <div class="form-group">
                <label for="sponsor-image">Image</label>
                <input type="file" id="sponsor-image" name="sponsor-image">
            </div>
            <div class="form-group">
                <button onclick="addSponsor()">Add Sponsor</button>
            </div>
        </div>
        <div id="sponsors-container" class="section"></div>
        <div class="section">
            <h3>Set Captain for Owner</h3>
            <div class="form-group">
                <label for="owner-select">Select Owner</label>
                <select id="owner-select" name="owner-select"></select>
            </div>
            <div class="form-group">
                <label for="player-select">Select Player</label>
                <select id="player-select" name="player-select"></select>
            </div>
            <button onclick="setCaptainForOwner()">Set Player as Owner</button>
        </div>
        <div id="users-container" class="section"></div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Urul Premier League. All Rights Reserved.</p>
    </div>
</body>
</html>
