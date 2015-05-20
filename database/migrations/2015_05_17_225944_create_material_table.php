<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaterialTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
        Schema::create('materials', function(Blueprint $table) {
            $table->increments('id');
            $table->string('name', 255);
            $table->text('summary');
            $table->text('content');
            $table->integer('type');
            $table->integer('cost');
        });
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
        Schema::drop('materials');
	}

}
