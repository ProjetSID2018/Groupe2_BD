<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:06
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class ClassificationRepository
{

    private $classification_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PCLASSIFICATION(?)',array(
                $data['classe']
            ));

            $this->classification_message['message'] = "";
            $this->classification_message['code'] =  201;

            return $this->classification_message;

        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->classification_message['message'] = $e->getMessage();
            $this->classification_message['code'] =  500;

            return $this->classification_message;
        }
    }
}