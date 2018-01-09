<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:08
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class WordRootRepository
{

    private $word_root_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('mot_racine')->insert([
                'id_racine' => null,
                'mot' => $data['mot']
            ]);

            $this->word_root_message['message'] = "L'ajout a pu se faire";
            $this->word_root_message['code'] =  201;

            return $this->word_root_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->word_root_message['message'] = $e->getMessage();
            $this->word_root_message['code'] =  500;
            return $this->word_root_message;
        }
    }
}