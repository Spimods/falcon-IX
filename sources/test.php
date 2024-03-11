<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="test.css">
  <body>
    <main>
      <div id="header">
        <h1>Ranking</h1>
        <button class="share">
          <i class="ph ph-share-network"></i>
        </button>
      </div>
      <div id="leaderboard">
        <div class="ribbon"></div>
        <table>
        <?php
session_start();
require 'connect.php';

$query = "SELECT * FROM python ORDER BY flag1 DESC, flag2 DESC, flag3 DESC, time_flag_1 ASC, time_flag_2 ASC, time_flag_3 ASC LIMIT 5";

$result = mysqli_query($connexion, $query);


if ($result) {

    $rank = 1;
    while ($row = $result->fetch_assoc()) {
        if ($rank == 1) {
            if ($row['cookie'] == $_SESSION['ctfcookies']) {
                echo '<tr style="background-color: #f9f9f9; color: #fff;">';
                echo '<td class="number">' . $rank . '</td>';
                echo '<td class="name">' . $row['nom'] . '</td>';
                echo '<td class="points">' . $row['flag1']+$row['flag2']+$row['flag3'] .'</td>';
                echo '</tr>';
            } else {
                echo '<tr>';
                echo '<td class="number">' . $rank . '</td>';
                echo '<td class="name">' . $row['nom'] . '</td>';
                echo '<td class="points">' . $row['flag1']+$row['flag2']+$row['flag3'] .'<img class="gold-medal" src="https://github.com/malunaridev/Challenges-iCodeThis/blob/master/4-leaderboard/assets/gold-medal.png?raw=true" alt="gold medal"/></td>';
                echo '</tr>';
            }
        } else {
            if ($row['cookie'] == $_SESSION['ctfcookies']) {
                echo '<tr style="background-color: #f9f9f9; color: #fff;">';
                echo '<td class="number">' . $rank . '</td>';
                echo '<td class="name">' . $row['nom'] . '</td>';
                echo '<td class="points">' . $row['flag1']+$row['flag2']+$row['flag3'] .'</td>';
                echo '</tr>';
            } else {
                echo '<tr>';
                echo '<td class="number">' . $rank . '</td>';
                echo '<td class="name">' . $row['nom'] . '</td>';
                echo '<td class="points">' . $row['flag1']+$row['flag2']+$row['flag3'] .'</td>';
                echo '</tr>';
            }
        }
        $rank++;
    }
} else {
    echo "Erreur lors de l'exécution de la requête : " . $connexion->error;
}

mysqli_close($connexion);
?>
        </table>
        <div id="buttons">
          <button class="exit">Exit</button>
          <button class="continue">Continue</button>
        </div>
      </div>
    </main>
  </body>
</html>
