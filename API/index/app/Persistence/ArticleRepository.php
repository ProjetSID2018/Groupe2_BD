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
            // Store the article
            DB::select('CALL FILTERING_PARTICLE(?,?,@id_article)',array(
                $data['date_publication'],
                $data['name_newspaper'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_article as id_article');
            // Store the authors for this article

            if(count($data['surname_author']) == 1) {
                DB::select('CALL FILTERING_PAUTHOR(?,?)',array(
                    $results[0]->id_article,
                    $data['surname_author'][0]
                ));
            } else {
                if(is_array($data['surname_author'])) {
                    for ($i = 0 ; $i< count($data['surname_author']) ; $i++) {
                        DB::select('CALL FILTERING_PAUTHOR(?,?)',array(
                            $results[0]->id_article,
                            $data['surname_author'][$i]
                        ));
                    }
                }
            }

            // Send the id_article in json format to client
            $this->response['message'] = ['id_article' =>$results[0]->id_article];
            $this->response['code'] =  Repository::$CREATION_SUCCEEDED;

            return $this->response;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->response['message'] = $e->getMessage();
            $this->response['code'] =  Repository::$INTERNAL_ERROR;

            return $this->response;
        }
    }

    public function update($data) {
        try {
            // Update the article
            DB::select('CALL SEMANTIC_PARTICLE(?,?,?,?,?,?,?,?,?,?,?)',array(
                $data['id_article'],
                $data['rate_positivity'],
                $data['rate_negativity'],
                $data['rate_joy'],
                $data['rate_fear'],
                $data['rate_sadness'],
                $data['rate_angry'],
                $data['rate_surprise'],
                $data['rate_disgust'],
                $data['rate_subjectivity'],
                $data['is_positive']
            ));

            // Send the id_article in json format to client
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