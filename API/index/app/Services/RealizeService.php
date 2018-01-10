<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 09/01/2018
 * Time: 10:47
 */
namespace App\Services;

use App\Persistence\RealizeRepository;

class RealizeService
{
    private $written_repository;
    public function __construct()
    {
        $this->written_repository = new RealizeRepository();
    }

    public function store($data) {
        // Need validation steps for the data

        return $this->written_repository->store($data);
    }
}