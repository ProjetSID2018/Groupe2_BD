<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:05
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class AuthorRepository
{

    private $author_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PAUTEUR(?,?,@id_auteur)',array(
                $data['nom_auteur'],
                $data['prenom_auteur'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_auteur as id_auteur');

            // Sent the id_article in json format to client
            $this->author_message['message'] = json_encode(['id_auteur' =>$results[0]->id_auteur]);
            $this->author_message['code'] =  201;

            return $this->author_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->author_message['message'] = $e->getMessage();
            $this->author_message['code'] =  500;

            return $this->author_message;
        }
    }
}