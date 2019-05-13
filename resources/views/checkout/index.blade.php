@extends('frontEnd.layouts.master')
@section('title','checkOut Page')
@section('slider')
@endsection
@section('content')

    
    <div class="container">
        @if(Session::has('message'))
            <div class="alert alert-success text-center" role="alert">
                {{Session::get('message')}}
            </div>
        @endif

        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-4">
            <form action="/check-shipping" method="get" class="form-horizontal">
                
                    <div class="login-form"><!--login form-->
                        <input type="hidden" name="_token" value="{{csrf_token()}}">

                        <legend>Pengiriman</legend>

                        {{-- <input type="hidden" name="pengiriman" value="{{$countries}}" > --}}
                        <div class="form-group {{$errors->has('billing_name')?'has-error':''}}">
                            <label for="name">Nama</label>
                            <input type="text" class="form-control" name="nama" id="name" value="{{$user_login->name}}">
                            <span class="text-danger">{{$errors->first('nama')}}</span>
                        </div>

                        <div class="form-group">
                            <label for="name">Kota</label>
                            <select name="kota" id="billing_city" class="form-control">
                                <option>pilih kota tujuan</option>
                                @for($i = 0; $i < count($countries); $i++ )
                                    <option value="{{$countries[$i]["postal_code"]}}">{{$countries[$i]["city_name"].', '.$countries[$i]["province"]}}</option>

                                    {{-- <input type="hidden" name="provinsi" value="{{$countries[$i]["city_name"]}}"> --}}
                                    {{-- <script type="text/javascript">
                                         $(document).ready(function(){
                                            $('#billing_city').click(function(){ 
                                                 var city = $('#billing_city').val();
                                                 console.log(city)
                                                 $('#postal').val(city);
                                                 event.preventDefault();
                                            });
                                    </script> --}}
                                @endfor
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="name">Kode POS</label>
                            <input type="text" id="postal" name="postal" disabled="" class="form-control" >
                        </div>

                         <div class="form-group">
                            <label for="name">Kurir</label>
                            <select name="kurir" id="kurir" class="form-control">
                                <option>pilih kurir</option>
                                @foreach($courier as $courier)
                                    <option value="{{$courier->courier}}">{{$courier->courier}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="name">Alamat Lengkap</label>
                            <input type="text" class="form-control" value="{{$user_login->address}}" name="alamat" id="billing_address" placeholder="Billing Address">
                            <span class="text-danger">{{$errors->first('billing_address')}}</span>
                        </div>
                        
                        <div class="form-group {{$errors->has('billing_mobile')?'has-error':''}}">
                            <label for="name">Nomor Telpon</label>
                            <input type="text" class="form-control" name="telpon" id="billing_mobile" placeholder="Billing Mobile">
                            <span class="text-danger">{{$errors->first('billing_mobile')}}</span>
                        </div>

                        <div class="form-group">
                            <label>Total Harga Cart</label>
                            <input type="text" class="form-control" name="total_price" disabled="" value="Rp {{number_format($total_price)}}">

                        </div>

                        {{-- <span>
                            <input type="checkbox" class="checkbox" name="checkme" id="checkme">Shipping Address same as Billing Address
                        </span> --}}
                        <div style="text-align: center;">
                        <button type="submit" name="submit" class="btn btn-primary">Cek Ongkir</button>
                        </div>
                    </div><!--/login form-->
                
            </form>
        </div>
            <div class="col-sm-1">

            </div>
            @if(isset($service))
            <div class="col-sm-4">
                <form action="/order-review" method="get" class="form-horizontal">
                    <div class="signup-form"><!--login form-->
                        <input type="hidden" name="_token" value="{{csrf_token()}}">

                        <legend>Harga</legend>

                        <input type="hidden" id="total_price" name="total_price" value="{{$total_price}}">
                        <input type="hidden" name="provinsi" value="{{$provinsi}}">
                        <input type="hidden" value="{{$kota}}" name="kota">
                        <input type="hidden" name="alamat" value="{{$alamat}}">
                        <input type="hidden" name="nama" value="{{$nama}}">
                        <input type="hidden" name="telpon" value="{{$telpon}}">
                        <div class="form-group">
                            <label for="name">Kurir</label>
                            <input type="text" disabled="" name="kurir" class="form-control" value="{{$kurir}}">
                        </div>

                        <div class="form-group">
                            <label for="name">Service</label>
                            <select name="service" class="form-control" id="service">
                                <option>pilih service</option>
                                @for($i = 0; $i < count($service); $i++ )
                                    <option value="{{$service[$i]["cost"]["0"]["value"]}}">{{$service[$i]["service"].', estimasi('.$service[$i]["cost"]["0"]["etd"].' hari)'}}</option>
                                @endfor
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Ongkos Kirim</label>
                            <input type="text" name="ongkir" id="ongkir" disabled="" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" name="total" id="total" disabled="" class="form-control">
                        </div>

                        <div style="text-align: center;">
                            <button type="submit" name="submit" class="btn btn-primary">Review Order</button>
                        </div>

                    </div><!--/login form-->
                
            </form>
            </div>
            @endif
            <div class="col-sm-1"></div>
        </div>
    </div>
    <div style="margin-bottom: 20px;"></div>
    <script type="text/javascript">
         $(document).ready(function(){

            $('#billing_city').click(function(){                            
                 var city = $('#billing_city').val();
                 console.log(city)
                 $('#postal').val(city);
                 event.preventDefault();
            });

            $('#service').click(function(){
                 var total = $('#total_price').val();                            
                 var ongkir = $('#service').val();

                 var totall = parseInt(total) + parseInt(ongkir);
                 console.log(ongkir)
                 $('#ongkir').val(ongkir);
                 $('#total').val(totall);
                 event.preventDefault();
            });



        });

    </script>
    
@endsection