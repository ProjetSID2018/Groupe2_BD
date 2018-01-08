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

    /** FAIRE DES MACROS/CONSTANTES POUR EVITER ECRIRE DONNEES BRUTES */
    public function store($data) {
        try {
            // Store in DB the data given
            DB::table('entite')->insert(['id_entite' => null, 'type_entite' => $data['entite']]);
            $entity_message['message'] = "L'ajout a pu se faire";
            $entity_message['code'] =  200;
        } catch (\PDOException $e) {
            $entity_message['message'] = $e->getMessage();
            if ($e->getCode() == 23000) {
                //  Code 23000 = ER_DUP_ENTRY
                $entity_message['code'] = 409;
            }
            return $entity_message;
        }

    }

}