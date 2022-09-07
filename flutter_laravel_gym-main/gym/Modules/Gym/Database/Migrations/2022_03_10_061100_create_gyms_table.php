<?php

/**
 * Migration file is used to change the database structure.
 * This file is automatically generated.
 * This migration file creates the table for the this module with certain attributes.
 * 
 */


use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGymsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create(
            'gyms',
            function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->string('contact');
                $table->string('location');

                $table->timestamps();
            }
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('gyms');
    }
}
