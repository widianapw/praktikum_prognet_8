<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product_cat extends Model
{
	protected $table = "product_categories";
	protected $primarykey ="id";
	protected $fillable = [
        'category_name',
    ];
    //
}
