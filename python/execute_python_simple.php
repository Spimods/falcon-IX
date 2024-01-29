<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['code'])) {
        $code = $_POST['code'];

        // Écrire le code dans un fichier temporaire
        $file = tempnam(sys_get_temp_dir(), 'python_code_');
        file_put_contents($file, $code);

        // Exécuter le code Python et capturer la sortie et les erreurs
        exec("python " . $file . " 2>&1", $output, $returnCode);

        // Supprimer le fichier temporaire
        unlink($file);

        // Préparer la réponse
        $response = [
            'output' => implode("\n", $output),
            'error' => ($returnCode !== 0) ? implode("\n", $output) : '',
        ];

        // Envoyer la réponse au format JSON
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        echo json_encode(['error' => 'Aucun code Python fourni.']);
    }
} else {
    echo json_encode(['error' => 'Méthode de requête incorrecte. Utilisez la méthode POST.']);
}
?>
