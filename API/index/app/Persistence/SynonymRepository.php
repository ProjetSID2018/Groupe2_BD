<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:08
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class SynonymRepository
{

    private $synonym_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::select('CALL PSYNONYME(?)',array(
                $data['synonyme'],
            ));

            $this->synonym_message['message'] = "";
            $this->synonym_message['code'] =  201;

            return $this->synonym_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->synonym_message['message'] = $e->getMessage();
            $this->synonym_message['code'] =  500;

            return $this->synonym_message;
        }
    }
}