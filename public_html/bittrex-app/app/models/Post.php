<?php
class Post extends Eloquent
{
	protected $table = 'posts';
	public function cleanText($text){		
		return preg_replace("/[^a-zA-Z0-9\-]/", "", strtolower($text));
	}

	public function createPermalink($text){
		$text = trim($text);
		$check = Post::where('title',$text)->count();
		if($check>0) $text .= ' '.($check+1);
		$text = str_replace(" ","-",$text);
		$permalink = $this->cleanText($text);
		return $permalink;
	}
}
?>