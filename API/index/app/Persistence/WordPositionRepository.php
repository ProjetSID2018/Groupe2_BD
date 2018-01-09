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
            // Store in DB the data given
            DB::select('CALL PPOSITIONMOT(?,?,?,?,?,?,?,?)',array(
                $data['position'],
                $data['titre'],
                $data['id_mot'],
                $data['id_entite'],
                $data['id_pos_tag'],
                $data['id_article'],
                $data['id_synonyme'],
                $data['id_wiki'],
            ));

            $this->word_position_message['message'] = "";
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