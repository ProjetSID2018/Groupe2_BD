<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:07
 */
namespace App\Persistence;

use Illuminate\Support\Facades\DB;

class EntityRepository
{
    private $entity_message = array();

     /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            DB::table('entite')->insert(['id_entite' => null, 'type_entite' => $data['type_entite']]);

            $this->entity_message['message'] = "L'ajout a pu se faire";
            $this->entity_message['code'] =  201;

            return $this->entity_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->entity_message['message'] = $e->getMessage();
            $this->entity_message['code'] =  500;
            return $this->entity_message;
        }
    }
}
