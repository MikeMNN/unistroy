<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServiceMaterialTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
        Schema::create('service_materials', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('service_id')->unsigned();
            $table->integer('material_id')->unsigned();
        });

        Schema::table('service_materials', function(Blueprint $table) {
            $table->foreign('service_id')->references('id')->on('services')
                ->onDelete('restrict')
                ->onUpdate('restrict');
        });

        Schema::table('service_materials', function(Blueprint $table) {
            $table->foreign('material_id')->references('id')->on('materials')
                ->onDelete('restrict')
                ->onUpdate('restrict');
        });
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
        Schema::table('service_materials', function(Blueprint $table) {
            $table->dropForeign('service_materials_service_id_foreign');
        });

        Schema::table('service_materials', function(Blueprint $table) {
            $table->dropForeign('service_materials_material_id_foreign');
        });

        Schema::drop('service_materials');
	}

}
