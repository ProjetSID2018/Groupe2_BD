<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 10:35
 */

namespace App\Persistence;


use Illuminate\Support\Facades\DB;

class WikiRepository
{

    private $wiki_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PWIKI(?,@id_wiki)',array(
                $data['lien_wiki'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_wiki as id_wiki');

            // Sent the id_article in json format to client
            $this->wiki_message['message'] = json_encode(['id_wiki' =>$results[0]->id_wiki]);
            $this->wiki_message['code'] =  201;

            return $this->wiki_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->wiki_message['message'] = $e->getMessage();
            $this->wiki_message['code'] =  500;

            return $this->wiki_message;
        }
    }
}