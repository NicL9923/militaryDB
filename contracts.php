<!DOCTYPE html>
<html>
<head>
    <title>MilitaryDB | Contracts</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/favicon.ico">
</head>

<body>
    <div class="topbar">
        <img src="images/usmcLogo.png" alt="Marine Corps logo">
        <h3>MilitaryDB™ - A Marine Corps database</h3>
    </div>

    <a href="/militarydb" class="goBackLink">Go back</a>
    <h1 class="recordsHdr">Contract Records</h1>

    <form action="" method="POST">
        <h3 class="stdQryHdr">Standard Queries</h3>
        <input type="submit" value="Default" name="standardQueryDefault">
        <input type="submit" value="<=3 mths to expiration" name="standardQueryExpiration">
    </form>

    <form action="" method="POST">
        <h3>Procedures</h3>
        <input type="submit" value="Set unit NULL for expired contracts" name="procedureSetExpiredNull">
        <input type="submit" value="Extend all contracts by 4 yrs" name="procedureExtend4">
    </form>

    <?php
        include 'db_connection.php';

        if (isset($_REQUEST['standardQueryExpiration'])) {
            $sqlQuery = "SELECT c.contractNo AS `Contract No.`, c.idNo AS `Personnel ID`, p.lastName AS `Last Name`, p.firstName AS `First Name`, 
            c.startDate AS `Start Date`, c.endDate AS `End Date` FROM contracts c INNER JOIN personnel p ON p.idNo = c.idNo WHERE c.endDate BETWEEN CURDATE() AND CURDATE() + INTERVAL 3 MONTH";
            executeSelectQuery($sqlQuery);
        }
        else if (isset($_REQUEST['procedureSetExpiredNull'])) {
            //Handle first procedure
            $sqlQuery = 'CALL `Set Unit NULL for Expired Contracts`()';
            executeProcedure($sqlQuery);
        }
        else if (isset($_REQUEST['procedureExtend4'])) {
            //Handle second procedure
            $sqlQuery = 'CALL `Extend Contracts 4 Years`()';
            executeProcedure($sqlQuery);
        }
        else {
            $sqlQuery = 'SELECT contractNo AS `Contract No.`, idNo AS `Personnel ID`, startDate AS `Start Date`, endDate AS `End Date` from contracts';
            executeSelectQuery($sqlQuery);
        }
    ?>
</body>
</html>