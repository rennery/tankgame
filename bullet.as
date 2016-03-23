package {
	
	import flash.display.MovieClip;
	
	
	public class bullet extends MovieClip implements models{
		public var useful:Boolean;
		public var speedx,speedy:int;
		public var addable:Boolean;
		public var power:Boolean;
		public function bullet() {
			useful=true;
			// constructor code
			x=0;
			y=0;
			addable=true;
			power=true;
		}
		
		public function upgrad(){
			
		}
	}
	
}
