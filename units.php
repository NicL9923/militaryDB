<!DOCTYPE html>
<html>
<head>
    <title>MilitaryDB | Units</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/favicon.ico">
</head>

<body>
    <div class="topbar">
        <img src="images/usmcLogo.png" alt="Marine Corps logo">
        <h3>MilitaryDB™ - A Marine Corps database</h3>
    </div>

    <a href="/militarydb" class="goBackLink">Go back</a>
    <h1 class="recordsHdr">Unit Records</h1>

    <form action="" method="POST">
        <h3 class="stdQryHdr">Standard Queries</h3>
        <input type="submit" value="Default" name="standardQueryDefault">
        <input type="submit" value="Personnel per unit" name="standardQueryPeoplePerUnit">
        <input type="submit" value="MOS Field per unit" name="standardQueryFieldPerUnit">
        <input type="submit" value="Commissioned Officers" name="standardQueryOfficersPerUnit">
    </form>

    <?php
        include 'db_connection.php';

        if (isset($_REQUEST['standardQueryPeoplePerUnit'])) {
            $sqlQuery = 'SELECT u.unitName AS Unit, COUNT(*) AS `Personnel Count` FROM personnel p INNER JOIN units u ON p.unitID = u.unitID GROUP BY u.unitName';
            executeSelectQuery($sqlQuery);
        }
        else if (isset($_REQUEST['standardQueryFieldPerUnit'])) {
            $sqlQuery = 'SELECT u.unitName AS Unit, m.mosField AS `MOS Field`, COUNT(*) AS `Personnel Count` FROM personnel p INNER JOIN units u ON p.unitID = u.unitID INNER JOIN mos m ON p.mosID = m.mosID GROUP BY u.unitName, m.mosField ORDER BY u.unitName';
            executeSelectQuery($sqlQuery);
        }
        else if (isset($_REQUEST['standardQueryOfficersPerUnit'])) {
            $sqlQuery = 'SELECT u.unitName AS Unit, r.rankName AS Rank, p.lastName AS `Last Name`, p.firstName AS `First Name` FROM personnel p INNER JOIN units u ON p.unitID = u.unitID INNER JOIN ranks r ON p.rankID = r.rankID WHERE r.rankType = \'Commissioned Officer\' ORDER BY u.unitName';
            executeSelectQuery($sqlQuery);
        }
        else {
            $sqlQuery = 'SELECT unitName AS Unit, b.baseLoc AS `(Base) Location` FROM units u INNER JOIN bases b ON u.baseID = b.baseID';
            executeSelectQuery($sqlQuery);
        }
    ?>
</body>
</html>