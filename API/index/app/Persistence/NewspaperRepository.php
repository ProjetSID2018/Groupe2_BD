<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:07
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class NewspaperRepository
{
    private $newspaper_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('journal')->insert([
                'id_journal' => null,
                'nom_journal' => $data['nom_journal'],
                'lien_journal' => $data['lien_journal'],
                'lien_logo' =>$data['lien_logo']
            ]);

            $this->newspaper_message['message'] = "L'ajout a pu se faire";
            $this->newspaper_message['code'] =  201;

            return $this->newspaper_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->newspaper_message['message'] = $e->getMessage();
            $this->newspaper_message['code'] =  500;

            return $this->newspaper_message;
        }
    }
}