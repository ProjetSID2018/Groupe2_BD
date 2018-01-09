<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 18:11
 */
namespace App\Services;
use App\Persistence\WordRootRepository;

class WordRootService
{

    private $word_root_repository;
    public function __construct()
    {
        $this->word_root_repository = new WordRootRepository();
    }

    public function store($data) {
        // Need validation steps for the data

        return $this->word_root_repository->store($data);
    }
}