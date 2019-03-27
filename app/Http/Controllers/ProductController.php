<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');}
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = Product::get();
        return view("/admin/product/index",compact("index"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("/admin/product/create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = new Product;
        $product->product_name= $request->nama_produk;
        $product->price= $request->harga;
        $product->description= $request->deskripsi;
        $product->product_rate= $request->rating;
        $product->stock= $request->stok;
        $product->weight= $request->berat;
        $product->save();
        return redirect('/admin/product');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $test = Product::find($product)->first();
        return view("/admin/product/edit",compact("test"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $product->product_name= $request->nama_produk;
        $product->price= $request->harga;
        $product->description= $request->deskripsi;
        $product->product_rate= $request->rating;
        $product->stock= $request->stok;
        $product->weight= $request->berat;
        $product->save();
        return redirect('/admin/product');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(product $product)
    {
        //
    }
}
