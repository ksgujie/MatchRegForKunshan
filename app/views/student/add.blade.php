@extends('layouts.main')

@section('content')

<div id="main_body">    
	
{{Form::open()}}
	@include('student._form')
{{Form::close()}}

</div>

@stop