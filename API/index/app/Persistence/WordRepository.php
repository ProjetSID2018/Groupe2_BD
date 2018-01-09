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
                'mot' => $data['mot'],
            ]);

            $this->word_message['message'] = "L'ajout a pu se faire";
            $this->word_message['code'] =  200;

            return $this->word_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->word_message['message'] = $e->getMessage();
            if ($e->getCode() == 23000) {
                // Code 23000 = ER_DUP_ENTRY (duplicate value)
                // 409 status code means CONFLICT
                $this->word_message['code'] = 409;
            }
            return $this->word_message;
        }
    }
}