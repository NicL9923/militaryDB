<!DOCTYPE html>
<html>
<head>
    <title>MilitaryDB | Equipment</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/favicon.ico">
</head>

<body>
    <div class="topbar">
        <img src="images/usmcLogo.png" alt="Marine Corps logo">
        <h3>MilitaryDB™ - A Marine Corps database</h3>
    </div>

    <a href="/militarydb" class="goBackLink">Go back</a>
    <h1 class="recordsHdr">Equipment Records</h1>

    <?php
        include 'db_connection.php';
        $sqlQuery = 'SELECT itemName AS `Item Name`, quantity AS `Quantity`, u.unitName AS `Unit`, b.baseLoc AS `(Base) Location` FROM equipment e
            INNER JOIN units u ON e.unitID = u.unitID
            INNER JOIN bases b ON u.baseID = b.baseID
            ORDER BY u.unitName, itemName';

        executeSelectQuery($sqlQuery);
    ?>
</body>
</html>