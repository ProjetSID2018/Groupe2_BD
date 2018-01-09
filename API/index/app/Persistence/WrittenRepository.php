<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 10:46
 */

namespace App\Persistence;


use Illuminate\Support\Facades\DB;

class WrittenRepository
{

    private $written_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('ecrit')->insert([
                'id_article' => $data['id_article'],
                'id_auteur' => $data['id_auteur']
            ]);

            $this->written_message['message'] = "L'ajout a pu se faire";
            $this->written_message['code'] =  201;

            return $this->written_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->written_message['message'] = $e->getMessage();
            $this->written_message['code'] =  500;

            return $this->written_message;
        }
    }
}