<?php

$host = "localhost";
$user = "tarek";
$password = "tarek";

$base = "ExempleVues"; // script de création dans le dossier "doc"

$connection = new mysqli($host, $user, $password, $base);

$email = $connection->escape_string($_POST["email"]);
$motdepasse = $connection->escape_string($_POST["motdepasse"]);

$requete = "Select email, motdepasse, type_user "
        . "from User "
        . "Where email = '$email' and "
        . "motdepasse = '$motdepasse'"; // Il faut créer la vue "User" avant d'exécuter cette version
                                    
        // Voir code dans le répertoire "doc"

$resultat = $connection->query($requete);

if($resultat->num_rows == 1){
    $user = $resultat->fetch_assoc();
    $type_user = $user["type_user"];
    
    if($type_user == "ChefDep"){
        header("Location:espace_chef_dep.html");
    }else{
        header("Location:espace_etudiant.html");
    }
}else{
    header("Location:index.html");
}

