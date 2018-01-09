<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:05
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class ArticleRepository
{

    private $article_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given
            DB::select('CALL PARTICLE(?,?,?,?,?,?,?,?,?,?,@id_article)',array(
                $data['date_publication'],
                $data['taux_positivite'],
                $data['taux_negativite'],
                $data['taux_joie'],
                $data['taux_peur'],
                $data['taux_tristesse'],
                $data['taux_colere'],
                $data['taux_surprise'],
                $data['taux_degout'],
                $data['id_journal'],
            ));

            // Get the output variable from the procedure
            $results = DB::select('Select @id_article as id_article');

            // Sent the id_article in json format to client
            $this->article_message['message'] = json_encode(['id_article' =>$results[0]->id_article]);
            $this->article_message['code'] =  201;

            return $this->article_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->article_message['message'] = $e->getMessage();
            $this->article_message['code'] =  500;

            return $this->article_message;
        }
    }
}