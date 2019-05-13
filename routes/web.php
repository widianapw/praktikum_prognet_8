<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|s
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/list-products','IndexController@shop');
Route::get('/cat/{id}','IndexController@listByCat')->name('cats');
Route::get('/product-detail/{id}','IndexController@detialpro');



Auth::routes(['verify' => true]);

//mengubah route home dan home controller agar ke /
Route::get('/', 'IndexController@index');
Route::get('/home', 'HomeController@index')->name('home')->middleware('verified');


Route::group(['prefix'=>'admin', 'guard'=>'admin'],function(){
    Route::get('/login','AuthAdmin\LoginController@showLoginForm')->name('admin.login');
    Route::post('/headelogin','AuthAdmin\LoginController@login')->name('admin.login.submit');
    Route::get('/','AdminController@index')->name('admin.home');
    Route::resource('/product_cat','ProductCatController');
    Route::resource('/product','ProductController');
    Route::resource('/courier','CourierController');
    Route::resource('/product_img','ProductImgController');
    Route::get('product_img/{product_img}','ProductImgController@destroy');
});

Route::group(['guard'=>'web'],function (){
    
    Route::post('/addToCart','CartController@addToCart')->name('addToCart');
    Route::get('/viewcart','CartController@index');
    Route::get('/cart/deleteItem/{id}','CartController@deleteItem');
    Route::post('/cart/update/{cart}','CartController@update')->name('cart.update');
    Route::get('/check-out','CheckOutController@index');
    Route::get('/check-shipping','CheckOutController@checkshipping');
    Route::post('/submit-checkout','CheckOutController@submitcheckout');
    Route::get('/order-review','OrderController@index');
    Route::post('/submit-order','OrderController@order');
    Route::get('/cod','OrderController@cod');
    Route::get('/paypal','OrdersController@paypal');
});



// Route::get('/myaccount','UsersController@account');
// Route::put('/update-profile/{id}','UsersController@updateprofile');
// Route::put('/update-password/{id}','UsersController@updatepassword');


// Route::post('/submit-checkout','CheckOutController@submitcheckout');

// Route::get('/order-review','OrdersController@index');
// Route::post('/submit-order','OrdersController@order');
// Route::get('/cod','OrdersController@cod');
// Route::get('/paypal','OrdersController@paypal');




