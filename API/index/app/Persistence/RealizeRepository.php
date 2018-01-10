<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 10:46
 */

namespace App\Persistence;


use App\Repositories\Repository;
use Illuminate\Support\Facades\DB;

class RealizeRepository extends Repository
{
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PREALIZE(?,?)',array(
                $data['id_author'],
                $data['id_article'],
            ));

            $this->response['message'] = "";
            $this->response['code'] =  Repository::$CREATION_SUCCEEDED;

            return $this->response;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->response['message'] = $e->getMessage();
            $this->response['code'] =  Repository::$INTERNAL_ERROR;

            return $this->response;
        }
    }
}