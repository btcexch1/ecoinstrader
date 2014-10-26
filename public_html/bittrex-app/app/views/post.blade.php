@extends('layouts.main')
@section('title')
{{{$post->title}}}
@stop
@section('body')
<div class="container">
  	<div class="content">
  		<h1>{{{ $post->title}}}</h1>
		<div class="content-body">
			{{$post->body}}
		</div>
  	</div>
</div>
@stop