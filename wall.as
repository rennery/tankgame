package  {
	
	import flash.display.MovieClip;
	
	
	public class wall extends MovieClip implements models {
		private var dir_local:int;
		
		public function wall() {
			// constructor code
		}
		public function setP(xx:int, yy:int):void{
			x=xx;
			y=yy;
		}
		public function setDir(direct:int):void{
			if(dir_local==0){  //0 right 1 up 2 left 3 down
				if(direct==1){
					  rotation=180;
					  rotation=90;
					}
				if(direct==2){
					  rotation=180;
					}
				if(direct==3){
					  rotation=90;
					}
			} // 0 means right;
			if(dir_local==1){
				if(direct==0){
					 
					  rotation=90;
					}
				if(direct==2){
					  rotation=180;
					  rotation=90;
					}
				if(direct==3){
					  rotation=180;
					}
			} // 1 means up;
			if(dir_local==2){
				if(direct==0){ 
					  rotation=180;
					}
				if(direct==1){
					  rotation=90;
					}
				if(direct==3){
					  rotation=180;
					  rotation=90;
					}
			} // 2 means left;
			
			if(dir_local==3){
				if(direct==0){ 
					  rotation=180;
					  rotation=90;
					}
				if(direct==1){
					  rotation=180;
					}
				if(direct==2){
					  rotation=90;
					}
			} // 2 means left;
		}
	}
	
}
