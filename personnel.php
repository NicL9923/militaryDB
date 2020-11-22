<!DOCTYPE html>
<html>
<head>
    <title>MilitaryDB | Personnel</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/favicon.ico">
</head>

<body>
    <div class="topbar">
        <img src="images/usmcLogo.png" alt="Marine Corps logo">
        <h3>MilitaryDB™ - A Marine Corps database</h3>
    </div>

    <a href="/militarydb" class="goBackLink">Go back</a>
    <h1 class="recordsHdr">Personnel Records</h1>

    <form action="" method="POST">
        <h3 class="stdQryHdr">Standard Queries</h3>
        <input type="submit" value="Default" name="standardQueryDefault">
        <input type="submit" value="Num. of Personnel in MOS" name="standardQueryNumMos">
        <input type="submit" value="Num. of Each Rank" name="standardQueryNumRanks">
    </form>

    <form action="" method="POST">
        <input type="text" placeholder="Search for..." name="searchTerm">
        <select name="searchOption">
            <option value="idNo">ID No.</option>
            <option value="rank">Rank</option>
            <option value="lastName">Last Name</option>
            <option value="firstName">First Name</option>
            <option value="mos">MOS</option>
            <option value="unit">Unit</option>
            <option value="base">Base</option>
        </select>
        <input type="submit" value="Submit" name="searchFormSubmit">
    </form>

    <?php
        include 'db_connection.php';
        
        if (isset($_REQUEST['searchFormSubmit'])) {
            switch ($_POST['searchOption']) {
                case 'idNo':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE `ID No.` LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'rank':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE Rank LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'lastName':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE `Last Name` LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'firstName':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE `First Name` LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'mos':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE MOS LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'unit':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE Unit LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
                case 'base':
                    $searchTerm = $_POST['searchTerm'];
                    $sqlQuery = "SELECT * FROM personnelView WHERE Base LIKE '%${searchTerm}%'";
                    executeSelectQuery($sqlQuery);
                    break;
            }
        }
        else if (isset($_REQUEST['standardQueryNumMos'])) {
            $sqlQuery = 'SELECT MOS, COUNT(*) AS Num FROM personnelView GROUP BY MOS ORDER BY Num DESC';
            executeSelectQuery($sqlQuery);
        }
        else if (isset($_REQUEST['standardQueryNumRanks'])) {
            $sqlQuery = 'SELECT Rank, COUNT(*) AS Num FROM personnelView GROUP BY Rank ORDER BY Num DESC';
            executeSelectQuery($sqlQuery);
        }
        else {
            //Default case -> View was used since this query was massive (see Final Paper for more details)
            $sqlQuery = 'SELECT * FROM personnelView';
            executeSelectQuery($sqlQuery);
        }
    ?>
</body>
</html>