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
            // Store in DB the data given  (without using procedure)
            DB::table('article')->insert([
                "id_article" => null,
                "date_publication" => $data['date_publication'],
                "taux_positivite" => $data['taux_positivite'],
                "taux_negativite" => $data['taux_negativite'],
                "taux_joie" => $data['taux_joie'],
                "taux_peur" => $data['taux_peur'],
                "taux_tristesse" => $data['taux_tristesse'],
                "taux_colere" => $data['taux_colere'],
                "taux_surprise" => $data['taux_surprise'],
                "taux_degout" => $data['taux_degout'],
                "id_journal" => $data['id_journal']
            ]);

            $this->article_message['message'] = "L'ajout a pu se faire";
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