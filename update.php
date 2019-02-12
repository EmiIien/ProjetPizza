<?php
session_start();
// Condition : Si le champ de texte ID de livraison contient un chiffre 
// et que la variable bouton est non NULL alors le code suivant est exécuté :
if(isset($_GET['submit']) && $_GET['idLivraison'] != "Aucune" )
{
        //Déclaration et assignation des variables suivantes :
        $idLivraison = $_SESSION['session_idLivraison'];
        $telLivreur = $_GET['telLivreur'];
        //Tentative de connexion à la base de données.
        $connection = new PDO('mysql:host=localhost;dbname=PROJET_PIZZA;charset=utf8;', 'user', 'user');
        //Écriture de la requête SQL préparée 
        $sql = $connection->prepare("UPDATE Livraison SET refTelLivreur= ? WHERE idLivraison= ?");

        $sql->execute(array($telLivreur, $idLivraison));
    }
?>
