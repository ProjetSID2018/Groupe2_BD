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
            // Store in DB the data given
            DB::select('CALL PMOT(?,?,@id_mot)',array(
                $data['mot'],
                $data['mot_racine'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_mot as id_mot');

            // Sent the id_article in json format to client
            $this->word_message['message'] = json_encode(['id_mot' =>$results[0]->id_mot]);
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