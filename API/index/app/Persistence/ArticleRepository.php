<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:05
 */
namespace App\Persistence;
use App\Repositories\Repository;
use Illuminate\Support\Facades\DB;

class ArticleRepository extends Repository
{
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PARTICLE(?,?,?,?,?,?,?,?,?,?,@id_article)',array(
                $data['date_publication'],
                $data['rate_positivity'],
                $data['rate_negativity'],
                $data['rate_joy'],
                $data['rate_fear'],
                $data['rate_sadness'],
                $data['rate_angry'],
                $data['rate_surprise'],
                $data['rate_disgust'],
                $data['id_newspaper'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_article as id_article');

            // Sent the id_article in json format to client
            $this->response['message'] = json_encode(['id_article' =>$results[0]->id_article]);
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