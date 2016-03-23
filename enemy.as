package {
	
	import flash.display.MovieClip;
	
	
	public class enemy extends MovieClip implements models{
		private var health:int =3;
		private var dir_local;
		private var speedx,speedy:int;
		public var power:Boolean;
		public function enemy() {
			// constructor code
			speedx=0;
			power=true;
			speedy=0;
		
		}
		public function setP(xx:int, yy:int):void{
			x=xx;
			y=yy;
		}
		public function go(){
			speedx=0;
			speedy=0;
			if(rotation==0 && y>90){
				speedy=-6;
			}
			if(rotation==0 && y<=90){
				speedy=6;
				rotation=180;
			}
			if(rotation==90 && x<=910){
				speedx=6;
			}
			if(rotation==90 && x>910){
				speedx=-6;
				rotation=-90;
			}
			if(rotation==180 && y<530){
				speedy=6;
			}
			if(rotation==180 && y>=530){
				speedy=-6;
				rotation=0;
			}
			if(rotation==-90 && x<=130){
				speedx=6;
				rotation=90;
			}
			if(rotation==-90 && x>130){
				speedx=-6;
			}
			x=x+speedx;
			y=y+speedy;
			
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
