<?php

function establishConnection() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "militarydb";

    $connection = new mysqli($servername, $username, $password, $dbname);

    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    
    //echo "Successfully connected to database ($dbname). <br> <br>";
    //echo "Query: $sqlQuery; <br>";

    return $connection;
}

function executeSelectQuery($sqlQuery) {
    $connection = establishConnection();

    $result = $connection->query($sqlQuery);

    if ($result->num_rows > 0) {
        $isFirstIteration = true;

        while($row = $result->fetch_assoc()) {
            if ($isFirstIteration) {
                $isFirstIteration = false;
                $columnNames = array_keys($row);
        
                echo "<table> <tr>";
                foreach ($columnNames as $column) {
                    echo "<th>$column</th>";
                }
                echo "</tr>";
            }
            
            echo "<tr>";
            foreach ($row as $value) {
                echo "<td> $value </td>";
            }
            echo "</tr>";
        }
        echo "</table>";
        if ($result->num_rows == 1) {
            echo "<p class=\"results\">{$result->num_rows} result found.</p> <br>";
        }
        else {
            echo "<p class=\"results\">{$result->num_rows} results found.</p> <br>";
        }
    } else {
        echo "<p class=\"results\">0 results found.</p> <br>";
    }

    echo "<br>";

    $connection->close();
}

function executeProcedure($sqlQuery) {
    $connection = establishConnection();

    $result = $connection->query($sqlQuery);
}
?>