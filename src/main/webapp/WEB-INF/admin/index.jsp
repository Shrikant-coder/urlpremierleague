<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Urul Premier League - Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }
        .container {
            width: 100%;
            max-width: 1200px;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .section {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
        }
        .section h3 {
            margin-top: 0;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group select,
        .form-group input[type="file"] {
            width: calc(100% - 10px);
            padding: 8px;
            font-size: 14px;
        }
        .form-group button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
        .data-list {
            margin-top: 10px;
        }
        .data-list p {
            margin: 5px 0;
        }
        .data-list button {
            margin-left: 10px;
            padding: 4px 8px;
            background-color: #f44336;
            color: white;
            border: none;
            cursor: pointer;
        }
        .data-list button:hover {
            background-color: #da190b;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            fetchPlayers();
            fetchOwners();
            fetchSponsors();
            fetchUsers();
        });

        function fetchPlayers() {
            $.get("/admin/players", function(data) {
                $("#players-container").empty();
                $("#players-container").append("<h3>All Players</h3>");
                data.forEach(function(player) {
                    var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
                    $("#players-container").append("<div class='data-list'><p>Name: " + player.name + ", Role: " + player.role + ", Village: " + player.village + "<img src='" + imageSrc + "' height='100'></p><button onclick='deletePlayer(" + player.id + ")'>Delete</button></div>");
                });
            });
        }

        function fetchOwners() {
            $.get("/admin/owners", function(data) {
                $("#owners-container").empty();
                $("#owners-container").append("<h3>All Owners</h3>");
                data.forEach(function(owner) {
                    var captainName = owner.captain ? owner.captain.name : "None";
                    var imageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
                    $("#owners-container").append("<div class='data-list'><p>Name: " + owner.name + ", Captain: " + captainName + "<img src='" + imageSrc + "' height='100'></p><button onclick='deleteOwner(" + owner.id + ")'>Delete</button></div>");
                });
            });
        }

        function fetchOwners() {
      $.get("/admin/owners", function(data) {
        $("#owners-container").empty();
        $("#owners-container").append("<h3>All Owners</h3>");
        $("#owner-select").empty();
        data.forEach(function(owner) {
          var captainName = owner.captain ? owner.captain.name : "None";
          var imageSrc = owner.image ? "data:image/png;base64," + owner.image : "";
          $("#owners-container").append("<div class='data-list'><p>Name: " + owner.name + ", Captain: " + captainName + "<img src='" + imageSrc + "' height='100'></p><button onclick='deleteOwner(" + owner.id + ")'>Delete</button></div>");
          $("#owner-select").append(new Option(owner.name, owner.id));
        });
      });
    }

    function fetchPlayers() {
      $.get("/admin/players", function(data) {
        $("#players-container").empty();
        $("#players-container").append("<h3>All Players</h3>");
        $("#player-select").empty();
        data.forEach(function(player) {
          var imageSrc = player.image ? "data:image/png;base64," + player.image : "";
          $("#players-container").append("<div class='data-list'><p>Name: " + player.name + ", Role: " + player.role + ", Village: " + player.village + "<img src='" + imageSrc + "' height='100'></p><button onclick='deletePlayer(" + player.id + ")'>Delete</button></div>");
          $("#player-select").append(new Option(player.name, player.id));
        });
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
                    alert("Error adding player: " + error);
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
                    alert("Error adding owner: " + error);
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
                    alert("Error adding sponsor: " + error);
                }
            });
        }

        function addUser() {
            var formData = new FormData();
            formData.append("username", $("#user-username").val());
            formData.append("password", $("#user-password").val());
            formData.append("role", $("#user-role").val());

            $.ajax({
                type: "POST",
                url: "/admin/addUser",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    alert(response);
                    fetchUsers();
                },
                error: function(xhr, status, error) {
                    alert("Error adding user: " + error);
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
                        alert("Error deleting player: " + error);
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
                        alert("Error deleting owner: " + error);
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
                        alert("Error deleting sponsor: " + error);
                    }
                });
            }
        }

        function deleteUser(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/deleteUser/" + userId,
                    success: function(response) {
                        alert(response);
                        fetchUsers();
                    },
                    error: function(xhr, status, error) {
                        alert("Error deleting user: " + error);
                    }
                });
            }
        }
        window.onload = function() {
            var admin = "${admin}"; // Get the ownerId value from JSP model attribute
            // Check if ownerId is false, then submit the form
            if (admin === "false") {
                document.getElementById("redirectForm").submit(); // Submitting the form
            }
    }
    function setPlayerAsOwner() {
      var ownerId = $("#owner-select").val();
      var playerId = $("#player-select").val();

      $.ajax({
        url: '/admin/setCaptain',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ ownerId: ownerId, playerId: playerId }),
        success: function(response) {
          alert('Player set as Owner successfully!');
          fetchOwners();
        },
        error: function(error) {
          console.error('Error setting player as owner:', error);
        }
      });
    }

    $(document).ready(function() {
      fetchOwners();
      fetchPlayers();
    });
    </script>
</head>
<body>
    <form id="redirectForm" action="/" method="get">
        <!-- Optional hidden input fields -->
        <!--<input type="hidden" name="admin" value="${admin}"> !-->
    </form>
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
            <h3>Add User</h3>
            <div class="form-group">
                <label for="user-username">Username</label>
                <input type="text" id="user-username" name="user-username">
            </div>
            <div class="form-group">
                <label for="user-password">Password</label>
                <input type="password" id="user-password" name="user-password">
            </div>
            <div class="form-group">
                <label for="user-role">Role:</label>
                <select id="user-role" name="user-role">
                    <option value="Admin">Admin</option>
                    <option value="Player">Player</option>
                    <option value="Owner">Owner</option>
                </select>
            </div>

            <div class="form-group">
                <button onclick="addUser()">Add User</button>
            </div>
        </div>
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
            <button onclick="setPlayerAsOwner()">Set Player as Owner</button>
          </div>
       
       
       
        <div id="users-container" class="section"></div>
    </div>
</body>
</html>
