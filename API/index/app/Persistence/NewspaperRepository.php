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
            DB::table('journal')->insert(['id_journal' => null, 'nom_journal' => $data['nom_journal']]);

            $this->newspaper_message['message'] = "L'ajout a pu se faire";
            $this->newspaper_message['code'] =  200;

            return $this->newspaper_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->newspaper_message['message'] = $e->getMessage();
            if ($e->getCode() == 23000) {
                // Code 23000 = ER_DUP_ENTRY (duplicate value)
                // 409 status code means CONFLICT
                $this->newspaper_message['code'] = 409;
            }
            return $this->newspaper_message;
        }
    }
}