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
            // Store in wordroot table
            DB::table('mot_racine')->insert([
                'id_racine' => null,
                'mot' => $data['mot_racine'],
            ]);


            // Get the id_root attribute value frolm wordroot table
            $mot_racine  = Db::table('mot_racine')->select('id_racine')->where('mot','=',$data['mot_racine'])->get();


            // Store in word table
            DB::table('mot')->insert([
                'id_mot' => null,
                'mot' => $data['mot_racine'],
                'id_racine' => $mot_racine[0]->id_racine,
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