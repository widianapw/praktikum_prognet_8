<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = "products";
	protected $primarykey ="id";
	protected $fillable = [
        'product_name','price','description','product_rate','stock','weight',
    ];}
