<?php
session_start();

// Vérifier si le tableau de pages visitées existe dans la session
if (!isset($_SESSION['visited_pages'])) {
    $_SESSION['visited_pages'] = array();
}

// Récupérer l'URL envoyée par le client
if (isset($_POST['url'])) {
    $current_url = $_POST['url'];

    // Ajouter l'URL actuelle au tableau
    $_SESSION['visited_pages'][] = $current_url;

    // Répondre avec un message de confirmation
    echo "URL mise à jour avec succès : $current_url";
} else {
    // Répondre avec un message d'erreur
    echo "Erreur : Aucune URL fournie.";
}
?>
