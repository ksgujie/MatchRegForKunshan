@extends('layouts.main')

@section('content')

<div id="main_body">    
	
{{Form::model($student)}}
	@include('student._form')
{{Form::close()}}

</div>

@stop