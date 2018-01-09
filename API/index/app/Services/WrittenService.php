<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 10:47
 */

namespace App\Services;


use App\Persistence\WrittenRepository;

class WrittenService
{

    private $written_repository;
    public function __construct()
    {
        $this->written_repository = new WrittenRepository();
    }

    public function store($data) {
        // Need validation steps for the data

        return $this->written_repository->store($data);
    }
}