<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:10
 */
namespace App\Services;
use App\Persistence\WordPositionRepository;

class WordPositionService
{

    private $word_position_repository;
    public function __construct()
    {
        $this->word_position_repository = new WordPositionRepository();
    }

    public function store($data) {
        // Need validation steps for the data

        return $this->word_position_repository->store($data);
    }
}