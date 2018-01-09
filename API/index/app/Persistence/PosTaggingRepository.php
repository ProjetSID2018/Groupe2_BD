<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:07
 */
namespace App\Persistence;
use Illuminate\Support\Facades\DB;

class PosTaggingRepository
{

    private $post_tagging_message = array();

    /** NEED TO IMPLEMENTS MACROS TO NOT PUT RAW DATA */
    public function store($data) {
        try {
            // Store in DB the data given  (without using procedure)
            /*DB::table('pos_tagging')->insert([
                'id_pos_tag' => null,
                'pos_tag' => $data['pos_tag']
            ]);*/

            DB::select('CALL PPOSTTAGGING(?)',array(
                $data['pos_tag'],
            ));

            $this->post_tagging_message['message'] = "";
            $this->post_tagging_message['code'] =  201;

            return $this->post_tagging_message;
        } catch (\PDOException $e) {
            // Get the pdo exception message
            $this->post_tagging_message['message'] = $e->getMessage();
            $this->post_tagging_message['code'] =  500;

            return $this->post_tagging_message;
        }
    }
}