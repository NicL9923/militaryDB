<!DOCTYPE html>
<html>
<head>
    <title>MilitaryDB | Bases</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/favicon.ico">
</head>

<body>
    <div class="topbar">
        <img src="images/usmcLogo.png" alt="Marine Corps logo">
        <h3>MilitaryDB™ - A Marine Corps database</h3>
    </div>

    <a href="/militarydb" class="goBackLink">Go back</a>
    <h1 class="recordsHdr">Base Records</h1>

    <form action="" method="POST">
        <h3 class="stdQryHdr">Standard Queries</h3>
        <input type="submit" value="Default" name="standardQueryDefault">
        <input type="submit" value="Amount of equipment per base" name="standardQueryEquipmentPerBase">
        <input type="submit" value="Amount of people per base" name="standardQueryPeoplePerBase">
    </form>

    <?php
        include 'db_connection.php';

        if (isset($_REQUEST['standardQueryEquipmentPerBase'])) {
            $sqlQuery = 'SELECT b.baseName AS Base, SUM(quantity) AS `Equipment Quantity` FROM equipment e INNER JOIN units u ON e.unitID = u.unitID INNER JOIN bases b ON u.baseID = b.baseID GROUP BY b.baseName';
            executeSelectQuery($sqlQuery);
        }
        else if (isset($_REQUEST['standardQueryPeoplePerBase'])) {
            $sqlQuery = 'SELECT b.baseName AS Base, COUNT(*) AS `Personnel Count` FROM personnel p INNER JOIN units u ON p.unitID = u.unitID INNER JOIN bases b ON u.baseID = b.baseID GROUP BY b.baseName';
            executeSelectQuery($sqlQuery);
        }
        else {
            $sqlQuery = 'SELECT baseName AS Base, baseLoc AS Location, baseType AS Type FROM bases ORDER BY baseType, baseName';
            executeSelectQuery($sqlQuery);
        }
    ?>
</body>
</html>