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
            // Store in DB the data given  (without using procedure)
            DB::table('wiki')->insert([
                "id_wiki" => null,
                "lien_wiki" => $data['lien_wiki']
            ]);

            $this->wiki_message['message'] = "L'ajout a pu se faire";
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