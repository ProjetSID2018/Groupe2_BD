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
            // Store in DB the data given  (without using procedure)
            DB::table('auteur')->insert([
                'id_auteur' => null,
                'nom_auteur' => $data['nom_auteur'],
                'prenom_auteur' => $data['prenom_auteur'],
            ]);

            $this->author_message['message'] = "L'ajout a pu se faire";
            $this->author_message['code'] =  200;

            return $this->author_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->author_message['message'] = $e->getMessage();
            if ($e->getCode() == 23000) {
                // Code 23000 = ER_DUP_ENTRY (duplicate value)
                // 409 status code means CONFLICT
                $this->author_message['code'] = 409;
            }
            return $this->author_message;
        }
    }
}