<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 14:39
 */

namespace App\Persistence;


use Illuminate\Support\Facades\DB;

class BelongRepository
{

    private $belong_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('appartient')->insert([
                "id_article" => $data['id_article'],
                "id_classe" => $data['id_classe']
            ]);

            $this->belong_message['message'] = "L'ajout a pu se faire";
            $this->belong_message['code'] =  201;

            return $this->belong_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->belong_message['message'] = $e->getMessage();
            $this->belong_message['code'] =  500;

            return $this->belong_message;
        }
    }
}