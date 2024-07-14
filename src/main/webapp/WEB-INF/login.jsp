<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header styles */
        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Main content container */
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login container styles */
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        /* Form elements styles */
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Button style */
        .login-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #45a049;
        }

        /* Footer styles */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <!-- Header section -->
    <header>
        <h1>URUL PREMIER LEAGUE</h1>
    </header>

    <!-- Main content section -->
    <div class="content">
        <div class="login-container">
            <h2>Login</h2>
            <form action="/login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br>
                
                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <!-- Footer section -->
    <footer>
        <p>&copy; 2024 URUL PREMIER LEAGUE. All rights reserved.</p>
    </footer>

</body>
</html>
