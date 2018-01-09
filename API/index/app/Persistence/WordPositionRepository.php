<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:08
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class WordPositionRepository
{

    private $word_position_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('position_mot')->insert([
                "position" => $data['position'],
                "titre" => $data['titre'],
                "id_mot"=> $data['id_mot'],
                "id_identite"=> $data['id_identite'],
                "id_pos_tag" => $data['id_pos_tag'],
                "id_article"=> $data['id_article'],
                "id_synonyme"=> $data['id_synonyme'],
                "id_wiki"=> $data['id_wiki']
            ]);

            $this->word_position_message['message'] = "L'ajout a pu se faire";
            $this->word_position_message['code'] =  201;

            return $this->word_position_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->word_position_message['message'] = $e->getMessage();
            $this->word_position_message['code'] =  500;

            return $this->word_position_message;
        }
    }
}