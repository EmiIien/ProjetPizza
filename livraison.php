<?php
include('update.php');
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Livraison</title>
    </head>
    <body>

        <?php
            //Tentative de connexion à la base de données.
            $connection = new PDO('mysql:host=localhost;dbname=PROJET_PIZZA;charset=utf8;', 'user', 'user');
            //Écriture de la requête SQL.            
            //Lecture des données tant qu'il y en a puis stockage dans un tableau.
            foreach($connection->query('SELECT idLivraison FROM Livraison WHERE refTelLivreur IS NULL') as $row) {
                $livraisons[] = $row['idLivraison'];
            }
        ?>

        <form method="GET">
            <label> ID de la livraison : </label>
            <input name="idLivraison" type="text" value=
                <?php
                    //Affichage de la première valeur du tableau dans le champ ID livraison.
                    if(!empty($livraisons)) {
                        $tableau = array_values($livraisons)[0];
                        $_SESSION['session_idLivraison'] = $tableau;
                        echo $_SESSION['session_idLivraison']; 
                    //Si le tableau est vide, le message suivant s'affiche dans le champ ID livraison.
                    } else {
                        echo "Aucune";
                    }
                ?>
            >

            <label> Liste des livreurs </label>
            <?php
                //Tentative de connexion à la base de données.
                $connection = new PDO('mysql:host=localhost;dbname=PROJET_PIZZA;charset=utf8;', 'user', 'user');
                //Écriture de la requête SQL. 
                //Création de la liste déroulante.
                echo '<select name="telLivreur">';
                    //Lecture des données puis affichage des données récupérées dans la liste déroulante.
                    foreach($connection->query('SELECT telLivreur, nomLivreur FROM Livreur') as $row) {
                        echo '<option value='.$row['telLivreur'].'>'.$row['nomLivreur'].'</option>';
                    }
                echo '</select>';
            ?>
            <input name="submit" type="submit" value="Valider">
        </form>
    </body>
</html>
