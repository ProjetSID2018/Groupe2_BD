<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:08
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class WordRepository
{

    private $word_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('mot')->insert([
                'id_mot' => null,
                'id_racine' => $data['id_racine'],
                'mot' => $data['mot'],
            ]);

            $this->word_message['message'] = "L'ajout a pu se faire";
            $this->word_message['code'] =  201;

            return $this->word_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->word_message['message'] = $e->getMessage();
            $this->word_message['code'] =  500;

            return $this->word_message;
        }
    }
}