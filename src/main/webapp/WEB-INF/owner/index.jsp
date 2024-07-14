<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Player and Owner Details</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <h2>Player and Owner Details</h2>
    
    <h3>Players</h3>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Role</th>
                <th>Village</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="player" items="${players}">
                <tr>
                    <td>${player.id}</td>
                    <td>${player.name}</td>
                    <td>${player.role}</td>
                    <td>${player.village}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>Owners</h3>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Captain Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="owner" items="${owners}">
                <tr>
                    <td>${owner.id}</td>
                    <td>${owner.name}</td>
                    <td>${owner.captain.name}</td> <!-- Assuming captain is a Player object -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
