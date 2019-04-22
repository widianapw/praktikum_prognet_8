<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    public function index(){
        $session_id=Session::get('session_id');
        $cart_datas=Cart::select('user_id','product_id','qty','status','session_id','price')
            ->join('products','carts.product_id','=','products.id')
            ->where('session_id',$session_id)->get();
        $total_price=0;
        foreach ($cart_datas as $cart_data){
            $total_price+=$cart_data->price*$cart_data->qty;
        }
        
        // return($cart_datas);
        return view('frontEnd.cart',compact('cart_datas','total_price'));
    }

    public function addToCart(Request $request){
        
        $inputToCart=$request->all();
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        // if($inputToCart['size']==""){
        //     return back()->with('message','Please select Size');
        // }else{
            $stockAvailable=$inputToCart['stock'];
            if($stockAvailable>=$inputToCart['quantity']){
                $inputToCart['user_id']=NULL;
                $session_id=Session::get('session_id');
                if(empty($session_id)){
                    $session_id=str_random(40);
                    Session::put('session_id',$session_id);
                }
                $inputToCart['session_id']=$session_id;
                $count_duplicateItems=Cart::where('product_id',$inputToCart['product_id'])->count();
                if($count_duplicateItems>0){
                    return back()->with('message','This Item Added already');
                }else{
                    
                    $cart = new Cart;
                    $cart->user_id = NULL;
                    $cart->product_id = $request->product_id;
                    $cart->qty = $request->quantity;
                    $cart->session_id = $inputToCart['session_id'];
                    $cart->status = "0";
                    $cart->save();
                    // return($cart);
                    return back()->with('message','Add To Cart Already');
                }
            }else{
                return back()->with('message','Stock is not Available!');
            }
        // }
    }


    public function deleteItem($id=null){
        $delete_item=Cart::findOrFail($id);
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        $delete_item->delete();
        return back()->with('message','Deleted Success!');
    }


    public function updateQuantity($id,$quantity){
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        // $sku_size=DB::table('cart')->select('product_code','size','quantity')->where('id',$id)->first();

        $cart_data = Cart::where('id',$id)->get()->first();
        // return($cart_data->qty);
        $stockAvailable=Product::where('id',$cart_data->product_id)->get()->first();
        $updated_quantity=$cart_data->qty+$quantity;

        if($stockAvailable->stock >= $updated_quantity){
            DB::table('cart')->where('id',$id)->increment('qty',$quantity);
            return back()->with('message','Update Quantity already');
        }else{
            return back()->with('message','Stock is not Available!');
        }
    }


}
