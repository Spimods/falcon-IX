<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['code'])) {
        $code = $_POST['code'];
        $file = tempnam(sys_get_temp_dir(), 'python_code_');
        file_put_contents($file, $code);
        exec("python " . $file . " 2>&1", $output, $returnCode);
        unlink($file);
        $response = [
            'output' => implode("\n", $output),
            'error' => ($returnCode !== 0) ? implode("\n", $output) : '',
        ];
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        echo json_encode(['error' => 'Aucun code Python fourni.']);
    }
} else {
    echo json_encode(['error' => 'Méthode de requête incorrecte. Utilisez la méthode POST.']);
}
?>
