<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:07
 */
namespace App\Persistence\V1;
use App\Repositories\Repository;
use Illuminate\Support\Facades\DB;

class NewspaperRepository extends Repository
{
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PNEWSPAPER(?,?,?)',array(
                $data['name_newspaper'],
                $data['link_newspaper'],
                $data['link_logo']
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